import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:liquede/commons/constants.dart';
import 'package:liquede/commons/reusables.dart';
import 'package:liquede/commons/utils.dart';
import 'package:liquede/extensions/widget.dart';
import 'package:liquede/extensions/String.dart';

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

  late TextEditingController _controller;
  late KInputFieldProps prop;

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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            EditTextField(KInputFieldProps(
                context: context,
                hint: "What are you saving for",
                textEditingController: TextEditingController())),
            addSpace(y: 20),
            EditTextField(KInputFieldProps(
                context: context,
                hint: "Enter Target amount",
                textEditingController: TextEditingController(),
                inputType: TextInputType.number)),
            addSpace(y: 20),
            Container(
              decoration: BoxDecoration(
                  color: Colors.grey[100],
                  border:
                  const Border(bottom: BorderSide(width: 1, color: black))),
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  kText("Set Target Date",
                      weight: FontWeight.normal, color: grey),
                  const Icon(Icons.arrow_drop_down)
                ],
              ).stretchSize(h: 50).onclickWithRipple(selectPaymentSource),
            ),
            addSpace(y: 20),
            Container(
              decoration: const BoxDecoration(
                  border:
                  Border(bottom: BorderSide(width: 0.5, color: grey))),
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset("automate_goal".imagePng, height: 15, width: 15, color: black,),
                  addSpace(x: 20),
                  kText("Automate this goal",
                      weight: FontWeight.normal, color: Colors.black, fontSize: 13),
                  const Spacer(),
                  const Icon(Icons.arrow_forward_ios, size: 13,)
                ],
              ).stretchSize(h: 45).onclickWithRipple(selectPaymentSource),
            ),
            kText("Optional", fontSize: 11,weight: FontWeight.normal, color: grey).paddingY(6).left,
            addSpace(y: 30),
            previewCard(200),
            addSpace(y: 20),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Checkbox(
                  value: false,
                  onChanged: (v) {},
                ),
                kText(authText, a: TextAlign.justify, fontSize: 13)
                    .paddingY(15)
                    .stretch,
              ],
            ).paddingRight(10),
            MaterialButton(
              onPressed: createGoal,
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

  String authText =
  """I authorize Lquede to debit my card or LiquedeFlex to the tune of amount i entered for a periodic savings at the date i have designated. I also acknowledge that i will be charged a fee if i terminate this liquedegoal before the provided target date.
  """;

  void createGoal() {
    showSuccessPopUp(context, "LiquedeGoal successfully created", onClose: () {
      goBack(context);
    });
  }
}

Widget previewCard(double amount) {
  KTextStyle label = KTextStyle(
      fontSize: 14, color: Colors.grey[600], weight: FontWeight.w500);
  KTextStyle value =
  KTextStyle(fontSize: 15, color: Colors.black, weight: FontWeight.bold);
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
                  kText("Amount to Seal", defaultStyle: label.build!, fontSize: 13),
                  addSpace(y: 5),
                  kText(formatMoney(amount), defaultStyle: value.build!),
                ],
              ),
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  kText("Interest to earn", defaultStyle: label.build!, fontSize: 12),
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
                text: "3rd of Feb 2021",
                style: KTextStyle(style: value.build!)),
            ManyText(
                text: "/10 Days",
                style: KTextStyle(style: value.build!, fontSize: 12))
          ], style: value),
          addSpace(y: 20),
          kText("Automation", defaultStyle: label.build!, fontSize: 12),
          kText("${formatMoney(25000)}/3rd of every month", defaultStyle: value.build!),
          addSpace(y: 20),
          kText("Projected completion date", defaultStyle: label.build!, fontSize: 12),
          kText("03/01/22", defaultStyle: value.build!,),
        ],
      ).paddingAll(20),
    ),
  );
}
