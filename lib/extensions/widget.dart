import 'package:flutter/material.dart';
import 'package:liquede/commons/constants.dart';
import 'package:liquede/commons/def_types.dart';

extension WidgetExtension on Widget {
  Widget hideIf(bool when) {
    return when ? const SizedBox() : this;
  }

  Widget replace(Widget? widget, bool when) {
    return when ? (widget??const SizedBox()) : this;
  }

  Widget paddingAll(double value) {
    return Padding(
      padding: EdgeInsets.all(value),
      child: this,
    );
  }

  Widget paddingX(double value) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: value),
      child: this,
    );
  }

  Widget paddingY(double value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: value),
      child: this,
    );
  }

  Widget paddingTop(double value) {
    return Padding(
      padding: EdgeInsets.only(top: value),
      child: this,
    );
  }

  Widget paddingLeft(double value) {
    return Padding(
      padding: EdgeInsets.only(left: value),
      child: this,
    );
  }

  Widget paddingRight(double value) {
    return Padding(
      padding: EdgeInsets.only(right: value),
      child: this,
    );
  }

  Widget paddingBottom(double value) {
    return Padding(
      padding: EdgeInsets.only(bottom: value),
      child: this,
    );
  }

  Widget paddingMerge({
    double t = 0,
    double r = 0,
    double b = 0,
    double l = 0,
  }) {
    return Padding(
      padding: EdgeInsets.only(top: t, right: r, bottom: b, left: l),
      child: this,
    );
  }

  Widget paddingXY({double x = 0, double y = 0}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: y, horizontal: x),
      child: this,
    );
  }

  Widget get center {
    return Center(
      child: this,
    );
  }

  Widget get left {
    return Align(
      alignment: Alignment.centerLeft,
      child: this,
    );
  }

  Widget get right {
    return Align(
      alignment: Alignment.centerRight,
      child: this,
    );
  }

  Widget get top {
    return Align(
      alignment: Alignment.topCenter,
      child: this,
    );
  }

  Widget get bottom {
    return Align(
      alignment: Alignment.bottomCenter,
      child: this,
    );
  }

  Widget get stretch {
    return Expanded(
      child: this,
    );
  }

  Widget  withElevation(double e, {double r = 10, Color c = Colors.white}) {
    return Material(
      child: this,
      elevation: e,
      color: c,
      borderRadius: BorderRadius.circular(r),
    );
  }

  Widget flex(int flex) {
    return Expanded(
      flex: 1,
      child: this,
    );
  }

  Widget withForm(GlobalKey<FormState> key) {
    return Form(key: key, child: this);
  }

  Widget onclick(Function() onTap) {
    return GestureDetector(
      onTap: onTap,
      child: this,
    );
  }

  Widget onclickWithRipple(Function() onTap) {
    return InkWell(
      onTap: onTap,
      child: this,
    );
  }

  Widget decorate(List<Operation2<Widget>> actions) {
    Widget newWidget = this;
    actions.forEach((element) {
      newWidget = element(this);
    });
    return newWidget;
  }


  Widget stretchWith(Axis? a){
    if(a == null){
      return SizedBox(height: double.infinity,width: double.infinity, child: this);
    }else if(a == Axis.horizontal){
      return SizedBox(width: double.infinity, child: this);
    }else if(a == Axis.vertical){
      return SizedBox(height: double.infinity, child: this);
    }
    return SizedBox(height: double.infinity,width: double.infinity, child: this);
  }


  Widget stretchSize({double? w = double.infinity, double? h = double.infinity}){
    return SizedBox(height: h,width: w, child: this);
  }

}

Widget addSpace({double x = 0, double y = 0}) {
  return SizedBox(width: x, height: y);
}



Widget addLine(
    {double h = 1,
    double t = 1,
    double eI = 0,
    double sI = 0,
    Color c = textHintGrey}) {
  return Divider(
    height: h,
    color: c,
    thickness: t,
    endIndent: eI,
    indent: sI,
  );
}
