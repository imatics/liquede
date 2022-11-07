import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';
import 'package:liquede/commons/constants.dart';
import 'package:liquede/commons/overlay.dart';
import 'package:liquede/commons/reusables.dart';
import 'package:liquede/commons/utils.dart';
import 'package:liquede/extensions/widget.dart';
import 'package:liquede/extensions/String.dart';
import 'package:liquede/presentation/automation.dart';
import 'package:liquede/services/api/base_service.dart';
import 'package:swagger/api.dart';

import '../../services/api/saving_service.dart';

class CreateLiquedeGoalPlan extends StatefulWidget {
  const CreateLiquedeGoalPlan({Key? key}) : super(key: key);

  @override
  State<CreateLiquedeGoalPlan> createState() => _CreateLiquedeGoalPlanState();
}

class _CreateLiquedeGoalPlanState extends State<CreateLiquedeGoalPlan> {
  List<String> options = [
    "Set duration by days",
    "Set duration by months",
  ];

  String? selected;
  int valueEntered = 0;

  bool tAndChecked = false;

  late TextEditingController _controller;
  late KInputFieldProps prop;
  late KInputFieldProps nameProp;
  late KInputFieldProps amountProp;
  late KInputFieldProps amountSealProp;
  late KInputFieldProps dateProp;

  Map? goalAutomationData;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = TextEditingController(text: "$valueEntered");
    prop = KInputFieldProps(
        textEditingController: _controller,
        textAlign: TextAlign.center,
        maxLength: 2,
        maxLines: 1,
        fillColor: transparent,
        inputType: TextInputType.number,
        inputDecoration: getDecoration(
            counter: const SizedBox(),
            borderColor: black,
            radius: 5,
            borderWidth: 1),
        style: KTextStyle(color: black, a: TextAlign.center).build);
    amountProp = KInputFieldProps(
        textEditingController: TextEditingController(),
        inputType: TextInputType.number,
        inputFormatter: [
          CurrencyTextInputFormatter(symbol: nairaSymbol, decimalDigits: 0)
        ],
        inputDecoration: getUnderLineDecoration(
            counter: const SizedBox(),
            borderColor: black,
            radius: 5,
            hint: "Enter Target amount",
            label: "Target Amount",
            borderWidth: 1),
        style: KTextStyle(color: black, fontSize: 12, weight: FontWeight.bold)
            .build);

    amountSealProp = KInputFieldProps(
        textEditingController: TextEditingController(),
        inputType: TextInputType.number,
        validators: [
          (e) {
            if (e.cleanMoneyValue >
                (amountProp.textEditingController?.text.cleanMoneyValue ??
                    0.0)) {
              return "Amount to seal can't be more the target amount";
            }
            return null;
          }
        ],
        inputFormatter: [
          CurrencyTextInputFormatter(symbol: nairaSymbol, decimalDigits: 0)
        ],
        inputDecoration: getUnderLineDecoration(
            counter: const SizedBox(),
            borderColor: black,
            radius: 5,
            hint: "Enter amount to Seal",
            label: "Amount to Seal",
            borderWidth: 1),
        style: KTextStyle(color: black, fontSize: 12, weight: FontWeight.bold)
            .build);
    nameProp = KInputFieldProps(
        textEditingController: TextEditingController(),
        inputType: TextInputType.text,
        inputDecoration: getUnderLineDecoration(
            borderColor: black,
            hint: "What are you saving for",
            label: "Plan Name",
            radius: 5,
            borderWidth: 1),
        style: KTextStyle(color: black, fontSize: 12).build);
    dateProp = KInputFieldProps(
        textEditingController: TextEditingController(),
        inputType: TextInputType.none,
        readOnly: true,
        onclick: _showPicker,
        inputDecoration: getUnderLineDecoration(
            counter: const SizedBox(),
            borderColor: black,
            hint: "Target Date",
            label: "Set Target Date",
            radius: 5,
            borderWidth: 1),
        style: KTextStyle(color: black, fontSize: 12).build);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            EditTextField(nameProp),
            addSpace(y: 20),
            EditTextField(amountProp),
            addSpace(y: 20),
            EditTextField(amountSealProp),
            addSpace(y: 20),
            EditTextField(dateProp),
            addSpace(y: 20),
            Container(
              decoration: const BoxDecoration(
                  border: Border(bottom: BorderSide(width: 0.5, color: grey))),
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(
                    "automate_goal".imagePng,
                    height: 15,
                    width: 15,
                    color: goalAutomationData == null ? black : green,
                  ),
                  addSpace(x: 20),
                  kText(
                      goalAutomationData == null
                          ? "Automate this goal"
                          : "Goal automated",
                      weight: FontWeight.normal,
                      color: goalAutomationData == null ? black : green,
                      fontSize: 13),
                  const Spacer(),
                  const Icon(
                    Icons.arrow_forward_ios,
                    size: 13,
                  )
                ],
              ).stretchSize(h: 45).onclickWithRipple(automateGoal),
            ),
            kText("Optional",
                    fontSize: 11, weight: FontWeight.normal, color: grey)
                .paddingY(6)
                .left,
            addSpace(y: 30),
            previewCard(
                amount: amountProp.textEditingController!.text.cleanMoneyValue,
                amountToSeal:
                    amountProp.textEditingController!.text.cleanMoneyValue,
                automation: goalAutomationData,
                maturity: targetDate),
            addSpace(y: 20),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Checkbox(
                  value: tAndChecked,
                  onChanged: (v) => setState(() {
                    tAndChecked = v == true;
                  }),
                ),
                kText(authText, a: TextAlign.justify, fontSize: 13)
                    .paddingY(15)
                    .stretch,
              ],
            ).paddingRight(10),
            MaterialButton(
              onPressed: tAndChecked ? createGoal : null,
              color: black,
              child: kText("Create LiquedeGoal", color: white),
            ).stretchSize(h: 45),
            addSpace(y: 30),
          ],
        ),
      ),
    );
  }

  void selectPaymentSource() {
    showBottomSheetOption(context, "Choose a payment option", [
      OptionsAction("Use LiquedeFlex", () {}, iconData: Icons.add),
      OptionsAction("Use a new card", () {}, iconData: Icons.credit_card),
      OptionsAction("Pay from bank account", () {}, iconData: Icons.apartment),
    ]);
  }

  void automateGoal() {
    goto(
            context,
            Automation(
                title: "Automate Goal", goalAutomationData: goalAutomationData))
        .then((value) {
      setState(() {
        goalAutomationData = value;
      });
    });
  }

  String authText =
      """I authorize Liquede to debit my card or LiquedeFlex to the tune of amount i entered for a periodic savings at the date i have designated. I also acknowledge that i will be charged a fee if i terminate this liquedegoal before the provided target date.
  """;

  void createGoal() {
    SavingsService.I(context)
        .createLiquedeGoal(LiquiedeGoalInput()
          ..durationInDays = targetDate?.difference(DateTime.now()).inDays
          ..description = ""
          ..startDate = DateTime.now()
          ..maturityDate = targetDate
          ..paid = false
          ..debitFrequencyInDays = 30
          ..amount = amountSealProp.textEditingController?.text.cleanMoneyValue
          ..debitFrequencyInDays = 0
          ..monthlyPayment = goalAutomationData?["amount"]
          ..cardId = 0
          ..paymentMethod = "LiquedeFlex"
          ..targetAmount =
              amountProp.textEditingController?.text.cleanMoneyValue
          ..preferredRecurringPaymentDate = goalAutomationData?["date"]
          ..savingPlanTypeId = 1
          ..interestRate = 0
          ..name = nameProp.textEditingController?.text)
        .handleStateAndPerformOnSuccess(context, (p0) {
      showSuccessPopUp(context, "LiquedeGoal successfully created",
          onClose: () {
        goBack(context);
      });
    });
  }

  DateTime? targetDate;

  void _showPicker() {
    showDatePickerDialog(context,
            initialDate: DateTime.now(), firstDate: DateTime.now())
        .then((value) {
      if (value != null) {
        targetDate = value;
        dateProp.textEditingController?.text = format1.format(targetDate!);
        setState(() {});
      }
    });
  }
}

Widget previewCard(
    {double amount = 0,
    double amountToSeal = 0,
    Map? automation,
    DateTime? maturity}) {
  KTextStyle label = KTextStyle(
      fontSize: 14, color: Colors.grey[600], weight: FontWeight.w500);
  KTextStyle value =
      KTextStyle(fontSize: 15, color: Colors.black, weight: FontWeight.bold);

  String fd = ordinal_suffix_of((automation?["date"] as DateTime?)?.day);
  String date = DateFormat("MMM yyyy").format(maturity ?? DateTime.now());
  double instalments = automation?["amount"] ?? 0.0;

  return Material(
    color: const Color(0xFFe3e0c8),
    child: Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          kText("Preview"),
          addSpace(y: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  kText("Amount to Seal",
                      defaultStyle: label.build!, fontSize: 13),
                  addSpace(y: 5),
                  kText(formatMoney(amountToSeal), defaultStyle: value.build!),
                ],
              ),
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  kText("Interest to earn",
                      defaultStyle: label.build!, fontSize: 12),
                  addSpace(y: 5),
                  kRichText([
                    ManyText(
                        text: "0.6332% ",
                        style: KTextStyle(color: Colors.green, fontSize: 12)),
                    ManyText(
                      text: "/${formatMoney(0)}",
                      style: KTextStyle(style: value.build!),
                    )
                  ],
                      style: KTextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          weight: FontWeight.bold)),
                ],
              ),
            ],
          ),
          addSpace(y: 20),
          kText("Maturity Date", defaultStyle: label.build!, fontSize: 12),
          kRichText([
            ManyText(
                text:
                    "${ordinal_suffix_of((maturity ?? DateTime.now()).day)} of $date",
                style: KTextStyle(style: value.build!)),
            ManyText(
                text:
                    " / ${(maturity ?? DateTime.now()).difference(DateTime.now()).inDays} Days",
                style: KTextStyle(style: value.build!, fontSize: 12))
          ], style: value),
          addSpace(y: 20),
          automation == null
              ? SizedBox()
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    kText("Automation",
                        defaultStyle: label.build!, fontSize: 12),
                    kText("$instalments/$fd of every month",
                        defaultStyle: value.build!),
                    addSpace(y: 20),
                  ],
                ),
          kText("Projected completion date",
              defaultStyle: label.build!, fontSize: 12),
          kText(
            format1.format(maturity ?? DateTime.now()),
            defaultStyle: value.build!,
          ),
        ],
      ).paddingAll(20),
    ),
  );
}

String ordinal_suffix_of(i) {
  if (i == null) {
    return "";
  }
  var j = i % 10, k = i % 100;
  if (j == 1 && k != 11) {
    return "${i}st";
  }
  if (j == 2 && k != 12) {
    return "${i}nd";
  }
  if (j == 3 && k != 13) {
    return "${i}rd";
  }
  return "${i}th";
}
