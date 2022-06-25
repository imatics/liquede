import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:liquede/commons/base_scaffold.dart';
import 'package:liquede/commons/constants.dart';
import 'package:liquede/commons/reusables.dart';
import 'package:liquede/commons/extenstions.dart';
import 'package:liquede/commons/size_config.dart';
import 'package:liquede/commons/utils.dart';
import 'package:liquede/extensions/widget.dart';
import 'package:liquede/extensions/string.dart';
import 'package:liquede/presentation/commons/bottom_sheet.dart';
import 'package:liquede/presentation/history.dart';

class SlipCard extends StatefulWidget {
  SlipCard({Key? key}) : super(key: key);

  @override
  State<SlipCard> createState() => _SlipCardState();
}

class _SlipCardState extends State<SlipCard> {
  bool useCardForDebit = true;

  bool freezeCard = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          title: kText("Slip Card", weight: FontWeight.bold, fontSize: 18),
          centerTitle: true,
        ),
        body: Builder(builder: (context) {
          return SingleChildScrollView(
            padding: const EdgeInsets.only(top: 10, left: 30, right: 30),
            child: Column(
              children: [
                kText("SLIPCARD Balance", color: grey, fontSize: 13),
                kText(223450.toNairaFormat,
                        fontSize: 30, weight: FontWeight.w900)
                    .paddingY(20),
                buildCard().paddingX(10),
                Row(
                  children: [
                    MaterialButton(
                      onPressed: () => funSlipCard(context),
                      child: kText("Fund"),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                          side: const BorderSide(width: 1, color: black)),
                    ).stretch,
                    addSpace(x: 20),
                    MaterialButton(
                      onPressed: () => defundSlipCard(context),
                      child: kText("Defund"),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                          side: const BorderSide(width: 1, color: black)),
                    ).stretch,
                  ],
                ).paddingXY(y: 20, x: 10),
                addSpace(y: 20),
                listItem(
                    Icons.switch_left_sharp,
                    "Spending Limit",
                    const Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 16,
                    )).onclickWithRipple(() => limitCard(context)),
                listItem(
                    Icons.history,
                    "Transaction History",
                    const Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 16,
                    )),
                listItem(
                    Icons.ac_unit,
                    "Freeze SLIP Card",
                    Switch(
                      onChanged: (v) {
                        if (v) {
                          confirmFreeze();
                        } else {
                          setState(() {
                            freezeCard = false;
                          });
                        }
                      },
                      value: freezeCard,
                    )),
                listItem(
                    Icons.card_giftcard,
                    "Use for Credit",
                    Switch(
                      onChanged: (v) {
                        setState(() {
                          useCardForDebit = !useCardForDebit;
                        });
                      },
                      value: useCardForDebit,
                    )),
              ],
            ),
          );
        }),
      ),
    );
  }

  Widget buildCard() {
    return Material(
        elevation: 1,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          height: 200,
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                stops: [
                  0.1,
                  0.3,
                  0.6,
                  0.9,
                ],
                colors: [
                  Colors.black,
                  Colors.grey[800]!,
                  Colors.black,
                  Colors.grey[700]!,
                ],
              ),
              borderRadius: BorderRadius.circular(12)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    "logo".imagePng,
                    width: 80,
                  ),
                  Image.asset(
                    "slip_logo".imagePng,
                    width: 80,
                  ),
                ],
              ).paddingTop(20).top.stretch,
              Column(
                children: [
                  kText("**** **** **** **** 2334",
                          color: white,
                          letterSpacing: 2,
                          a: TextAlign.justify,
                          fontSize: 18)
                      .left,
                  const Spacer(),
                  kText("Expires", color: white, fontSize: 12).left,
                  kText("11/22", color: white, fontSize: 16).left,
                  const Spacer(),
                  kText("John Doe", color: white, fontSize: 14).left,
                ],
              ).stretch
            ],
          ),
        ));
  }

  void confirmFreeze() {
    showAllPDialog(
        context,
        Wrap(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                  color: kAppYellowDark, shape: BoxShape.circle),
              child: const Icon(
                Icons.ac_unit,
                size: 35,
              ),
            ).center,
            kText("You may no longer be able to use your SLIPCARD for payments and transactions until you unfreeze it.",
                    fontSize: 15,
                    a: TextAlign.center,
                    color: Colors.grey[800],
                    spacing: 4,
                    height: 1.5)
                .stretchWith(Axis.horizontal)
                .paddingY(20),
            const SizedBox(height: 20),
            MaterialButton(
              onPressed: () {
                goBack(context);
                setState(() {
                  freezeCard = true;
                });
              },
              child: kText("Freeze SLIPCARD",
                  color: white, weight: FontWeight.bold),
              color: black,
              height: 45,
            ).stretchSize(h: 45),
            const SizedBox(height: 10),
            MaterialButton(
              onPressed: () => goBack(context),
              child: kText("Cancel", weight: FontWeight.bold),
              height: 45,
            ).stretchSize(h: 45).paddingY(10)
          ],
        ).paddingAll(20));
  }

  Widget listItem(IconData icon, String label, Widget action) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          Icon(icon),
          addSpace(x: 10),
          kText(label),
          const Spacer(),
          action
        ],
      ),
      decoration: BoxDecoration(
          border:
              Border(bottom: BorderSide(width: 1, color: Colors.grey[400]!))),
    );
  }

  void funSlipCard(BuildContext context) {
    Map<String, double> accounts = {
      "LiquedeFlex": 44994000,
      "LiquedeFlex 2": 45000000
    };
    showSheet(context, accounts, "Fund your SLIPCARD", "Fund SLIPCARD",
        TransactionType.credit, (amount) {
      mockServerCall(context, () {
        goBack(context);
        showSuccessPopUp(context, "Your SLIPCARD has been funded");
      });
    });
  }

  void defundSlipCard(BuildContext context) {
    Map<String, double> accounts = {
      "LiquedeFlex": 44994000,
      "LiquedeFlex 2": 45000000
    };
    showSheet(context, accounts, "Defund your SLIPCARD", "Defund SLIPCARD",
        TransactionType.debit, (amount) {
      mockServerCall(context, () {
        goBack(context);
        showSuccessPopUp(context, "Your SLIPCARD has been funded");
      });
    });
  }

  void showSheet(
      BuildContext context,
      Map<String, double> accounts,
      String title,
      String action,
      TransactionType type,
      Function(double) onComplete) {
    TextEditingController _controller =
        TextEditingController(text: formatMoney(0));
    String accountSelect = accounts.keys.first;
    launchBottomSheetFull(context, StatefulBuilder(builder: (context, inState) {
      return SizedBox(
        height: getPercentageHeight(70),
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          body: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    const Spacer(),
                    kText("Fund your SLIPCARD",
                        fontSize: 13, weight: FontWeight.bold),
                    Expanded(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Icon(
                          Icons.close,
                          size: 25,
                        ).onclickWithRipple(() => goBack(context)),
                      ],
                    ))
                  ],
                ).paddingMerge(b: 20, t: 10),
                Column(
                  children: [
                    kText("Current SLIPCARD Balance",
                        fontSize: 12, color: grey),
                    addSpace(y: 10),
                    kText(formatMoney(45000),
                        fontSize: 30, weight: FontWeight.w900),
                    addSpace(y: 30),
                    kText(
                            type == TransactionType.debit
                                ? "Send To"
                                : "Fund From",
                            weight: FontWeight.w400,
                            fontSize: 13)
                        .left,
                    DropdownButton<String>(
                      isExpanded: true,
                      isDense: false,
                      underline: Container(
                        height: 1,
                        color: black,
                      ),
                      items: accounts.entries
                          .map((e) => DropdownMenuItem(
                                value: e.key,
                                onTap: () {
                                  accountSelect = e.key;
                                },
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    kText(e.key, fontSize: 15),
                                    kText(formatMoney(e.value),
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
                        ),
                        fillColor: white,
                        inputType: TextInputType.number,
                        style: KTextStyle(fontSize: 15, weight: FontWeight.w500)
                            .build,
                        context: context,
                        inputFormatter: [
                          CurrencyTextInputFormatter(
                              symbol: nairaSymbol, decimalDigits: 0)
                        ])).stretchSize(h: 45),
                    addSpace(y: 45),
                    MaterialButton(
                      onPressed: () => onComplete(0),
                      child: kText(action,
                          weight: FontWeight.bold, color: Colors.white),
                      color: Colors.black,
                    ).stretchSize(h: 45)
                  ],
                ).paddingX(10),
              ],
            ),
          ),
        ),
      );
    }), hFactor: 0.7);
  }

  void limitCard(BuildContext context) {
    List<String> types = ["Set per transaction", "Set per day"];
    String selected = types.first;
    TextEditingController _controller =
        TextEditingController(text: "Type New Limit");
    launchBottomSheetFull(
        context,
        Scaffold(
          resizeToAvoidBottomInset: true,
          body: SingleChildScrollView(
            child: StatefulBuilder(
              builder: (context, inState) => Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      kText2("Limit your slip"),
                      const Icon(Icons.close).onclickWithRipple(() {
                        goBack(context);
                      })
                    ],
                  ),
                  addSpace(y: 30),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[100],
                        border: const Border(
                            bottom: BorderSide(width: 1, color: black))),
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: DropdownButton<String>(
                      isExpanded: true,
                      isDense: false,
                      underline: const SizedBox(),
                      items: types
                          .map((e) => DropdownMenuItem(
                                value: e,
                                onTap: () {
                                  selected = e;
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    kText(e, fontSize: 15),
                                  ],
                                ),
                              ))
                          .toList(),
                      value: selected,
                      onChanged: (e) {
                        selected = e!;
                        inState(() {});
                      },
                    ),
                  ),
                  addSpace(y: 30),
                  kText("Current Limit", color: grey, fontSize: 14),
                  kText(formatMoney(5000000),
                          fontSize: 30, color: black, weight: FontWeight.w900)
                      .paddingY(10),
                  addSpace(y: 20),
                  EditTextField(KInputFieldProps(
                      textEditingController: _controller,
                      hint: "Type New Limit",
                      style: KTextStyle(weight: FontWeight.bold, fontSize: 15).build,
                      inputFormatter: [
                        CurrencyTextInputFormatter(symbol: nairaSymbol, decimalDigits: 0)
                      ])),
                  addSpace(y: 30),
                  MaterialButton(
                    onPressed: setCardLimit,
                    child: kText("Set Limit", color: white, weight: FontWeight.bold),
                    color: black,
                  ).stretchSize(h: 50),
                  addSpace(y: 40)
                ],
              ),
            ),
          ),
        ),
        hFactor: 0.7);
  }


  void setCardLimit(){
    mockServerCall(context, (){
      goBack(context);
      showSuccessPopUp(context, "Your have successfully updated the transaction limit on your SLIPCARD");
    });
  }

}
