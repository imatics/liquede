import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:liquede/commons/base_scaffold.dart';
import 'package:liquede/commons/constants.dart';
import 'package:liquede/commons/encryption.dart';
import 'package:liquede/commons/extenstions.dart';
import 'package:liquede/commons/utils.dart';
import 'package:liquede/extensions/string.dart';
import 'package:liquede/extensions/widget.dart';
import 'package:liquede/presentation/commons/bottom_sheet.dart';
import 'package:liquede/services/api/base_service.dart';
import 'package:liquede/services/api/saving_service.dart';
import 'package:liquede/services/api/wallet_service.dart';
import 'package:swagger/api.dart';

import '../../commons/reusables.dart';

class GoalDetails extends StatefulWidget {
  const GoalDetails({Key? key, required this.savingsView}) : super(key: key);
  final SavingsView savingsView;

  @override
  State<GoalDetails> createState() => _GoalDetailsState();
}

class _GoalDetailsState extends State<GoalDetails> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getWithdrawalPenalty();
    try{
      progress = (widget.savingsView.amount??0).percentOf(widget.savingsView.targetAmount??0);
    }catch(e){
      progress = 0;
    }

  }

  @override
  Widget build(BuildContext context) {
    print(widget.savingsView.toJson());
    return BaseScaffold(
      context: context,
      title: widget.savingsView.name,
      baseBody: _buildBody(),
    );
  }

  double progress = 0;

  Widget _buildBody() {
    print(progress);
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                shape: BoxShape.circle,
              color: Colors.grey[900]
            ),
            height: 110,
            width: 110,
            padding: const EdgeInsets.all(10),
            child: Stack(
              fit: StackFit.expand,
              alignment: Alignment.center,
              children: [
                CircularProgressIndicator(
                  color:  Colors.amber[900],
                  strokeWidth: 25,
                  backgroundColor: Colors.amber[100],
                  value: progress,
                ),
                Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      border: Border.all(color: Colors.grey, width: 0.5)),
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      kText("${widget.savingsView.amount?.percentOf(widget.savingsView.targetAmount??0).toInt()}%", fontSize: 16, weight: FontWeight.w900),
                      addSpace(y: 5),
                      kText("Complete", fontSize: 10, weight: FontWeight.w500),
                    ],
                  ),
                ),
              ],
            ).paddingAll(3),
          ).paddingY(30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              labelValue("Value (+ interest)",
                  formatMoney(widget.savingsView.amount ?? 0.0)),
              labelValue("Actual Savings",
                  formatMoney(widget.savingsView.amount ?? 0.0),
                  alignment: CrossAxisAlignment.end),
            ],
          ),
          MaterialButton(
                  onPressed: _addMoney,
                  child: kText("Save Now"),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                      side: BorderSide(width: 0.8, color: black)))
              .stretchSize(h: 45)
              .paddingTop(30),
          MaterialButton(
                  onPressed: _withdraw,
                  child: kText("Withdraw",
                      color: Colors.yellow[700], weight: FontWeight.w700))
              .stretchSize(h: 45)
              .paddingTop(20),
        ],
      ).paddingX(20),
    );
  }

  Widget labelValue(String label, String value,
      {CrossAxisAlignment? alignment}) {
    return Column(
      crossAxisAlignment: alignment ?? CrossAxisAlignment.start,
      children: [
        kText(label, fontSize: 11, color: Colors.grey[600]).paddingY(5),
        kText(value, fontSize: 20, weight: FontWeight.w600),
      ],
    );
  }

  void _getWithdrawalPenalty() {
    SavingsService.I(context)
        .getWithdrawalPenalty()
        .handleStateAndPerformOnSuccess(context, (p0) {
      setState(() {});
    });
  }

  void _addMoney() {
    showBottomSheet(false);
  }
  void _withdraw() {
    // showCustomDialog(DialogType.error, context, "Warning", "Premature withdrawal will attract a penalty of $nairaSymbol${SavingsService.I(context).withdrawalPenalty}", "Proceed", () {
    //
    // }, hasClose: true, showIcon: false);
    showBottomSheet(true);
  }

  showBottomSheet(bool withDrw) {
    TextEditingController _controller = TextEditingController();
    var _key = GlobalKey<FormState>();
    List<String> items = ["LiquedeFlex", if(!withDrw)"Card"];
    String? accountSelect;
    launchBottomSheetFull(
        context,
        Scaffold(
          resizeToAvoidBottomInset: true,
          body: SingleChildScrollView(
            child: StatefulBuilder(
              builder: (context, inState) => Column(
                children: [
                  kText(withDrw ?"Withdraw from LiquedeGoal":"Save Into LiqudeGoal ",
                      fontSize: 14, color: Colors.black),
                  addSpace(y: 30),
                  kText(withDrw?"Send To":"Save from", weight: FontWeight.w400, fontSize: 13).left,
                  DropdownButtonFormField<String>(
                    isDense: true,
                    elevation: 0,
                    hint: Text("Select"),
                    validator: validateField,
                    decoration: getUnderLineDecoration(
                        insets: const EdgeInsets.symmetric(
                            vertical: 0, horizontal: 10),
                        fillColor: transparent,
                        borderWidth: 0.5,
                        borderColor: black),
                    // underline: Container(
                    //   height: 1,
                    //   color: black,
                    // ),
                    items: items
                        .map((e) => DropdownMenuItem<String>(
                              value: e,
                              onTap: () {
                                accountSelect = e;
                              },
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  kText(e, fontSize: 15),
                                  if(e != "Card")kText(WalletService.I(context).balance,
                                      fontSize: 15, weight: FontWeight.w600),
                                ],
                              ),
                            ))
                        .toList(),
                    value: accountSelect,
                    onChanged: (e) {
                      accountSelect = e!;
                      inState(() {});
                    },
                  ),
                  addSpace(y: 40),
                  kText("Amount", weight: FontWeight.w400, fontSize: 13).left,
                  EditTextField(KInputFieldProps(
                      textEditingController: _controller,
                      inputDecoration: getUnderLineDecoration(
                          borderColor: black,
                          fillColor: white,
                          activeBorderColor: black,
                          hint: formatMoney(0.0)),
                      fillColor: white,
                      validators: [validateField],
                      inputType: TextInputType.number,
                      style: KTextStyle(fontSize: 15, weight: FontWeight.w500)
                          .build,
                      context: context,
                      inputFormatter: [
                        CurrencyTextInputFormatter(
                            symbol: nairaSymbol, decimalDigits: 0)
                      ])).stretchSize(h: 45),
                  kText("Please note that this withdrawal will attract a penalty of $nairaSymbol${SavingsService.I(context).withdrawalPenalty}",
                          fontSize: 12, color: grey, a: TextAlign.center)
                      .paddingY(20)
                      .hideIf(SavingsService.I(context).withdrawalPenalty == 0 || !withDrw),
                  MaterialButton(
                    onPressed: () => doTransfer(_key, "${_controller.text.cleanMoneyValue??"0.0"}"),
                    child: kText(withDrw? "Withdraw" : "Save Now",
                        weight: FontWeight.bold, color: Colors.white),
                    color: Colors.black,
                  ).stretchSize(h: 45).paddingTop(20),
                ],
              ).withForm(_key).paddingX(10),
            ),
          ),
        ),
        hFactor: 0.7);
  }

  doTransfer(GlobalKey<FormState> key, String amount) {
    if (key.currentState?.validate() == true) {
       SavingsService.I(context).withDrawPrematurely(SavingsWithdrawalModel()..amount = amount ..planId = widget.savingsView.id).handleStateAndPerformOnSuccess(context, (p0) {
         goBack(context);
       });
    }
  }

  addMoney(GlobalKey<FormState> key, String amount) {
    if (key.currentState?.validate() == true) {
      goBack(context);
    }
  }
}
