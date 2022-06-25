import 'package:flutter/material.dart';

enum Flavor {
  DEV,
  STAG,
  PROD
}


extension EnumExtention on Flavor{

  String get enumValue {
    switch(this){
      case Flavor.DEV: return "Development";
      case Flavor.STAG: return "Staging";
      case Flavor.PROD: return "Production";
    }
    return "";
  }
}
//
// class FlavorValues {
//   FlavorValues({@required this.baseUrl});
//   final String baseUrl;
// //Add other flavor specific values, e.g database name
// }

class FlavorConfig {
  final Flavor flavor;
  final String name;
  final Color color;
  final dynamic values;
  static FlavorConfig? _instance;

  factory FlavorConfig({
    required Flavor flavor,
    Color color = Colors.blue,
    required dynamic values,
  }) {
    _instance ??= FlavorConfig._internal(
        flavor, flavor.enumValue, color, values);
    return _instance!;
  }

  FlavorConfig._internal(this.flavor, this.name, this.color, this.values);
  static FlavorConfig get instance { return _instance!;}
  static bool isProduction() => _instance!.flavor == Flavor.PROD;
  static bool isDevelopment() => _instance!.flavor == Flavor.DEV;
  static bool isQA() => _instance!.flavor == Flavor.STAG;
}
