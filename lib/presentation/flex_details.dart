import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:liquede/commons/base_scaffold.dart';
import 'package:liquede/commons/constants.dart';
import 'package:liquede/commons/reusables.dart';
import 'package:liquede/commons/utils.dart';
import 'package:liquede/extensions/widget.dart';
import 'package:liquede/presentation/history.dart';
import 'package:liquede/services/api/base_service.dart';
import 'package:liquede/services/api/user_service.dart';
import 'package:liquede/services/api/wallet_service.dart';

class FlexDetails extends StatefulWidget {
  FlexDetails(this.onFundAttempt, this.onWithdrawAttempt, {Key? key})
      : super(key: key);
  Function() onFundAttempt;
  Function() onWithdrawAttempt;

  @override
  State<FlexDetails> createState() => _FlexDetailsState();
}

class _FlexDetailsState extends State<FlexDetails> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getList();
  }


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
              kText(WalletService.I(context).balance,
                      weight: FontWeight.w900, fontSize: 25)
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
            child: kText("1234546").paddingXY(x: 55, y: 2).hideIf(true),
          ),
          addSpace(y: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MaterialButton(
                onPressed: widget.onFundAttempt,
                child: kText("Top Up", weight: FontWeight.w600, fontSize: 13),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                    side: const BorderSide(width: 1, color: black)),
              ).stretchSize(w: 120, h: 40),
              addSpace(x: 20),
              MaterialButton(
                onPressed: widget.onWithdrawAttempt,
                child: kText("Withdraw", weight: FontWeight.w600, fontSize: 13),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                    side: const BorderSide(width: 1, color: black)),
              ).stretchSize(w: 120, h: 40)
            ],
          ),
          addSpace(y: 55),
          kText("Transactions", weight: FontWeight.bold, fontSize: 14).left,
          addSpace(y: 10),
          Expanded(
              child: ListView(
            children: [
              ...WalletService.I(context).transactions
                  .map((e) => listItem(TransactionType.debit,
                      e.title??"", e.description??"", "${e.amount}"))
                  .toList()
            ],
          ))
        ],
      ).paddingX(20),
    );
  }

  void _getList() {
    WalletService.I(context)
        .getTransactionHistory(UserService.I(context).userView?.id ?? -1)
        .handleStateAndPerformOnSuccess(context, (p0) {
          setState(() {});
    });
  }
}
