import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:liquede/commons/base_scaffold.dart';
import 'package:liquede/commons/constants.dart';
import 'package:liquede/commons/reusables.dart';
import 'package:liquede/commons/utils.dart';
import 'package:liquede/extensions/widget.dart';
import 'package:liquede/presentation/history.dart';

class Beneficiaries extends StatefulWidget {
  const Beneficiaries({Key? key}) : super(key: key);

  @override
  State<Beneficiaries> createState() => _BeneficiariesState();
}

class _BeneficiariesState extends State<Beneficiaries> {
  List<String> b = ["Emmannuel Jude", "Micheal Faraday", "Peter Obi", "Jennifer Innoson", "Sponge Bon"];


  @override
  Widget build(BuildContext context) {
    return BaseScaffold(context: context,
      removeAppbar: true,
      baseBody: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            kText("Choose a beneficiary"),
            Icon(Icons.close, size: 30,).onclickWithRipple(() => goBack(context))
          ],
        ).paddingY(20),
        addSpace(y: 20),
        searchBar(context),
        addSpace(y: 20),
        ListView(
          children: [
            ...b.map((e) => Container(
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.grey[400]!, width: 1))
              ),
              height: 60,
              child: Row(
                children: [
                  Container(
                    height: 45,
                    width: 45,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(10),
                    decoration:BoxDecoration(
                      shape: BoxShape.circle,
                      color: black
                    ),
                    child: kText("${e.split(" ").first[0]}${e.split(" ").last[0]}", weight: FontWeight.bold, fontSize: 20, color: white),
                  ),
                  addSpace(x: 30),
                  kText(e),
                  Spacer(),
                  Icon(Icons.arrow_forward_ios_rounded, size: 15,)
                ],
              ),
            )).toList()
          ],
        ).stretch
      ],
    ),);
  }
}
