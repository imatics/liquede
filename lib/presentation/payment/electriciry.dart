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
import 'package:swagger/api.dart';

class Electricity extends StatefulWidget {
  const Electricity({Key? key}) : super(key: key);

  @override
  State<Electricity> createState() => _ElectricityState();
}

class _ElectricityState extends State<Electricity> {
  late KInputFieldProps meterNumberProps;
  late KInputFieldProps amount;
  // late KInputFieldProps customer;

  final _key1 = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    meterNumberProps = KInputFieldProps(
        textEditingController: TextEditingController(),
        inputType: TextInputType.number,
        hint: "Meter Number",
        // onChange: validateUserInfo,
        validators: [validateField]);


    amount = KInputFieldProps(
      textEditingController: TextEditingController(),
      inputType: TextInputType.number,
      hint: "Amount",
      validators: [validateField],
      style: KTextStyle(fontSize: 14).build,
      inputFormatter: [
        CurrencyTextInputFormatter(symbol: nairaSymbol, decimalDigits: 0)
      ],
    );
    getProvider();
  }

  int _currentPage = 1;
  bool reverse = false;

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      context: context,
      title: "Electricity",
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
        Image.asset("electricity".imagePng, width: 50, height: 50)
            .center
            .paddingAll(20),
        addSpace(y: 20),
        kText("Service Type", fontSize: 11, weight: FontWeight.w600).paddingAll(5),
        buildTypeDropDown(),
        addSpace(y: 20),
        kText("Meter Card Number", fontSize: 11, weight: FontWeight.w600)
            .paddingAll(5),
        EditTextField(meterNumberProps),
        addSpace(y: 20),
        kText("Provider", fontSize: 11, weight: FontWeight.w600).paddingAll(5),
        buildDropDown(),
        addSpace(y: 20),
        // addSpace(y: 20),
        // kText("Customer", fontSize: 11, weight: FontWeight.w600).paddingAll(5),
        // EditTextField(customer),
        addSpace(y: 20),
        kText("Amount", fontSize: 11, weight: FontWeight.w600).paddingAll(5),
        EditTextField(amount),
        const Spacer(),
        appBtn("Pay", processPayment),
        addSpace(y: 50),
      ],
    ).withForm(_key1).paddingX(20);
  }

  ProviderResponse? _selectedItem;
  String? _selectedType;
  List<String> providers = ["Prepaid","Postpaid"];

  Widget buildDropDown() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(4),
      child: DropdownButtonFormField<ProviderResponse>(
        value: _selectedItem,
        isExpanded: true,
        decoration: getUnderLineDecoration(borderWidth: 0, fillColor: grey_50, insets: const EdgeInsets.symmetric(horizontal: 10, vertical: 0)),
        validator: (e){
          if(e == null){
            return "Please select bouquet";}
          return null;
        },
        onChanged: (v) {
          _selectedItem = v;
        },
        items:
        (BillsService.I(context).electricProviders?.providers??
            [])
            .map((e) => DropdownMenuItem(
          child: kText(e.name,
              fontSize: 13),
          value: e,
          onTap: () {
            setState(() {
              _selectedItem = e;
            });
          },
        ))
            .toList(),
        hint: kText("Select Provider", fontSize: 14),
      ),
    );
  }

  Widget buildTypeDropDown() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(4),
      child: DropdownButtonFormField<String>(
        value: _selectedType,
        isExpanded: true,
        decoration: getUnderLineDecoration(borderWidth: 0, fillColor: grey_50, insets: const EdgeInsets.symmetric(horizontal: 10, vertical: 0)),
        validator: (e){
          if(e == null){
            return "Select";}
          return null;
        },
        onChanged: (v) {
          _selectedType = v;
        },
        items:
            providers.map((e) => DropdownMenuItem(
          child: kText(e, fontSize: 13),
          value: e,
          onTap: () {
            setState(() {
              _selectedType = e;
            });
          },
        ))
            .toList(),
        hint: kText("Select Bouquet", fontSize: 14),
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

    PurchaseElectricityModel model = PurchaseElectricityModel();
    model.amount = amount.textEditingController?.text.cleanMoneyValue.toInt();
    model.accountNumber = meterNumberProps.textEditingController?.text;


    if(_selectedType == providers.first){
      BillsService.I(context)
          .purchasePrePaidElectricity(model)
          .listen((event) {
        event.handleStateAndPerformOnSuccess(context, (p0) {
          showSuccessPopUp(context, event.message, onClose: () {
            goBack(context);
          });
        });
      });
    }else{
      BillsService.I(context)
          .purchasePostPaidElectricity(model)
          .listen((event) {
        event.handleStateAndPerformOnSuccess(context, (p0) {
          showSuccessPopUp(context, event.message, onClose: () {
            goBack(context);
          });
        });
      });
    }



  }

  void validateUserInfo(String e) {
    if (e.length != 10) {
      return;
    }

  }

  void getProvider() {
    BillsService.I(context)
        .getElectricityProviders()
        .handleStateAndPerformOnSuccess(context, (p0) {
      setState(() {});
    });
  }
}
