import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:liquede/commons/base_scaffold.dart';
import 'package:liquede/commons/constants.dart';
import 'package:liquede/commons/reusables.dart';
import 'package:liquede/commons/utils.dart';
import 'package:liquede/extensions/widget.dart';
import 'package:liquede/presentation/commons/bottom_sheet.dart';
import 'package:liquede/services/api/base_service.dart';
import 'package:liquede/services/api/user_service.dart';
import 'package:liquede/services/api/wallet_service.dart';
import 'package:swagger/api.dart';

import 'list_item_selection.dart';

typedef AmountCallback<T> = String Function(int index, T data);

class BillsPurchase<T> extends StatefulWidget {
  const BillsPurchase(
      {Key? key,
      required this.title,
      this.options,
      this.streamData,
      required this.customerIdHint,
      required this.builder,
      required this.closeOnSelect,
      this.customerIdValidator,
      this.amountCallback,
      required this.onPaymentAttempt,
      required this.optionHint,
      required this.image})
      : super(key: key);
  final PaymentWidgetStream<T>? streamData;
  final List<T>? options;
  final AmountCallback<T>? amountCallback;
  final PaymentWidgetItemBuilder<T>? builder;
  final bool closeOnSelect;
  final String title;
  final String optionHint;
  final String? customerIdHint;
  final FormFieldValidator? customerIdValidator;
  final MakePayment<T> onPaymentAttempt;
  final String image;

  @override
  State<BillsPurchase<T>> createState() => _BillsPurchaseState<T>();
}

class _BillsPurchaseState<T> extends State<BillsPurchase<T>> {
  var selectedItem;

  PaymentWidgetStream<T>? _streamData;
  List<T>? _options;
  AmountCallback<T>? _amountCallback;
  late PaymentWidgetItemBuilder<T>? _builder;
  final _key = GlobalKey<FormState>();
  // late PaymentSelectionCallback<T>? _onItemSelected;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _streamData = widget.streamData;
    _options = widget.options?.cast<T>();
    _amountCallback = widget.amountCallback;
    _builder = widget.builder;
    amountProps = KInputFieldProps(
        textEditingController: TextEditingController(),
        inputType: TextInputType.number,
        enabled: _amountCallback == null,
        hint: "Amount",
        inputFormatter: [
          CurrencyTextInputFormatter(symbol: nairaSymbol, decimalDigits: 0)
        ]);
    customer = KInputFieldProps(
        textEditingController: TextEditingController(),
        inputType: TextInputType.number,
        onChange: (e) {
          print(e);
          setState(() {});
        },
        hint: widget.customerIdHint,
        validators: widget.customerIdValidator == null
            ? []
            : [widget.customerIdValidator!]);
  }

  late KInputFieldProps amountProps;
  late KInputFieldProps customer;
  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      context: context,
      title: widget.title,
      baseBody: Form(
        key: _key,
        autovalidateMode: AutovalidateMode.always,
        onChanged: () {
          setState(() {});
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            addSpace(y: 30),
            ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.asset(
                  widget.image,
                  height: 70,
                  width: 70,
                )).center,
            addSpace(y: 40),
            kText(widget.customerIdHint, fontSize: 10).paddingLeft(4),
            EditTextField(customer),
            addSpace(y: 40),
            getOptionsWidget(),
            kText("Enter Amount", fontSize: 10).paddingLeft(4),
            EditTextField(amountProps),
            Spacer(),
            appBtn("Pay", () => makePayment(selectedItem)),
            addSpace(y: 50)
          ],
        ).paddingX(20),
      ),
    );
  }

  Widget getOptionsWidget() {
    Widget c;
    if (widget.customerIdValidator == null) {
      if (_streamData != null) {
        c = buildStreamDropdown();
      } else if (_options != null) {
        c = buildDropDown(_options ?? []);
      } else {
        return const SizedBox();
      }
    } else if (_key.currentState?.validate() == true) {
      if (_streamData != null) {
        c = buildStreamDropdown();
      } else if (_options != null) {
        c = buildDropDown(_options ?? []);
      } else {
        return const SizedBox();
      }
    } else {
      c = EditTextField(KInputFieldProps(
          hint: widget.optionHint,
          enabled: false,
          textEditingController: TextEditingController()));
    }

    return Column(
      children: [
        c,
        addSpace(y: 40),
      ],
    );
  }

  Widget buildStreamDropdown() {
    return StreamBuilder<NetworkEvent<List<T>>>(
        stream: _streamData!(customer.textEditingController?.text),
        builder: (context, snapshot) {
          if (snapshot.data?.type == NetworkEventType.processing) {
            return Center(
              child: appLoadingWidget,
            );
          }
          if (snapshot.data?.type == NetworkEventType.failed) {
            return Column(
              children: [kText(snapshot.data?.message ?? "An Error Occurred")],
            );
          }
          if (snapshot.data?.type == NetworkEventType.completed) {
            return buildDropDown(snapshot.data?.data ?? []);
          }
          return SizedBox();
        });
  }

  Widget buildDropDown(List<T> option) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(4),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
            color: Colors.grey[200],
            border:
                Border(bottom: BorderSide(width: 2, color: Colors.grey[700]!))),
        child: DropdownButton<T>(
          value: selectedItem,
          isDense: false,
          isExpanded: true,
          underline: SizedBox(),
          onChanged: (v) {
            selectedItem = v;
            if (_amountCallback != null) {
              amountProps.textEditingController?.text = _amountCallback!(0, v!);
            }
          },
          items: option
              .map((e) => DropdownMenuItem(
                    child: _builder!(context, e),
                    value: e,
                    onTap: () {
                      setState(() {
                        selectedItem = e;
                      });
                    },
                  ))
              .toList(),
          hint: kText(widget.optionHint),
        ),
      ),
    );
  }

  void makePayment(T? data) {
    showPinModal(context, (p0) {
      goBack(context);
      widget.onPaymentAttempt(
          data,
          (amountProps.textEditingController?.text ?? "0")
              .replaceAll(nairaSymbol, "")
              .replaceAll(",", ""),
          customer.textEditingController?.text ?? "",
          p0);
    });
  }
}

void showPinModal(BuildContext context, Function(String) onPinEntered) {
  TextEditingController controller = TextEditingController();
  if(WalletService.I(context).walletPin.isEmpty){
    showErrorPopUp(context, "You need to create Wallet pin to proceed.", buttonText: "Create Pin", onClose: (){
      showCreatePinModal(context, () => showPinModal(context, onPinEntered));
    });
    return;
  }

  launchBottomSheetFull(
      context,
      Column(
        children: [
          kText("Enter your pin", weight: FontWeight.w900, fontSize: 24)
              .paddingX(40),
          addSpace(y: 20),
          addSpace(y: 30),
          EditTextField(KInputFieldProps(
              textEditingController: controller,
              fillColor: Colors.grey[200],
              textAlign: TextAlign.center,
              inputType: TextInputType.number,
              isPassword: true,
              inputFormatter: [
                LengthLimitingTextInputFormatter(4),
                FilteringTextInputFormatter.digitsOnly
              ],
              style: KTextStyle(
                      weight: FontWeight.bold,
                      letterSpacing: 10,
                      fontSize: 24,
                      style: const TextStyle(letterSpacing: 5))
                  .build)),
          addSpace(y: 20),
          MaterialButton(
            onPressed: () => onPinEntered(controller.text),
            child: kText("Pay", color: white, weight: FontWeight.bold),
            color: black,
          ).stretchSize(h: 45),
        ],
      ),
      hFactor: 0.6);
}

void showCreatePinModal(BuildContext context, Function onPinCreated) {
  TextEditingController controller = TextEditingController();
  launchBottomSheetFull(
      context,
      Column(
        children: [
          kText("Create new pin", weight: FontWeight.w900, fontSize: 24)
              .paddingX(40),
          addSpace(y: 20),
          addSpace(y: 30),
          EditTextField(KInputFieldProps(
              textEditingController: controller,
              fillColor: Colors.grey[200],
              textAlign: TextAlign.center,
              inputType: TextInputType.number,
              isPassword: true,
              inputFormatter: [
                LengthLimitingTextInputFormatter(4),
                FilteringTextInputFormatter.digitsOnly
              ],
              style: KTextStyle(
                      weight: FontWeight.bold,
                      letterSpacing: 10,
                      fontSize: 24,
                      style: const TextStyle(letterSpacing: 5))
                  .build)),
          addSpace(y: 20),
          MaterialButton(
            onPressed: () {
             createPin(context,int.tryParse(controller.text)??0, onPinCreated);
            },
            child: kText("Create", color: white, weight: FontWeight.bold),
            color: black,
          ).stretchSize(h: 45),
        ],
      ),
      hFactor: 0.6);
}

void createPin(BuildContext context, int pin, Function onPinCreated) {
  var id = UserService.I(context).userView?.id;
  WalletService.I(context)
      .createPin(WalletPinModel()
        ..pin = pin
        ..userId = id)
      .handleStateAndPerformOnSuccess(context, (p0) {
      goBack(context);
    showSuccessPopUp(context, "Pin Created Successfully",
        onClose: onPinCreated);

  });
}
