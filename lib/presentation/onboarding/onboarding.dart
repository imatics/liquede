import 'package:flutter/material.dart';
import 'package:liquede/commons/constants.dart';
import 'package:liquede/commons/reusables.dart';
import 'package:liquede/commons/size_config.dart';
import 'package:liquede/commons/utils.dart';
import 'package:liquede/extensions/string.dart';
import 'package:liquede/extensions/widget.dart';
import 'package:liquede/presentation/onboarding/login.dart';
import 'package:liquede/presentation/onboarding/sign_up.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {

  int currentPage = 0;
  List title = [
    "Save consistently with rewarding interest rates",
    "Access instant loans and credit with the SLIPCARD",
    "Invest in Real Estate with 103% money-back guarantee",
    "Automate your payments and money transfer"
  ];

  List<Widget> images = [
    Image.asset(WelcomePages.one.image, width: double.infinity, height: double.infinity, fit: BoxFit.fill,),
    Image.asset(WelcomePages.two.image, width: double.infinity, height: double.infinity, fit: BoxFit.fill,),
    Image.asset(WelcomePages.three.image, width: double.infinity, height: double.infinity, fit: BoxFit.fill,),
    Image.asset(WelcomePages.four.image, width: double.infinity, height: double.infinity, fit: BoxFit.fill,),
  ];




  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: Stack(
          children: [
            ...WelcomePages.values.map((e) => AnimatedOpacity(opacity: e.index == currentPage? 1 : 0, duration: defaultAnimationDurationMax, child: images[e.index],)).toList(),
            PageView(
              onPageChanged: (position){
                currentPage = position;
                    setState(() {});
              },
              children: title.map((e) => SizedBox(
                height:double.infinity,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    kText(e, fontSize: 19, color: white, weight: FontWeight.bold, a: TextAlign.center).paddingX(80),
                  ],
                ),
              ).paddingBottom(30.0.percentOfWindowHeight)).toList(),
            ),
            Column(
              children: [
                Image.asset("logo".imagePng, height: 60).paddingY(50),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(4, (index) => index).map((e) => Container(height: 12, width: 12, decoration: BoxDecoration(
                      color: currentPage >= e ? white : Colors.white54,
                      shape: BoxShape.circle
                  ),).paddingAll(5)).toList(),
                ),
                SizedBox(height: 10.0.percentOfWindowHeight,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(child: SizedBox(height:45 ,child: MaterialButton(onPressed: signUp, child: getText("Sign Up", w:FontWeight.bold, color: black), color: kAppYellow,))),
                    addSpace(x: 20),
                    Expanded(child: SizedBox(height:45 ,child: MaterialButton(onPressed: signIn, child: getText("Login", w: FontWeight.bold, color: kAppYellow),shape: const RoundedRectangleBorder(side: BorderSide(color: kAppYellow, width: 1)), ))),
                  ],
                ).paddingX(40),
                addSpace(y: 30)
              ],
            ),
          ],
        )
      ),
    );
  }


void signIn(){
  goto(context,const LoginScreen());
}
void signUp(){
  goto(context,const SignUp());
}
}



enum WelcomePages{
  one,two,three,four
}

extension WelcomeEnum on WelcomePages{

 String get image{
 switch(this){
 case WelcomePages.one: return  "welcome_slide_1".imagePng;
 case WelcomePages.two: return  "welcome_slide_2".imagePng;
 case WelcomePages.three: return"welcome_slide_3".imagePng;
 case WelcomePages.four: return "welcome_slide_4".imagePng;
 }
 }

}


