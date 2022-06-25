import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:liquede/commons/base_scaffold.dart';
import 'package:liquede/commons/constants.dart';
import 'package:liquede/commons/reusables.dart';
import 'package:liquede/commons/utils.dart';
import 'package:liquede/extensions/widget.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseScaffold(context: context,
      title: "Transactions",
      baseBody: Column(
        children: [
          searchBar(),
          ListView(
            padding: const EdgeInsets.only(top: 20),
            children: [
              listItem(TransactionType.credit, "John Doe", "Transfer", 40000),
              listItem(TransactionType.debit, "John Doe", "Debit - 12 Nov 20",
                  -4000),
              listItem(TransactionType.credit, "John Doe", "Transfer", 40000),
              listItem(TransactionType.savings, "John Doe", "Transfer", 40000),
              listItem(TransactionType.debit, "John Doe", "Transfer", 40000),
              listItem(TransactionType.credit, "John Doe", "Transfer", 40000),
              listItem(TransactionType.debit, "John Doe", "Transfer", 40000),
              listItem(TransactionType.savings, "John Doe", "Transfer", 40000),
              listItem(TransactionType.credit, "John Doe", "Transfer", 40000),
              listItem(TransactionType.debit, "John Doe", "Transfer", 40000),
              listItem(TransactionType.credit, "John Doe", "Transfer", 40000),
              listItem(TransactionType.debit, "John Doe", "Transfer", 40000),
            ],
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

  Widget listItem(TransactionType t, String name, String desc, double amount){
    return Container(
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(width: 0.5, color: Colors.grey[300]!)
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          t.icon,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            kText(name),
            kText(desc, color: grey, fontSize: 13)
          ],).paddingX(20),
          const Spacer(),
          kText(formatMoney(amount))
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
    height: 40,
    width: 40,
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
