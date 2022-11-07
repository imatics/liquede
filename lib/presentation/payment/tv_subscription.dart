import 'package:animations/animations.dart';
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:liquede/commons/base_scaffold.dart';
import 'package:liquede/commons/constants.dart';
import 'package:liquede/commons/reusables.dart';
import 'package:liquede/commons/utils.dart';
import 'package:liquede/extensions/string.dart';
import 'package:liquede/extensions/widget.dart';
import 'package:liquede/services/api/base_service.dart';
import 'package:liquede/services/api/bills_service.dart';
import 'package:liquede/services/api/user_service.dart';
import 'package:liquede/services/api/wallet_service.dart';
import 'package:swagger/api.dart';

class TvSubscription extends StatefulWidget {
  const TvSubscription({Key? key, required this.serviceType}) : super(key: key);
  final String serviceType;

  @override
  State<TvSubscription> createState() => _TvSubscriptionState();
}

class _TvSubscriptionState extends State<TvSubscription> {
  late KInputFieldProps accountNumberProps;
  late KInputFieldProps customer;

  final _key1 = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    accountNumberProps = KInputFieldProps(
        textEditingController: TextEditingController(),
        inputType: TextInputType.number,
        hint: "Smart Card Number",
        onChange: validateUserInfo,
        validators: [validateField]);

    customer = KInputFieldProps(
      textEditingController: TextEditingController(),
      inputType: TextInputType.none,
      readOnly: true,
      hint: "John Doe",
      validators: [validateField],
      style: KTextStyle(fontSize: 14).build,
      inputFormatter: [
        CurrencyTextInputFormatter(symbol: nairaSymbol, decimalDigits: 0)
      ],
    );
    getBouquet();
  }

  int _currentPage = 1;
  bool reverse = false;

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      context: context,
      title: "TV Subscription",
      baseBody: buildBody(),
    );
  }

  void next() {
    setState(() {
      _currentPage++;
      reverse = false;
    });
  }

  void back() {
    setState(() {
      _currentPage--;
      reverse = true;
    });
  }

  Widget buildBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        addSpace(y: 10),
        Image.asset(widget.serviceType.imagePng, width: 80, height: 80)
            .center
            .paddingAll(20),
        addSpace(y: 20),
        kText("Smart Card Number", fontSize: 11, weight: FontWeight.w600)
            .paddingAll(5),
        EditTextField(accountNumberProps),
        addSpace(y: 20),
        kText("Customer", fontSize: 11, weight: FontWeight.w600).paddingAll(5),
        EditTextField(customer),
        addSpace(y: 20),
        kText("Bouquet", fontSize: 11, weight: FontWeight.w600).paddingAll(5),
        buildDropDown(),
        const Spacer(),
        appBtn("Pay", processPayment),
        addSpace(y: 50),
      ],
    ).withForm(_key1).paddingX(20);
  }

  ProviderBouquetResponse? _selectedItem;

  Widget buildDropDown() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(4),
      child: Container(
        // padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
        // decoration: BoxDecoration(
        //     color: Colors.grey[200],
        //     border:
        //         Border(bottom: BorderSide(width: 2, color: Colors.grey[700]!))),
        child: DropdownButtonFormField<ProviderBouquetResponse>(
          value: _selectedItem,
          isExpanded: true,
          decoration: getUnderLineDecoration(borderWidth: 0, fillColor: grey_50, insets: const EdgeInsets.symmetric(horizontal: 10, vertical: 0)),
          validator: (e){
            if(e == null){
              return "Please select bouquet";}
            return null;
          },
          // underline: const SizedBox(),
          onChanged: (v) {
            _selectedItem = v;
            //clearInfoCache();
          },
          items:
              (BillsService.I(context).providerBouquet?[widget.serviceType] ??
                      [])
                  .map((e) => DropdownMenuItem(
                        child: kText(
                            "${e.name} - ${formatMoney(e.availablePricingOptions.first.price?.toDouble())}",
                            fontSize: 13),
                        value: e,
                        onTap: () {
                          setState(() {
                            _selectedItem = e;
                          });
                        },
                      ))
                  .toList(),
          hint: kText("Select Bouquet", fontSize: 14),
        ),
      ),
    );
  }

  Future<bool> shouldPop() async {
    if (_currentPage != 1) {
      back();
      return false;
    }
    return true;
  }

  void processPayment() {
    if(_key1.currentState?.validate() != true){
      return;
    }
    BillsService.I(context)
        .renewSubscriptions(SubscriptionModel()
          ..serviceType = widget.serviceType
          ..isBoxOffice = false
          ..smartcardNumber = accountNumberProps.textEditingController?.text
          ..totalAmount =
              "${_selectedItem?.availablePricingOptions.first.price}"
          ..productMonthsPaidFor = "1"
          ..productCode = _selectedItem?.code)
        .listen((event) {
      event.handleStateAndPerformOnSuccess(context, (p0) {
        showSuccessPopUp(context, event.message, onClose: () {
          goBack(context);
        });
      });
    });
  }

  void validateUserInfo(String e) {
    if (e.length != 10) {
      return;
    }
    BillsService.I(context)
        .validateAccount(widget.serviceType,
            accountNumberProps.textEditingController?.text ?? "")
        .handleStateAndPerformOnSuccess(context, (p0) {
      customer.textEditingController?.text = p0.user?.name ?? "";
    });
  }

  void getBouquet() {
    BillsService.I(context)
        .getProviderBouquet(widget.serviceType)
        .handleStateAndPerformOnSuccess(context, (p0) {
      setState(() {});
    });
  }
}
