

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppStyle {

}

BoxShadow boxShadow({double elevation = 2}) => BoxShadow(
  color: Colors.grey[500]!.withOpacity(0.7),
  spreadRadius: elevation,
  blurRadius: elevation,
  offset: Offset(0, elevation-1), // changes position of shadow
);

class AppColors {}
