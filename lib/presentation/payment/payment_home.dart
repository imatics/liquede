import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:liquede/commons/base_scaffold.dart';
import 'package:liquede/commons/constants.dart';
import 'package:liquede/commons/reusables.dart';
import 'package:liquede/extensions/widget.dart';
import 'package:liquede/extensions/string.dart';
import 'package:liquede/presentation/commons/bottom_sheet.dart';
import 'package:liquede/presentation/payment/beneficiaries.dart';

class PaymentHome extends StatefulWidget {
  const PaymentHome({Key? key}) : super(key: key);

  @override
  State<PaymentHome> createState() => _PaymentHomeState();
}

class _PaymentHomeState extends State<PaymentHome> {

  int indexSelected = 0;

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(context: context,
    title: "Payments",
    baseBody: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        addSpace(y: 20),
        kText("What kind of payment do you want to make?", fontSize: 14, weight: FontWeight.bold),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             paymentItem("send_money".imagePng, "Send Money",indexSelected == 0, (){
               setState(() {
                 indexSelected = 0;
               });
             }),
             addSpace(x: 20),
             paymentItem("pay_bills".imagePng, "Pay Bills",indexSelected == 1, (){
               setState(() {
                 indexSelected = 1;
               });
             })
          ],
        ).paddingAll(30),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MaterialButton(onPressed: (){}, child: kText("New"),),
                addSpace(x: 20),
                MaterialButton(onPressed: () => gotoBeneficiaries(context), child: kText("Beneficiaries"),),
              ],
            ),
            addSpace(y: 50),
            kText("Frequent Transactions", color: black, fontSize: 14, weight: FontWeight.bold),
            addSpace(y: 10),
            kText("You'll see your frequent transactions here once you start sending money on Liquede.", fontSize: 14, color: grey),
          ],
        )

      ],
    ).paddingX(20),);
  }

  Widget paymentItem(String image, String name, bool selected, Function() onclick){
    return Material(
      elevation: 1,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(width:2, color: selected?black:transparent),
          borderRadius: BorderRadius.circular(10),
        ),
        height: 110,
        width: 120,
       child: Column(
         children: [
           Image.asset(image, height: 40, width: 40, fit: BoxFit.fill,),
           const Spacer(),
           kText(name, weight: FontWeight.bold, color: black, fontSize: 13)
         ],
       ).paddingAll(15),
      ).paddingAll(1).onclickWithRipple(onclick),
    );
  }


  void gotoBeneficiaries(BuildContext context){
    launchBottomSheetFull(context, const Beneficiaries(),hFactor: 1);
  }
}
