import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:liquede/commons/base_scaffold.dart';
import 'package:liquede/commons/constants.dart';
import 'package:liquede/commons/reusables.dart';
import 'package:liquede/commons/utils.dart';
import 'package:liquede/extensions/widget.dart';
import 'package:liquede/presentation/history.dart';
import 'package:liquede/presentation/payment/transfer.dart';
import 'package:liquede/services/api/base_service.dart';
import 'package:liquede/services/api/wallet_service.dart';
import 'package:swagger/api.dart';

class Beneficiaries extends StatefulWidget {
  const Beneficiaries({Key? key}) : super(key: key);

  @override
  State<Beneficiaries> createState() => _BeneficiariesState();
}

class _BeneficiariesState extends State<Beneficiaries> {


  @override
  void initState() {
    super.initState();
    _getList();
  }


  void _getList(){
    Future.delayed(Duration(milliseconds: 200),(){
      WalletService.I(context).getBeneficiaries(force: true).handleStateAndPerformOnSuccess(context, (p0) {
        setState(() {
        });
      });

    });
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(context: context,
      removeAppbar: true,
      baseBody: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            kText("Choose a beneficiary", weight: FontWeight.w500, fontSize: 16),
            Icon(Icons.close, size: 20,).onclickWithRipple(() => goBack(context))
          ],
        ).paddingY(30),
        addSpace(y: 20),
        searchBar(context),
        addSpace(y: 20),
        ListView(
          padding: const EdgeInsets.symmetric(vertical: 10),
          children: [
            ...WalletService.I(context).beneficiaries.map((e) => Container(
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.grey[400]!, width: 0.5))
              ),
              height: 65,
              child: Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: black
                    ),
                    child: kText("${e.name?.trim().split(" ").first[0]}${e.name?.trim().split(" ").last[0]}", weight: FontWeight.bold, fontSize: 15, color: white),
                  ),
                  addSpace(x: 20),
                  kText(e.name, weight: FontWeight.w600),
                  Spacer(),
                  Icon(Icons.arrow_forward_ios_rounded, size: 15, color: grey,)
                ],
              ),
            ).onclickWithRipple(() => handleClick(e))).toList()
          ],
        ).stretch
      ],
    ),);
  }
   void handleClick(BeneficiaryModel model){
     goto(context, Transfer(beneficiaryModel: model));
   }
}
