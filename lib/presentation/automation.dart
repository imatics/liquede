import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';
import 'package:liquede/commons/base_scaffold.dart';
import 'package:liquede/commons/reusables.dart';
import 'package:liquede/commons/utils.dart';
import 'package:liquede/extensions/string.dart';
import 'package:liquede/extensions/widget.dart';

import '../commons/constants.dart';

class Automation extends StatefulWidget {
  const Automation({Key? key, required this.title, this.goalAutomationData}) : super(key: key);
  final String title;
  final Map? goalAutomationData;

  @override
  State<Automation> createState() => _AutomationState();
}

class _AutomationState extends State<Automation> {

  late KInputFieldProps amountProp, dateProp, paymentSourceProp;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    amountProp = KInputFieldProps(
        textEditingController: TextEditingController(),
        inputType: TextInputType.number,

        inputFormatter: [CurrencyTextInputFormatter(symbol: nairaSymbol, decimalDigits: 0)],
        inputDecoration: getUnderLineDecoration(
            counter: const SizedBox(),
            borderColor: black,
            radius: 5,
            hint: "Enter amount",
            label: "Amount to save each time",
            borderWidth: 1),
        style: KTextStyle(color: black,fontSize: 12, weight: FontWeight.bold).build);
    dateProp = KInputFieldProps(
        textEditingController: TextEditingController(),
        inputType: TextInputType.none,
        readOnly: true,
        onclick: _showPicker,
        inputDecoration: getUnderLineDecoration(
            counter: const SizedBox(),
            borderColor: black,
            hint: "Choose a monthly date and time",
            label: "Choose a monthly date and time",
            radius: 5,
            borderWidth: 1),
        style: KTextStyle(color: black,fontSize: 12).build);
    paymentSourceProp = KInputFieldProps(
        textEditingController: TextEditingController(text: "Liquede Flex"),
        inputType: TextInputType.none,
        readOnly: true,
        inputDecoration: getUnderLineDecoration(
            counter: const SizedBox(),
            borderColor: black,
            hint: "",
            label: "Payment Source",
            radius: 5,
            borderWidth: 1),
        style: KTextStyle(color: black,fontSize: 12).build);
    setUp();
  }


  String selected = "";
  @override
  Widget build(BuildContext context) {
    String h = "How often do you want to save";
    return BaseScaffold(
      title: widget.title,
      context: context,
      baseBody: Column(
        children: [
          CustomDropDownField(label: h,hint: h, options: const ["Monthly"], selected: selected,),
          addSpace(y: 20),
          EditTextField(amountProp),
          addSpace(y: 20),
          EditTextField(dateProp),
          addSpace(y: 20),
          EditTextField(paymentSourceProp),
          addSpace(y: 40),
          appBtn("Automate", _buildResult)
        ],
      ).paddingXY(x: 20),
    );
  }



  void setUp(){
    if(widget.goalAutomationData != null){
      amountProp.textEditingController?.text = formatMoney(widget.goalAutomationData!["amount"]??0.0);
      selected  = widget.goalAutomationData!["frequency"];
      dateProp.textEditingController?.text = format1.format(widget.goalAutomationData?["date"]??DateTime.now());
      setState(() {});
    }
  }

  DateTime? targetDate;

  void _showPicker(){
    DatePicker.showDateTimePicker(context,
        showTitleActions: true,
        minTime: DateTime(2018, 3, 5),
        maxTime: DateTime(2019, 6, 7), onChanged: (date) {
        }, onConfirm: (date) {
          targetDate = date;
          dateProp.textEditingController?.text = DateFormat('yyyy-MM-dd – kk:mm').format(date);
          setState(() {});
        }, currentTime: DateTime.now(), locale: LocaleType.en);
  }

  void _buildResult() {
    goBack(context, result: {
    "amount": amountProp.textEditingController?.text.cleanMoneyValue,
    "frequency" : selected ,
    "date": targetDate
    });
  }
}
