

import 'package:liquede/commons/encryption.dart';
import 'package:liquede/commons/size_config.dart';
import 'package:liquede/commons/utils.dart';

extension OBJExt on Object? {
  bool get log {
    print(this);
    return true;
  }
}

extension StringExtension on String? {
  bool get hasNothing {
    return this == null || this!.isEmpty;
  }

  String replace(String text, bool when) {
    return when ? (this ?? "") : text;
  }

  String get encrypt {
    if(this == null){
      return "";
    }
    return encryptText(this??"");
  }

  String get decrypt {
    if(this == null){
      return "";
    }
    return decryptText(this??"");
  }

  String prefix(String text) {
    return "$text${(this ?? "")}";
  }

  String suffix(String text) {
    return "${(this ?? "")}$text";
  }

  String get imagePng {
    return "assets/images/$this.png";
  }

  String get iconPng {
    return "assets/icons/$this.png";
  }

  String get toIconSVGPath {
    return "assets/icon/$this.svg";
  }

  String get toSVGPath {
    return "assets/images/$this.svg";
  }

  double get cleanMoneyValue {
    String s = this??"";
    return double.tryParse(s.replaceAll(nairaSymbol, "").replaceAll(",", ""))??0.0;
  }

  bool get log {
    print(this);
    return true;
  }

  String replaceIfEmpty(String s) {
    if ((this ?? "").isNotEmpty) {
      return this!;
    } else {
      return s;
    }
  }

// String get normalizePhone {
//   if(this.startsWith("+")){
//     return this.replaceAll(" ", "").replaceAll("-", "").replaceAll("(", "").replaceAll(")", "");
// }else{
//   return "+234${this.substring(1)}".trim();
// }
// }
}

extension DoubleExtension on double? {
  double get percentOfWindowHeight {
    if (this == null) {
      return 0;
    }
    return (this! / 100.0) * SizeConfig.screenHeight;
  }

  double get percentOfWindowWidth {
    if (this == null) {
      return 0;
    }
    return (this! / 100.0) * SizeConfig.screenWidth;
  }
}
