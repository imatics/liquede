import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:liquede/commons/base_scaffold.dart';
import 'package:liquede/commons/constants.dart';
import 'package:liquede/commons/reusables.dart';
import 'package:liquede/commons/utils.dart';
import 'package:liquede/extensions/widget.dart';
import 'package:liquede/services/api/wallet_service.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(context: context,
      title: "Transactions",
      baseBody: Column(
        children: [
          searchBar(),
          ListView(
            padding: const EdgeInsets.only(top: 20),
            children: WalletService.I(context).transactions.map((e) => listItem(TransactionType.debit, e.title??"", "desc", e.amount)).toList(),
          ).stretch
        ],
      ).paddingX(20),

    );
  }


  Widget searchBar() {
    return Container(
      height: 45,
      decoration: BoxDecoration(
          border: Border.all(color: black, width: 1),
          borderRadius: BorderRadius.circular(4)
      ),
      child: Row(
        children: [
          Icon(Icons.search).paddingX(10),
          EditTextField(KInputFieldProps(context: context,
              textEditingController: TextEditingController(),
              fillColor: transparent)).stretch,
          MaterialButton(onPressed: () {},
            child: kText("Search", color: white),
            color: black,
            elevation: 0,).stretchWith(Axis.vertical)
        ],
      ),
    );
  }


}

  Widget listItem(TransactionType t, String name, String desc, String? amount){
    return Container(
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(width: 0.5, color: Colors.grey[300]!)
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          t.icon,
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            kText(name, fontSize: 13, weight: FontWeight.w600),
            kText(desc, color: grey, fontSize: 11)
          ],).paddingX(20),
          const Spacer(),
          kText(amount, fontSize: 14, weight: FontWeight.w600, color: Colors.grey[700])
        ],
      ).paddingXY(x: 10, y: 10),
    ).paddingY(5);
  }







enum TransactionType{
  debit,
  credit,
  savings
}


Widget up =  const Icon(Icons.arrow_upward, color: white,size: 20,);
Widget down =  const Icon(Icons.arrow_downward, color: white, size: 20,);
Widget savings = const Icon(Icons.refresh, color: white,);


Widget wrapper(Widget icon, Color color){
  return Container(
    height: 30,
    width: 30,
    child: icon,
    alignment: Alignment.center,
    decoration: BoxDecoration(
      color: color,
      shape: BoxShape.circle
    ),
  );
}


extension T on  TransactionType{

  Widget get icon{
    switch(this){
      case TransactionType.credit: return wrapper(down, Colors.green);
      case TransactionType.debit: return wrapper(up, Colors.deepOrange);
      case TransactionType.savings: return wrapper(savings, Colors.grey);
    }

  }
}

Widget searchBar(BuildContext context) {
  return Container(
    height: 40,
    decoration: BoxDecoration(
        border: Border.all(color: grey, width: 1),
        borderRadius: BorderRadius.circular(6)
    ),
    child: Row(
      children: [
        Icon(Icons.search, size: 16,).paddingX(10),
        EditTextField(KInputFieldProps(context: context,
            textEditingController: TextEditingController(),
            fillColor: transparent)).stretch,
        MaterialButton(onPressed: () {},
          child: kText("Search", color: white),
          color: black,
          elevation: 0,).stretchWith(Axis.vertical)
      ],
    ),
  );
}
