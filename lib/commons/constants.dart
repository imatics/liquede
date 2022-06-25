
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:liquede/commons/reusables.dart';
import 'package:liquede/commons/size_config.dart';
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';


class AppConstants{

  // static const String base_url = "https://localhost:63590";
  static const String appPackageAndroid = "";
  static const String appIDIOS = "_____";


  static const String IOS_VERSION  = 'ios_version';
  static const String ANDROID_VERSION = 'android_version';
  static const String IOS_ACTIVE = 'ios_active';
  static const String ANDROID_ACTIVE = 'android_active';
  static const String ANDROID_UPDATE_MANDATORY = 'android_last_update_mandatory';
  static const String IOS_UPDATE_MANDATORY = 'ios_last_update_mandatory';
  static const String IOS_DEACTIVATION_MESSAGES = 'ios_deactivation_msg';
  static const String ANDROID_DEACTIVATION_MESSAGE = 'android_deactivation_msg';
  static const String encryptionKey = 'encryption_key';


}



const String image_path = "assets/images";


const Color inputBackground = Color(0xFFF1F1F1);
const Color white = Color(0xFFFFFFFF);
const Color textHintGrey = Color(0xFF8F8F8F);
const Color grey_50 = Color(0xFFF3F3F3);
const Color black = Color(0xFF000000);
const Color transparent = Color(0x00000000);
const Color grey = Color(0xFF555555);
const Color darkGrey = Color(0xFF222222);
const Color green = Color(0xFF2E7D32);
const Color red = Color(0xFFff3333);



const primaryColor = Color(0xFF0D5901);
const primaryColorVariant = Color(0xFF095900);
const primaryLightColor = Color(0xFF1C8616);
const primaryMaskColor = Color(0x95B7C0B5);
const backgroundColor = Color(0xFFFAFDF8);

const secondaryColor = Color(0xFF1C1C1C);

const kHeadlineColor = Color(0xFF3E5481);
//const kTextColor = Color(0xFF);

const onBoardText1 = Color(0xFF2E3E5C);
const kColorGreen = Color(0xFF21A374);
const kColorGreenLighter = Color(0xffEFF9F5);

const kgoogleRed = Color(0xFFF14336);
const kfacebookBlue = Color(0xFF1877F2);

const kborderColor = Color(0xFFB0B0B0);
const klabelColor = Color(0xFF939393);

const kdashboardBackground = Color(0xFFEFF9F5);

const kmortgageBackground = Color(0xFFEFF9F5);

const kBlack = Color(0xFF454545);
const koffersBlack = Color(0xFF031B4A);

const kAppYellow =  Color(0xFFFFC107);
const kAppYellowDark =  Color(0xFFB48907);
const kprofileBackgroundColor = const Color(0xFFF6F8F9);

const kdividerColor = const Color(0xFFE5E5E5);

const defaultAnimationDuration = Duration(milliseconds: 400);

const defaultAnimationDurationMax = Duration(milliseconds: 600);

const kmortgageQuestionTextStyle =
TextStyle(fontWeight: FontWeight.w600, fontSize: 20, color: kBlack);

const kmortgageQuestionTextStyle2 =
TextStyle(fontWeight: FontWeight.w500, fontSize: 14, color: kBlack);

const offerStyle = TextStyle(
    color: koffersBlack,
    fontWeight: FontWeight.bold,
    fontSize: 17,
    fontFamily: "Roboto");
const listtileTitle =
TextStyle(color: koffersBlack, fontWeight: FontWeight.w600, fontSize: 16);
const listtileSubtitle = TextStyle(color: primaryLightColor, fontSize: 14);

const appBarTextStyle =
TextStyle(color: Colors.black, fontWeight: FontWeight.w600);

BoxDecoration phoneCountryCodeDecoration = BoxDecoration(
    border: Border.all(color: kborderColor),
    borderRadius: BorderRadius.circular(5));

BoxDecoration klistTileBox = BoxDecoration(
  border: Border.all(color: Color(0xFFEBEBEB), width: 2),
);

Color? kTextButtonBackgroundColor(Set<MaterialState> states) {
  const Set<MaterialState> interactiveStates = <MaterialState>{
    MaterialState.pressed,
    MaterialState.hovered,
    MaterialState.focused,
  };
  if (states.any(interactiveStates.contains)) {
    return Color(0xFFf6fef6);
  }

  return null;
}

ButtonStyle kelevatedbuttonStyle() {
  return ButtonStyle(
      backgroundColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.disabled)) {
          return primaryColor.withOpacity(0.4);
        } else {
          return primaryColor;
        }
      }),
      shape: MaterialStateProperty.resolveWith((states) => RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
      elevation: MaterialStateProperty.resolveWith((states) => 0),
      minimumSize: MaterialStateProperty.resolveWith(
              (states) => Size(double.infinity, 56)));
}


ButtonStyle kelevatedbuttonStyleGray() {
  return ButtonStyle(
      backgroundColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.disabled)) {
          return grey_50.withOpacity(0.4);
        } else {
          return grey_50;
        }
      }),
      textStyle: MaterialStateProperty.resolveWith((states) => const TextStyle(
        color: primaryColor,
      )),
      elevation: MaterialStateProperty.resolveWith((states) => 0),
      minimumSize: MaterialStateProperty.resolveWith(
              (states) => Size(double.infinity, 56)));
}

ButtonStyle ktextButtonStyle() {
  return ButtonStyle(
      backgroundColor:
      MaterialStateProperty.resolveWith(kTextButtonBackgroundColor),
      foregroundColor:
      MaterialStateProperty.resolveWith((states) => primaryColor));
}

ButtonStyle ktextButtonStyle2() {
  return ButtonStyle(
      backgroundColor:
      MaterialStateProperty.resolveWith(kTextButtonBackgroundColor),
      foregroundColor:
      MaterialStateProperty.resolveWith((states) => primaryColor));
}

ButtonStyle kOutLinedButtonStyle() {
  return ButtonStyle(
      backgroundColor:
      MaterialStateProperty.resolveWith(kTextButtonBackgroundColor),
      foregroundColor:
      MaterialStateProperty.resolveWith((states) => primaryColor));
}

EdgeInsets bottomNavigationBarPadding = EdgeInsets.symmetric(
    horizontal: getProportionateScreenWidth(16), vertical: 15);

//currency formatters
final kcurrencyTextFieldFormatter = CurrencyTextInputFormatter(
    decimalDigits: 0, symbol: "");  //to add commas to currency textfield

final InputDecoration kInputDecoration = InputDecoration(
    filled: true,
    hintText: "hello",
    label: Text("Hello 2"),
    fillColor: Colors.transparent,
    contentPadding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
  border: const OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(8)),
    borderSide: BorderSide(color: primaryColor, width: 0.5)
  ),
  focusedBorder: const OutlineInputBorder(
borderRadius: BorderRadius.all(Radius.circular(8)),
borderSide: BorderSide(color: primaryColor, width: 1)
),
  enabledBorder: OutlineInputBorder(
borderRadius: const BorderRadius.all(Radius.circular(8)),
borderSide: BorderSide(color: Colors.grey[500]!, width: 0.5)
)
);




final TextStyle moneyStyle = KTextStyle(useDefaultFont: true).build!;
