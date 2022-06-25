import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:liquede/commons/base_scaffold.dart';
import 'package:liquede/commons/constants.dart';
import 'package:liquede/commons/reusables.dart';
import 'package:liquede/commons/utils.dart';
import 'package:liquede/extensions/widget.dart';
import 'package:liquede/presentation/history.dart';

class FlexDetails extends StatelessWidget {
   FlexDetails(this.onFundAttempt,this.onWithdrawAttempt, {Key? key}) : super(key: key);
  Function() onFundAttempt;
  Function() onWithdrawAttempt;

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      context: context,
      title: "My LiquedeFlex",
      baseBody: Column(
        children: [
          kText("Balance", fontSize: 13, color: grey),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              kText(formatMoney(0), weight: FontWeight.w900, fontSize: 25)
                  .paddingY(10),
              Expanded(
                  child: const Icon(
                Icons.arrow_upward_outlined,
                color: Colors.green,
              ).left),
            ],
          ),
          Container(
            decoration: BoxDecoration(
              color: kAppYellow,
              borderRadius: BorderRadius.circular(5),
            ),
            child: kText("1234546").paddingXY(x: 55, y: 2),
          ),
          addSpace(y: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MaterialButton(
                onPressed: onFundAttempt,
                child: kText("Top Up", weight: FontWeight.bold),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                    side: const BorderSide(width: 1, color: black)),
              ).stretchSize(w: 120, h: 40),
              addSpace(x: 20),
              MaterialButton(
                onPressed:onWithdrawAttempt,
                child: kText("Withdraw", weight: FontWeight.bold),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                    side: const BorderSide(width: 1, color: black)),
              ).stretchSize(w: 120, h: 40)
            ],
          ),
          addSpace(y: 45),
          kText("Transactions", weight: FontWeight.bold, fontSize: 18).left,
          addSpace(y: 10),
          Expanded(child: ListView(
            children: [
              ...List.generate(20, (index) => index).map((e) => listItem(TransactionType.values[e%2], "John Doe", "Desscription", 100.0 * e)).toList()
            ],
          ))
        ],
      ).paddingX(20),
    );
  }
}
