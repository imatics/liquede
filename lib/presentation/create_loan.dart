import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:liquede/commons/constants.dart';
import 'package:liquede/commons/reusables.dart';
import 'package:liquede/commons/utils.dart';
import 'package:liquede/extensions/widget.dart';

class CreateLoanScreen extends StatefulWidget {
  const CreateLoanScreen({Key? key}) : super(key: key);



  @override
  State<CreateLoanScreen> createState() => _CreateLoanScreenState();
}

class _CreateLoanScreenState extends State<CreateLoanScreen> {
  bool isNext = false;
  List<String> options = [
    "Set terms of loan by months",
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
    selected = options.first;
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
        style: KTextStyle(color: black, a: TextAlign.center, weight: FontWeight.bold, fontSize: 25).build);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            addSpace(y: 10),
            kText("How much do you need?", fontSize: 13),
            EditTextField(KInputFieldProps(
                context: context,
                style: KTextStyle(weight: FontWeight.bold, fontSize: 18).build,
                inputDecoration: getUnderLineDecoration(borderWidth: 2, activeBorderColor: black, fillColor: Colors.white, activeBorderWidth: 2, borderColor: black),
                textEditingController: TextEditingController(text: formatMoney(0)),
                inputFormatter: [CurrencyTextInputFormatter(decimalDigits: 0, symbol: nairaSymbol)],
                inputType: TextInputType.number)),
            Container(
              color: Colors.grey[100],
              height: 35,
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              alignment: Alignment.centerLeft,
              child: kText("Your maximum amount is ${formatMoney(50000)}", color: grey, fontSize: 13),
            ),
            addSpace(y: 30),
            Container(
              decoration: BoxDecoration(
                  color: Colors.grey[100],
                  border:
                  const Border(bottom: BorderSide(width: 1, color: black))),
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: DropdownButton<String>(
                  isExpanded: true,
                  underline: const SizedBox(),
                  itemHeight: 90,
                  onChanged: (e) {},
                  value: selected,
                  items: options
                      .map((e) => DropdownMenuItem(
                    child: Text(e),
                    value: e,
                    onTap: () {
                      setState(() {
                        selected = e;
                      });
                    },
                  ))
                      .toList())
                  .stretchSize(h: 50),
            ),
            addSpace(y: 20),
            Container(
              height: 170,
              width: double.infinity,
              decoration: const BoxDecoration(
                  color: Color(0xFFFBFBFB),
              ),
              child: Column(
                children: [
                  const Spacer(),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.remove_circle,
                            size: 55,
                          ).onclickWithRipple(() {
                            if (valueEntered > 0) {
                              _controller.text = "${valueEntered--}";
                            }
                          }).stretchSize(h: 60, w: 60),
                          addSpace(x: 10),
                          EditTextField(prop).stretchSize(h: 70, w: 80),
                          addSpace(x: 10),
                          const Icon(
                            Icons.add_circle,
                            size: 55,
                          ).onclickWithRipple(() {
                            if (valueEntered < 30) {
                              _controller.text = "${valueEntered++}";
                            }
                          }).stretchSize(h: 60, w: 60),
                        ],
                      ),
                      kText(
                          (selected == null) ? "" : selected!.split(" ").last),
                    ],
                  ),
                ],
              ),
            ),
            addSpace(y: 40),
            kText("How will you repay?", weight: FontWeight.bold, fontSize: 14),
            addSpace(y: 10),
            Container(
              decoration: BoxDecoration(
                  color: Colors.grey[100],
                  border:
                  const Border(bottom: BorderSide(width: 1, color: black))),
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: DropdownButton<String>(
                  isExpanded: true,
                  underline: const SizedBox(),
                  itemHeight: 90,
                  onChanged: (e) {},
                  value: selected,
                  items: options
                      .map((e) => DropdownMenuItem(
                    child: Text(e),
                    value: e,
                    onTap: () {
                      setState(() {
                        selected = e;
                      });
                    },
                  ))
                      .toList())
                  .stretchSize(h: 50),
            ),
            AnimatedCrossFade(
              crossFadeState: isNext ? CrossFadeState.showSecond : CrossFadeState.showFirst,
              duration: defaultAnimationDuration,
                firstChild: const SizedBox(),
                secondChild: Column(
                  children: [
                    previewCard(200).paddingTop(20),
                    addSpace(y: 10),
                    Container(
                      color: Colors.grey[100],
                      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      child: kText(authText, a: TextAlign.justify, fontSize: 13)
                          .paddingY(15),
                    ),
                  ],
                )),
            addSpace(y: 30),
            MaterialButton(
              onPressed: applyForLoan,
              color: black,
              child: kText(isNext? "Apply" : "Next", color: white, fontSize: 18, weight: FontWeight.bold),
            ).stretchSize(h: 50),
            addSpace(y: 30),
          ],
        ),
      ),
    );
  }

  Widget previewCard(double amount) {
    KTextStyle label = KTextStyle(
        fontSize: 13, color: Colors.grey[600], weight: FontWeight.w400);
    KTextStyle value =
    KTextStyle(fontSize: 16, color: Colors.black, weight: FontWeight.bold);
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
                    kText("Amount to Seal", defaultStyle: label.build!),
                    addSpace(y: 5),
                    kText(formatMoney(amount), defaultStyle: value.build!),
                  ],
                ),
                const Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    kText("Interest", defaultStyle: label.build!),
                    addSpace(y: 5),
                    kText("15% Monthly", defaultStyle: value.build!),
                  ],
                ),
              ],
            ),
            addSpace(y: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    kText("Total Repayment", defaultStyle: label.build!),
                    addSpace(y: 5),
                    kText(formatMoney(amount), defaultStyle: value.build!),
                  ],
                ),
                const Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    kText("Installments", defaultStyle: label.build!),
                    addSpace(y: 5),
                    kText("${formatMoney(4000)}/Monthly", defaultStyle: value.build!),
                  ],
                ),
              ],
            ),
            addSpace(y: 20),
            kText("DownPayment", defaultStyle: label.build!),
            kText(formatMoney(112500), defaultStyle: value.build!),
          ],
        ).paddingAll(20),
      ),
    );
  }

  String authText =
  """Note that a down payment of 2.5% of the total loan amount must be made before the loan can be disbursed.
  """;

  void applyForLoan() {
    if(!isNext){
   setState(() {
     isNext = true;
   });
    }else{
    showSuccessPopUp(context, "Application successful", onClose: () {
      goBack(context);
    });
  }
  }
}





enum LoanType{
  personal,
  business
}
