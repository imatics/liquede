import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:liquede/commons/base_scaffold.dart';
import 'package:liquede/commons/constants.dart';
import 'package:liquede/commons/reusables.dart';
import 'package:liquede/commons/size_config.dart';
import 'package:liquede/commons/utils.dart';
import 'package:liquede/extensions/widget.dart';
import 'package:liquede/extensions/string.dart';
import 'package:liquede/presentation/flex_details.dart';
import 'package:liquede/presentation/savings/create_liquede_goal_plan.dart';
import 'package:liquede/presentation/savings/create_liquede_seal_plan.dart';
import 'package:liquede/commons/extenstions.dart';

class Savings extends StatefulWidget {
  const Savings({Key? key}) : super(key: key);

  @override
  State<Savings> createState() => _SavingsState();
}

class _SavingsState extends State<Savings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BaseScaffold(
        context: context,
        implyLeading: false,
        title: "Savings",
        baseBody: Builder(builder: (context) {
          return Container(
            color: Colors.grey[100],
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  card(),
                  addSpace(y: 35),
                  kText("My Active Savings",
                      fontSize: 20, weight: FontWeight.bold),
                  addSpace(y: 10),
                  activeCard(context).onclickWithRipple(() => goto(context, FlexDetails(() => choosePaymentOption(context), () => chooseDestinationOption(context)))),
                  addSpace(y: 20),
                  activeSavingCard(),
                  addSpace(y: 35),
                  kText("New Savings", fontSize: 20, weight: FontWeight.bold),
                  kText("Choose an option below to create a new savings plan",
                      fontSize: 12, color: Colors.grey),
                  addSpace(y: 15),
                  Row(
                    children: [
                      twinCardLiquedeSeal().withElevation(1, r: 10).onclickWithRipple(createLiquedeSealPlan).stretch,
                      addSpace(x: 15),
                      twinCardLiquedeGoal().withElevation(1, r: 10).onclickWithRipple(createLiquedeGoalPlan).stretch
                    ],
                  ).stretchSize(h: 170),
                  addSpace(y: 20)
                ],
              ).paddingX(25),
            ),
          );
        }),
      ),
    );
  }

  Widget card() {
    return Material(
      elevation: 1,
      borderRadius: BorderRadius.circular(10),
      color: black,
      child: Column(
        children: [
          Container(
            height: 40,
            width: double.infinity,
            decoration: const BoxDecoration(
                color: kAppYellow,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10))),
            alignment: Alignment.centerLeft,
            child: kText("Current Highlight",
                    weight: FontWeight.bold, fontSize: 14)
                .paddingXY(
              x: 20,
            ),
          ),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  kText("Balance", color: Colors.grey[600], fontSize: 13),
                  kText(formatMoney(1000),
                      color: Colors.white,
                      weight: FontWeight.bold,
                      fontSize: 23),
                  addSpace(y: 20),
                  kText("Interest Earn", color: Colors.grey[600], fontSize: 13),
                  kText(formatMoney(100),
                      color: Colors.white,
                      weight: FontWeight.bold,
                      fontSize: 17),
                ],
              ).paddingAll(20).stretch,
              Image.asset(
                "path".imagePng,
                height: 150,
              ).paddingTop(10).stretch
            ],
          ),
        ],
      ),
    ).stretchSize(h: 210);
  }

  Widget activeCard(BuildContext context) {
    return Material(
      elevation: 1,
      borderRadius: BorderRadius.circular(10),
      color: white,
      child: Column(
        children: [
          Container(
            height: 35,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.grey[900],
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10))),
            alignment: Alignment.centerLeft,
            child: kText("My LiquedeFlex",
                    weight: FontWeight.bold, fontSize: 14, color: white)
                .paddingXY(
              x: 20,
            ),
          ),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  kText("Balance", fontSize: 12, color: Colors.grey),
                  kText(formatMoney(0),
                          color: black, fontSize: 20, weight: FontWeight.w900)
                      .paddingY(10),
                  Row(
                    children: [
                      Image.asset(
                        "plus".imagePng,
                        width: 45,
                      ).onclickWithRipple(() => choosePaymentOption(context)),
                      addSpace(x: 15),
                      Image.asset(
                        "minus".imagePng,
                        width: 45,
                      ).onclickWithRipple(
                          () => chooseDestinationOption(context)),
                    ],
                  )
                ],
              ).paddingAll(20).stretch,
              kText(longText,
                      fontSize: 13,
                      color: Colors.grey[600],
                      weight: FontWeight.w500)
                  .paddingTop(10)
                  .paddingRight(20)
                  .stretch
            ],
          ),
        ],
      ),
    ).stretchSize(h: 180);
  }

  Widget twinCard(String title, String desc, List<ManyText> text) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        kText(title,
                weight: FontWeight.bold, fontSize: 14, color: Colors.grey[800])
            .paddingXY(y: 15, x: 10),
        const Divider(
          height: 1,
          color: Colors.grey,
        )..paddingY(20),
        addSpace(y: 10),
        kText(desc,
                fontSize: 14, weight: FontWeight.normal, color: Colors.grey[800])
            .paddingX(10),
        addSpace(y: 5),
        kRichText(text,
                style: KTextStyle(
                    weight: FontWeight.normal,
                    fontSize: 13,
                    color: Colors.grey[800]))
            .paddingX(10)
      ],
    );
  }

  Widget twinCardLiquedeSeal() {
    return twinCard(
        "LiquedeSeal", "Keep your money away from unnecessary spending", [
      ManyText(text: "up to"),
      ManyText(text: " 11% ", style: KTextStyle(fontSize: 20)),
      ManyText(text: "Interest rate p.a."),
    ],);
  }

  Widget twinCardLiquedeGoal() {
    return twinCard(
        "LiquedeGoal", "Save towards your goal by yourself or with others", [
      ManyText(text: "up to"),
      ManyText(
          text: " 11% ",
          style: KTextStyle(fontSize: 20, weight: FontWeight.bold)),
      ManyText(text: "Interest rate p.a."),
    ]);
  }

  Widget activeSavingCard(){
    return Material(
      elevation: 1,
      borderRadius: BorderRadius.circular(10),
      color: white,
      child: Column(
        children: [
          Container(
            height: 35,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.grey[900],
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10))),
            alignment: Alignment.centerLeft,
            child: kText("My LiquedeSeal",
                weight: FontWeight.bold, fontSize: 14, color: white)
                .paddingXY(
              x: 20,
            ),
          ),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  kText("Current Balance", fontSize: 12, color: Colors.grey),
                  kText(formatMoney(0),
                      color: black, fontSize: 18, weight: FontWeight.w900)
                      .paddingTop(0),
                  addSpace(y: 15),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          kText("Total at maturity", fontSize: 12, color: Colors.grey[500]),
                          addSpace(y: 5),
                          Container(
                            width: getPercentageWidth(30),
                            decoration: const BoxDecoration(
                              color: kAppYellow,
                              borderRadius: BorderRadius.all(Radius.circular(4))
                            ),
                            child: kText(formatMoney(53999), fontSize: 15, weight: FontWeight.bold).paddingXY(y: 4, x: 10),
                          )
                        ],
                      ),
                      addSpace(x: getPercentageWidth(5)),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          kText("Total at maturity", fontSize: 12, color: Colors.grey[500]),
                          addSpace(y: 5),
                          Container(
                            width: getPercentageWidth(30),
                            decoration: const BoxDecoration(
                                color: kAppYellow,
                                borderRadius: BorderRadius.all(Radius.circular(4))
                            ),
                            child: kText(formatMoney(53999), fontSize: 15, weight: FontWeight.bold).paddingXY(y: 4, x: 10),
                          )
                        ],
                      ),
                    ],
                  )
                ],
              ).paddingAll(20).stretch,

            ],
          ),
        ],
      ),
    ).stretchSize(h: 180);
  }

  String longText =
      "LiquideFlex is like regular bank account but supercharged. You can save into it with 6% interest p.a, make payments, transfers or withdrawals at anytime";

  void choosePaymentOption(BuildContext context) {
    showBottomSheetOption(context, "Choose a payment option", [
      OptionsAction("Use a new card", addMoneyWithCard,
          iconData: Icons.credit_card),
      OptionsAction("Pay from bank account", addMoneyWithCard,
          iconData: Icons.apartment_sharp),
    ]);
  }

  void chooseDestinationOption(BuildContext context) {
    showBottomSheetOption(context, "Choose a payment option", [
      OptionsAction("Bank account", addMoneyWithCard,
          iconData: Icons.apartment_sharp),
      OptionsAction(
          "New Savings Plan",
          [
            () => goBack(context),
            () => delay(500, () => chooseSavingsType(context))
          ].chain(),
          iconData: Icons.extension),
    ]);
  }

  void chooseSavingsType(BuildContext context) {
    showBottomSheetCustomChild(
      context,
      "What kind of savings do you want to start?",
      Row(
        children: [
          twinCardLiquedeSeal()
              .onclickWithRipple([
                () => goBack(context),
                () => delay(500, createLiquedeSealPlan)].chain())
              .withElevation(1, r: 10).stretch,
          addSpace(x: 15),
          twinCardLiquedeGoal()
              .onclickWithRipple([
                () => goBack(context),
                () => delay(500,createLiquedeGoalPlan)].chain())
              .withElevation(1, r: 10).stretch
        ],
      ).stretchSize(h: 170, w: getPercentageWidth(100)),
    );
  }

  void addMoneyWithCard() {}
  void addMoneyFromBank() {}

  void createLiquedeSealPlan() {
    showBottomSheetFull(
        context,
        "Create a LiquedeSeal Saving plan",
        const CreateLiquedeSealPlan());
  }

  void createLiquedeGoalPlan() {
    showBottomSheetFull(
        context,
        "Create a LiquedeGoal Saving plan",
        const CreateLiquedeGoalPlan());
  }
}
