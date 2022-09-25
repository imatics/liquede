import 'package:flutter/material.dart';
import 'package:liquede/commons/constants.dart';
import 'package:liquede/commons/extenstions.dart';
import 'package:liquede/commons/reusables.dart';
import 'package:liquede/commons/size_config.dart';
import 'package:liquede/commons/utils.dart';
import 'package:liquede/extensions/widget.dart';
import 'package:liquede/presentation/create_loan.dart';

class LoanScreen extends StatefulWidget {
  const LoanScreen({Key? key}) : super(key: key);

  @override
  State<LoanScreen> createState() => _LoanScreenState();
}

class _LoanScreenState extends State<LoanScreen> {
  bool creditRequested = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Loans"),
        centerTitle: true,
      ),
      body: Builder(builder: (context) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            addSpace(y: 20),
            kText("What kind of loan would you like to get?",
                weight: FontWeight.bold),
            addSpace(y: 20),
            cardItem(
                "Personal Loan",
                "get up to ${nairaSymbol}5,000,000 without collateral",
                () => createPersonalLoan(context)),
            addSpace(y: 20),
            cardItem(
                "Business Loan",
                "get up to ${nairaSymbol}10,000,000 without collateral",
                () => createBusinessLoan(context)),
            addSpace(y: 20),
            cardItem("Use SLIPCARD for credit",
                    "Make payment with your SLIPCARD even with a zero balance liquede account", () => requestCredit(context), customChild: Row(
                  children: [
                    kText("Activation", fontSize: 14),
                    addSpace(x: 10),
                    Container(
                      child: kText("Pending", weight: FontWeight.w600),
                      padding: const EdgeInsets.symmetric(
                          vertical: 4, horizontal: 10),
                      decoration: BoxDecoration(color: Colors.grey[100]),
                    )
                  ],
                )).hideIf(true)

          ],
        ).paddingX(20);
      }),
    );
  }

  Widget cardItem(String title, String desc, Function() onclick,
      {Widget? customChild}) {
    return Material(
        elevation: 2,
        borderRadius: BorderRadius.circular(12),
        color: white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            kText(title, fontSize: 18, weight: FontWeight.bold),
            addSpace(y: 15),
            kText(
              desc,
              weight: FontWeight.normal,
              fontSize: 12
            ).replace(customChild, customChild != null),
          ],
        )
            .paddingAll(20)
            .stretchWith(Axis.horizontal)
            .onclickWithRipple(onclick));
  }

  void createPersonalLoan(BuildContext context) {
    showBottomSheetFull(
        context, "Get a personal Loan", const CreateLoanScreen(type: LoanType.personal,).stretchSize(h: getPercentageHeight(100)));
  }

  void createBusinessLoan(BuildContext context) {
    showBottomSheetFull(
        context, "Get a Business Loan", const CreateLoanScreen(type: LoanType.business,).stretchSize(h: getPercentageHeight(100)));
  }

  void requestCredit(BuildContext context) {
    showAllPDialog(
        context,
        Wrap(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                  color: kAppYellowDark, shape: BoxShape.circle),
              child: const Icon(
                Icons.credit_card,
                size: 35,
              ),
            ).center,
            kText("Request to have the credit feature activated on your SLIPCARD",
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
                  creditRequested = true;
                });
              },
              child:
                  kText("Send Request", color: white, weight: FontWeight.bold),
              color: black,
              height: 45,
            ).stretchSize(h: 45),
            const SizedBox(height: 10),
            MaterialButton(
              onPressed: () => [() => goBack(context), (){
                Future.delayed(const Duration(milliseconds: 500), (){
                  setState(() {
                    creditRequested = true;
                  });
                });
              }].chain(),
              child: kText("Cancel", weight: FontWeight.bold),
              height: 45,
            ).stretchSize(h: 45).paddingY(10)
          ],
        ).paddingAll(20));
  }



}
