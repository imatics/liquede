import 'package:flutter/material.dart';
import 'package:liquede/commons/constants.dart';
// 598893

 ThemeData theme() {
    return ThemeData(
      scaffoldBackgroundColor: Colors.white,
      primaryColor: primaryColor,
      secondaryHeaderColor: primaryColorVariant,
      // accentColor: secondaryColor,
      appBarTheme: const AppBarTheme(
          color: Colors.white,
          elevation: 0,
          brightness: Brightness.light,
          // backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: primaryColor),
          titleTextStyle: appBarTextStyle,
          centerTitle: true),
      fontFamily: "Poppins",
      textTheme: const TextTheme(
        bodyText1: TextStyle(color: primaryColor),
        bodyText2: TextStyle(
          color: secondaryColor,
          fontWeight: FontWeight.w500,
          fontSize: 15,
          // letterSpacing: 0.5,
          // height: 1.5,
        ),
        headline1: TextStyle(
          color: kHeadlineColor,
          fontSize: 25,
          fontWeight: FontWeight.w700,
          letterSpacing: 0.5,
        ),
      ),
      textButtonTheme: TextButtonThemeData(style: ktextButtonStyle()),
      buttonTheme: ButtonThemeData(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4),),buttonColor: black,),
      elevatedButtonTheme: ElevatedButtonThemeData(style: kelevatedbuttonStyle()),
      inputDecorationTheme: const InputDecorationTheme(
        labelStyle: TextStyle(color: klabelColor),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: kborderColor),
          gapPadding: 10,
        ),
        // focusedBorder: OutlineInputBorder(
        //   gapPadding: 10,
        //   borderSide: BorderSide(color: kbongalowColorGreen),
        // ),
      ),
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );
 }
