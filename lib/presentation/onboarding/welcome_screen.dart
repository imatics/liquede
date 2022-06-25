import 'package:flutter/material.dart';
import 'package:liquede/commons/constants.dart';
import 'package:liquede/commons/reusables.dart';
import 'package:liquede/commons/utils.dart';
import 'package:liquede/extensions/string.dart';
import 'package:liquede/extensions/widget.dart';
import 'package:liquede/presentation/dashboard/home.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         kText("Welcome \nPade", weight: FontWeight.bold, fontSize: 40).paddingMerge(t: 80),
         Container(
           decoration: BoxDecoration(
             image: DecorationImage(image: AssetImage("confetti_background".imagePng))
           ),
           alignment: Alignment.center,
           child: Image.asset("party_cone".imagePng, height: 200,),
         ).stretch,
         kText(reallyLongText,color: Colors.grey[800], a: TextAlign.justify, fontSize: 13).paddingXY(x: 10, y: 20),
         MaterialButton(onPressed: (){
           gotoAndClear(context, const Home());
         }, child: kText("Ok", color: white),color: black,).stretchSize(h: 45),
          addSpace(y: 60),
        ],
      ).paddingX(20),
    );
  }

}


String reallyLongText = "Everything Liquede can do for you is summed up in the acronym SLIP, we provide easy way to save, access loans, invest, and make payments.";
