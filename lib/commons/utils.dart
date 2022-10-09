
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:liquede/extensions/widget.dart';
import 'package:chopper/chopper.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:liquede/extensions/string.dart';
import 'package:liquede/model/api_response.dart';
import 'package:liquede/presentation/onboarding/login.dart';

import 'constants.dart';
import 'overlay.dart';

Future<dynamic> goto(BuildContext context, Widget page) {
  return Navigator.push(context, MaterialPageRoute(builder: (context) => page));
}


Future<dynamic> gotoAndClear(BuildContext context, Widget page) {
  return Navigator.pushAndRemoveUntil(context,
      MaterialPageRoute(builder: (c) => page), (route) => false);
}

Future<dynamic> gotoLogin(BuildContext context) {
  return Navigator.pushAndRemoveUntil(context,
      MaterialPageRoute(builder: (c) => const LoginScreen()), (r) => false);
}

void backToHome(BuildContext context) {
  return Navigator.popUntil(context, (route) => route.isFirst);
}


void goBack(BuildContext context,{ dynamic result}) {
  return Navigator.pop(context,result);
}


bool isIOS(BuildContext context){
  return Theme.of(context).platform == TargetPlatform.iOS;
}


bool isAndroid(BuildContext context){
  return Theme.of(context).platform == TargetPlatform.android;
}


class MaskedTextInputFormatter extends TextInputFormatter {
  final String mask;
  final String separator;

  // RegExp regExp;
  MaskedTextInputFormatter({
    required this.mask,
    required this.separator,
  }) {
    assert(mask != null);
    assert(separator != null);
  }

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    var reg = RegExp(r"^[0-9]+$");

    if (!reg.hasMatch(newValue.text.replaceAll(" ", "")) &&
        newValue.text.length > 0) {
      return oldValue;
    }

    if (newValue.text.endsWith(" ") &&
        newValue.text.length > oldValue.text.length) {
      return oldValue;
    }

    if (newValue.text.length > 0) {
      if (newValue.text.length > oldValue.text.length) {
        if (newValue.text.length > mask.length) return oldValue;
        if (newValue.text.endsWith(' ')) {
          print("trimming");
          return TextEditingValue(
            text: newValue.text.substring(0, newValue.text.length - 2),
            selection: TextSelection.collapsed(
              offset: newValue.selection.end - 1,
            ),
          );
        }
        if (newValue.text.length < mask.length &&
            mask[newValue.text.length - 1] == separator) {
          return TextEditingValue(
            text:
            '${oldValue.text}$separator${newValue.text.substring(newValue.text.length - 1)}',
            selection: TextSelection.collapsed(
              offset: newValue.selection.end + 1,
            ),
          );
        }
      }
    }
    return newValue;
  }
}

class CVVMaskedTextInputFormatter extends TextInputFormatter {
  final String mask;
  final String separator;
  CVVMaskedTextInputFormatter({
    required this.mask,
    required this.separator,
  }) {
    assert(mask != null);
    assert(separator != null);
  }

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    var reg = RegExp(r"^[0-9]+$");
    if (newValue.text.isNotEmpty) {
      if (newValue.text.length < oldValue.text.length) {
        return newValue;
      }
      if (!reg.hasMatch(newValue.text.replaceAll("/", ""))) {
        return oldValue;
      }
      if (newValue.text.length > 2) {
        String text = newValue.text.replaceAll("/", "");
        String n = '${text.substring(0, 2)}/${text.substring(2)}';
        return TextEditingValue(
            text: n,
            selection: TextSelection.collapsed(
              offset: newValue.selection.end + 1,
            ));
      }
    }
    return newValue;
  }
}



void changeFocus(BuildContext context, [FocusNode? node]){
  FocusScope.of(context).requestFocus(node??FocusNode());
}

void hideKeys(BuildContext context){
  changeFocus(context);
}


Route createRoute2(Widget Page) {
  return PageRouteBuilder(
    transitionDuration: Duration(milliseconds: 1000),
    pageBuilder: (context, animation, secondaryAnimation) => Page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = Offset(0.0, 1.0);
      var end = Offset.zero;
      var curve = Curves.ease;

      var tween = Tween(begin: 0.0, end: 1.0).chain(CurveTween(curve: curve));

      return FadeTransition(
        opacity: animation.drive(tween),
        child: child,
      );
    },
  );
}

Uint8List dataFromBase64String(String base64String) {
  return base64Decode(base64String);
}

String base64String(Uint8List data) {
  return base64Encode(data);
}


String base64StringFromFile(File file) {
  try {
    List<int> imageBytes = file.readAsBytesSync();
    print(imageBytes);
    String base64Image = "data:image/png;base64,"+base64Encode(imageBytes);
    return base64Image;
  } catch (e) {
    print(e);
    return "document";
  }
}



String? validateField(String? text) {
  text = text??"".trim();
  RegExp regExp = RegExp(r'^[a-zA-Z]+$');
  if (text.isEmpty) {
    return "Field cannot be empty!";
  }
//  else if (!regExp.hasMatch(text)) {
//    return "Invalid input";
//  }
  return null;
}


String? validatePassword(String? text) {
  text = text??"".trim();
  RegExp regExp = RegExp(r'^[a-zA-Z]+$');
  if (text.isEmpty) {
    return "Field cannot be empty!";
  }
//  else if (!regExp.hasMatch(text)) {
//    return "Invalid input";
//  }
  return null;
}

String? validateName(String? t) {
  String text = t??"";
  text = text.replaceAll(" ", "-");
  while(text.contains("--")){
    text = text.replaceAll("--", "-");
  }
  text = text.trim().replaceAll("  ", " ");
  RegExp regExp = RegExp(r'^[a-zA-Z]+$');
  if (text.isEmpty) {
    return "Field cannot be empty!";
  }
  else if (!regExp.hasMatch(text)) {
    return "Invalid input";
  }
  if(text.split("-").length < 2){
    return "First name and last name required";
  }else if(text.split("-").length > 2){
    return "Require only First and Last name";
  }
  return null;
}

String? validateEmail(String? t) {
  String text = t??"";
  var regExp = RegExp(
    '[a-zA-Z0-9\\+\\.\\_\\%\\-\\+]{1,256}' +
        '\\@' +
        '[a-zA-Z0-9][a-zA-Z0-9\\-]{0,64}' +
        '(' +
        '\\.' +
        '[a-zA-Z0-9][a-zA-Z0-9\\-]{0,25}' +
        ')+',
    caseSensitive: false,
    multiLine: false,
  );
  if (text.isEmpty) {
    return 'Field cannot be empty!';
  } else if (!regExp.hasMatch(text)) {
    return 'invalid email address';
  }
  return null;
}

String? validatePhone(String? t) {
  if(t == null){
    return "Please input a valid phone number";
  }else if(t.length == 11 || t.length == 14) {
    return null;
  }else{
    return "Please input a valid phone number";
  }
  // String text = t??"";
  // var regExp = RegExp(r'^[0-9]+$');
  // if (text.isEmpty) {
  //   return 'Field cannot be empty!';
  // } else if (text.length < 11 && text[0] == '0') {
  //   return 'Please input a valid phone number';
  // } else if (!regExp.hasMatch(text)) {
  //   return 'Phone number invalid';
  // }
  return null;
}

// 295591
void showErrorPopUp(BuildContext context, String message,){
  showCustomDialog(DialogType.error, context, "", message, "Close", () {
    goBack(context);
  });
}
// void showSuccessPopUp(BuildContext context, String message){
//   showCustomDialog(DialogType.success, context, "Success", message, "Close", () {
//     goBack(context);
//   });
// }

void showSuccessPopUp(BuildContext context, String message, {Function? onClose}){
  showCustomDialog(DialogType.success, context, "", message, "Ok", () {
    goBack(context);
    if(onClose != null){
      onClose();
    }
  });
}
enum DialogType { error, success }
void showCustomDialog(DialogType type, BuildContext context,String title,
    String message, String actionText, VoidCallback onClose,
    {bool hasClose = false, bool showIcon = true}) async {
  showGeneralDialog(
      context: context,
      barrierColor: Colors.white70,
      transitionBuilder: (context, a1, a2, widget)=> Transform.scale(scale: a1.value,
        child: Opacity(
          opacity: a1.value,
          child: AlertDialog(
            elevation: 8,
            contentPadding: const EdgeInsets.all(0),
            backgroundColor: Colors.transparent,
            content: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    transform: Matrix4.translationValues(13, -13, 0),
                    alignment: Alignment.topRight,
                    child: (!hasClose)
                        ? Container()
                        : GestureDetector(
                      onTap: () {
                        Navigator.of(context, rootNavigator: true).pop();
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          radius: 15,
                          backgroundColor: Colors.red,
                          child: Icon(
                            Icons.close,
                            size: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      const SizedBox(height: 20),
                      Image.asset(
                        (type == DialogType.success)
                            ? '$image_path/green_check_icon.png'
                            : "$image_path/red_close_icon.png",
                        height: 50,
                        width: 50,
                        // color: (type == DialogType.success)
                        //     ? Colors.green[800]
                        //     : Colors.red[700],
                      ).paddingBottom(10),
                    ],
                  ).hideIf(!showIcon),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.white,
                    ),
                    width: double.infinity,
                    padding: EdgeInsets.only(top: 5),
//                    color: Colors.orange,
//                    padding: EdgeInsets.(: 20),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        if(!title.hasNothing)Padding(
                          padding: const EdgeInsets.only(
                              left: 20.0, right: 20.0, bottom: 0, top: 10),
                          child: Text(
                            title,
                            maxLines: 5,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                fontSize: 18,
                                wordSpacing: 2,
                                height: 2,
                                fontWeight: FontWeight.bold, color: black),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20.0, right: 20.0, bottom: 15.0, top: 0),
                          child: Text(
                            message,
                            maxLines: 5,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(color: black,height: 1.6,wordSpacing: 1.3,
                                fontSize: 14.0, fontWeight: FontWeight.normal),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    padding: const EdgeInsets.only(
                        left: 20.0, right: 20.0, bottom: 20.0),
                    child: SizedBox(
                      width: double.infinity,
                      height: 45,
                      child: MaterialButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(2)),
                          padding: const EdgeInsets.symmetric(vertical: 11),
                          onPressed: onClose,
                          color: black,
                          child: Text(
                            actionText.toUpperCase(),
                            style:const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          )),
                    ),
                  ),
                ],
              ),
            ),
          ).paddingX(20),
        ),),
      transitionDuration: const Duration(milliseconds: 400),
      barrierDismissible: true,
      barrierLabel: '',
      pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
        return Container();
      });
}


void showAllPDialog(BuildContext context, Widget child) async {
  showGeneralDialog(
      context: context,
      barrierColor: Colors.white70,
      transitionBuilder: (context, a1, a2, widget)=> Transform.scale(scale: a1.value,
        child: Opacity(
          opacity: a1.value,
          child: AlertDialog(
            elevation: 8,
            contentPadding: const EdgeInsets.symmetric(horizontal: 0),
            backgroundColor: Colors.transparent,
            content: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: child,
            ),
          ).paddingX(20),
        ),),
      transitionDuration: const Duration(milliseconds: 400),
      barrierDismissible: true,
      barrierLabel: '',
      pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
        return Container();
      });
}




String formatMoney(double? amount, {bool floor = true, String symbol = "₦"}) {
  if(amount != null) {
    return NumberFormat.currency(symbol: symbol, decimalDigits: (floor) ? 0 : 2)
        .format(amount);
  }
  return "0";
}

String get nairaSymbol => "₦";



DateFormat format1 = DateFormat("d MMM, yyyy","en_US");
DateFormat dd_mm_yy = DateFormat("dd/MM/y","en_US");



void mockServerCall(BuildContext context, Function callback, {Duration? duration})async{
  showOverlay(context, message: "Loading");
  Future.delayed(duration?? const Duration(milliseconds: 1200),(){
    hideOverlay(context);
    callback();
  });
}


class ResponseCode {
  static const int ok = 200;
  static const int created = 201;
  static const int serverError = 500;
  static final int not_found = 404;
}

typedef NetworkCall = Future<Response> Function();
int TIMEOUT = 5000;

class ServiceUtilities {
  /// this method simple convert the http response to the object specified in @bluePrint
  /// in other the use this method, the object's class passed must inherit the Blueprint class
  static Future<APIResponse<T>> deserializeResponse<T>(
      NetworkCall networkCall, BaseModel? bluePrint) async {
    late Response response;
    var apiResponse = APIResponse<T>();
    var error = "";


    try {
      response = await networkCall();
    } catch  (e) {
      error = e.toString();
      if(error.contains('timed out')){
        error = "Oops! Connection timed out.\nPlease check your internet connection.";
      }
      print(e);
    }
    try {
      Map object = json.decode(response.bodyString);
      apiResponse.code = object['code'];
      apiResponse.totalCount = object['totalCount'];
      apiResponse.statusCode = response.statusCode;
      apiResponse.description = object['description'];
      apiResponse.hasErrors = (object['hasErrors'] || apiResponse.code == 200);
      apiResponse.errors = object['errors'];
      apiResponse.responseCode = object['responseCode'];
      apiResponse.raw = response.bodyString;
      if (response.statusCode >= 200 &&
          response.statusCode <= 300 &&
          (apiResponse.hasErrors)) {

        if(bluePrint == null){
          if(T is bool || T is String || T is int){
            apiResponse.payload = object['payload'];
          }
        }else{
        apiResponse.payload = bluePrint.fromJSON(object['payload']);
      }
      }
    } catch (e) {
      apiResponse.hasErrors = true;
      apiResponse.description = "Server error";
      apiResponse.errors = [error];
    }
    if (error.isNotEmpty) {
      apiResponse.errors.add(error);
    }
    return apiResponse;
  }

  /// Similar to @decorateResponse but contains empty body since the token request response has no body.
  static Future<APIResponse<TokenResponseObject>>
  deserializeTokenResponse<TokenResponseObject>(
      NetworkCall networkCall, BaseModel bluePrint) async{
    late Response response;
    var apiResponse = APIResponse<TokenResponseObject>();
    var error = "";
    try {
      response = await networkCall();
    } catch  (e) {
      error = e.toString();
      if(error.contains('timed out')){
        error = "Oops! Connection timed out.\nPlease check your internet connection.";
      }
      print(e);
    }
    try {
      Map object = json.decode(response.bodyString);
      apiResponse.code = response.statusCode;
      apiResponse.totalCount = 0;
      apiResponse.description = "";
      apiResponse.statusCode = response.statusCode;
      apiResponse.hasErrors = (response.statusCode != ResponseCode.ok);
      apiResponse.responseCode = response.statusCode;
      apiResponse.raw = response.bodyString;
      if (response.statusCode >= 200 && response.statusCode <= 300) {
        apiResponse.payload = bluePrint.fromJSON(object);
      }
      return apiResponse;
    } catch (e) {
      apiResponse.description = "Service unavailable";
      apiResponse.statusCode = response.statusCode;
      return apiResponse;
    }
  }
}

class AppUtilities {
  static Future<bool> isNetworkActive() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      return true;
    }
    return false;
  }

  static void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      duration: const Duration(seconds: 3),
    ));
  }


  static String stringToTimeOfDay(String tod) {
    int hour = int.parse(tod.split(":")[0]);
    int minute = int.parse(tod.split(":")[1]);
    var a = "";
    var h = "";
    var m = "";
    if (hour > 12) {
      a = "pm";
      h = "${hour - 12}";
    } else {
      a = "am";
      h = "${hour}";
    }

    m = (minute > 9) ? "${minute}" : "0$minute";
    return "$h:$m $a";
  }

}


delay(int time, Function f){
  Future.delayed(Duration(milliseconds: time), (){
    f.call();
  });
}



