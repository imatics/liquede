import 'dart:ui';
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:liquede/commons/size_config.dart';
import 'package:liquede/presentation/commons/bottom_sheet.dart';
import 'package:progress_indicators/progress_indicators.dart';
import 'package:liquede/commons/style.dart';
import 'package:liquede/commons/utils.dart';
import 'package:liquede/extensions/others.dart';
import 'package:liquede/extensions/string.dart';
import 'package:liquede/extensions/widget.dart';

import 'constants.dart';




AppBar get defaultAppBar => AppBar(
  automaticallyImplyLeading: true,
  elevation: 0,
  backgroundColor: white,
);

Text getText(String? content,
    {Key? key,
    double size = 14,
    FontWeight w = FontWeight.w400,
    TextAlign a = TextAlign.left,
    TextDecoration? deco,
    TextOverflow? overflow,
    Color color = const Color(0xff555555),
    FontStyle style = FontStyle.normal}) {
  return Text(
    content ?? "",
    key: key,
    textAlign: a,
    overflow: overflow,
    style: TextStyle(
        fontSize: size,
        fontWeight: w,
        fontStyle: style,
        color: color,
        decoration: deco),
  );
}

class KInputFieldProps {
  KInputFieldProps(
      {this.validators,
      this.onclick,
      this.isPassword,
      this.readOnly,
      this.hint,
      this.inputType,
      this.inputAction,
      this.onChange,
      this.inputDecorator,
      this.label,
      this.focusNode,
      this.nextFocusNode,
      this.keyboardSide,
      this.textEditingController,
      this.maxLines,
      this.minLines,
      this.inputFormatter,
      this.maxLength,
      this.style,
        this.textAlign,
      this.inputDecoration,
      this.autoValidateMode,
        this.fillColor,
        this.context,
      this.enabled});

  List<FormFieldValidator<String>>? validators;
  Function()? onclick;
  BuildContext? context;
  bool? isPassword = false;
  bool? isMoney = false;
  bool? readOnly = false;
  bool? enabled = true;
  String? hint = "";
  TextInputType? inputType;
  TextInputAction? inputAction;
  Function(String)? onChange;
  Function(String)? onSubmit;
  InputDecorator? inputDecorator;
  String? label;
  FocusNode? focusNode;
  FocusNode? nextFocusNode;
  KeyboardSide? keyboardSide;
  TextEditingController? textEditingController;
  int? maxLines;
  int? minLines;
  List<TextInputFormatter>? inputFormatter;
  int? maxLength;
  TextStyle? style;
  InputDecoration? inputDecoration;
  AutovalidateMode? autoValidateMode;
  TextDirection? textDirection;
  TextAlign? textAlign;
  StrutStyle? strutStyle;
  Color? fillColor;

  static KInputFieldProps copyFrom(KInputFieldProps props) {
    KInputFieldProps d = KInputFieldProps();

    if (props.keyboardSide != null) {
      d.keyboardSide = props.keyboardSide;
    }

    if (props.inputAction != null) {
      d.inputAction = props.inputAction;
    }

    if (props.context != null) {
      d.context = props.context;
    }

    if (props.hint != null) {
      d.hint = props.hint;
    }

    if (props.onChange != null) {
      d.onChange = props.onChange;
    }

    if (props.onclick != null) {
      d.onclick = props.onclick;
    }

    if (props.inputDecorator != null) {
      d.inputDecorator = props.inputDecorator;
    }

    if (props.textEditingController != null) {
      d.textEditingController = props.textEditingController;
    }

    if (props.maxLines != null) {
      d.maxLines = props.maxLines;
    }

    if (props.minLines != null) {
      d.minLines = props.minLines;
    }

    if (props.inputFormatter != null) {
      d.inputFormatter = props.inputFormatter;
    }

    if (props.isMoney != null) {
      d.isMoney = props.isMoney;
    }

    if (props.inputDecoration != null) {
      d.inputDecoration = props.inputDecoration;
    }

    if (props.autoValidateMode != null) {
      d.autoValidateMode = props.autoValidateMode;
    }

    if (props.textDirection != null) {
      d.textDirection = props.textDirection;
    }

    if (props.textAlign != null) {
      d.textAlign = props.textAlign;
    }

    if (props.strutStyle != null) {
      d.strutStyle = props.strutStyle;
    }

    if (!props.validators.hasNothing) {
      d.validators = props.validators;
    }

    if (props.fillColor != null) {
      d.fillColor = props.fillColor;
    }

    return d;
  }
}

RichText kRichText(List<ManyText> items, {KTextStyle? style}) {
  return RichText(
    textAlign: style != null ?style.a?? TextAlign.start: TextAlign.start,
    text: TextSpan(
        style: style != null ? (style.style??style.build) : null,
        children: items.map((e) =>  TextSpan(text: e.text, recognizer: TapGestureRecognizer()..onTap = e.onTap, style: e.style.build,)).toList()),
  );
}

class ManyText {
  ManyText({this.style, this.onTap, this.text});

  String? text = "";
  Function()? onTap;
  KTextStyle? style;
}

class KTextStyle {

   KTextStyle({this.decoration, this.a, this.color, this.fontSize, this.fontStyle, this.maxLines, this.overflow, this.weight, this.height, this.style, this.useDefaultFont});

  double? fontSize;
  double? height;
  int? maxLines;
  FontWeight? weight;
  TextAlign? a;
  bool? useDefaultFont;
  TextDecoration? decoration;
  TextOverflow? overflow;
  Color? color;
  FontStyle? fontStyle;
  TextStyle? style;

}

extension TextStyleExt on KTextStyle?{

  TextStyle? get build{
    if(this != null){
    return TextStyle(
        fontSize: this!.fontSize,
        color: this!.color,
        fontWeight: this!.weight,
        decoration: this!.decoration,
        fontStyle: this!.fontStyle,
        height: this!.height,
        fontFamily: (this!.useDefaultFont??false)?"Roboto":null
    );
  }else {
      return null;
    }}


}


Text kText(String? content,
    {TextStyle defaultStyle = const TextStyle(),
    Key? key,
    double? fontSize,
    double? spacing,
    double? letterSpacing,
    double? height,
    int? maxLines,
    FontWeight? weight,
    TextAlign? a,
    TextDecoration? decoration,
    TextOverflow? overflow,
    Color? color,
    FontStyle? fontStyle}) {
  return Text(
    String.fromCharCodes(Runes(content ?? "")),
    key: key,
    textAlign: a,
    overflow: overflow,
    maxLines: maxLines,
    style: const TextStyle().copyWith(
        fontSize: fontSize?? defaultStyle.fontSize,
        wordSpacing: spacing ?? defaultStyle.wordSpacing,
        height: height ?? defaultStyle.height,
        fontWeight: weight ?? defaultStyle.fontWeight??FontWeight.normal,
        fontStyle: fontStyle ?? defaultStyle.fontStyle,
        letterSpacing: letterSpacing ?? defaultStyle.letterSpacing,
        color: color ?? defaultStyle.color,
        decoration: decoration ?? defaultStyle.decoration),
  );
}


Text kText2(String? content,
    {Key? key, KTextStyle? style}) {

  if(style != null){
    return Text(
      content ?? "",
      key: key,
      textAlign: style.a,
      overflow: style.overflow,
      maxLines: style.maxLines,
      style: (style.style??const TextStyle()).copyWith(
          fontSize: style.fontSize,
          fontWeight: style.weight,
          fontStyle: style.fontStyle,
          color: style.color,
          decoration: style.decoration),
    );
  }
  return Text(
    content ?? "",
    key: key,
  );
}



class EditTextField extends StatefulWidget {
  final KInputFieldProps fieldDecorator;
  const EditTextField(this.fieldDecorator, {Key? key}) : super(key: key);

  @override
  _EditTextFieldState createState() => _EditTextFieldState();
}

class _EditTextFieldState extends State<EditTextField> {
  bool textMasked = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    assert(widget.fieldDecorator.textEditingController != null);
  }

  InputDecoration getDecoration() {
    return (widget.fieldDecorator.inputDecoration ??
        InputDecoration(
          suffixIcon: getPasswordWidget(),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              borderSide: BorderSide(color: transparent, width: 0.5)),
          focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              borderSide: BorderSide(color: transparent, width: 1)),
          enabledBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              borderSide: BorderSide(color: Colors.grey[200]!, width: 0.5)),
          hintText: widget.fieldDecorator.hint,
          filled: true,
          fillColor: widget.fieldDecorator.fillColor??Colors.grey[200],
        ));
  }

  InputDecoration getDecoration2() {
    return (widget.fieldDecorator.inputDecoration ??
        InputDecoration(
          contentPadding: const EdgeInsets.all(0),
          border:  InputBorder.none,
          isDense: true,
          focusedBorder: InputBorder.none,
          enabledBorder:InputBorder.none,
          hintText: widget.fieldDecorator.hint,
        ));
  }

  @override
  Widget build(BuildContext context) {

    List<TextInputFormatter> formatters = widget.fieldDecorator.inputFormatter??[];
    if(widget.fieldDecorator.isMoney??false){
      formatters.add( CurrencyTextInputFormatter(symbol: nairaSymbol, decimalDigits: 0));
    }

    TextStyle style = widget.fieldDecorator.style??const TextStyle();
    if(widget.fieldDecorator.isMoney??false){
      style = KTextStyle(style: style, useDefaultFont: true, color: secondaryColor,
        weight: FontWeight.w500,
        fontSize: 15,).build!;
    }


    Widget textField =  TextFormField(
      onTap: widget.fieldDecorator.onclick,
      validator: (text) {
        if (!widget.fieldDecorator.validators.hasNothing) {
          for (FormFieldValidator<String> f
              in widget.fieldDecorator.validators ?? []) {
            String? issue = f(text);
            if (!issue.hasNothing) {
              return issue;
            }
          }
        }
        return null;
      },
      controller: widget.fieldDecorator.textEditingController,
      readOnly: widget.fieldDecorator.readOnly ?? false,
      textInputAction: (widget.fieldDecorator.nextFocusNode == null)
          ? widget.fieldDecorator.inputAction
          : TextInputAction.next,
      focusNode: widget.fieldDecorator.focusNode,
      onEditingComplete: () {
        if(widget.fieldDecorator.context != null) {
          FocusScope.of(widget.fieldDecorator.context!)
            .requestFocus(widget.fieldDecorator.nextFocusNode);
        }
      },
      keyboardType: widget.fieldDecorator.inputType,
      inputFormatters:formatters,
      key: widget.key,
      enabled: widget.fieldDecorator.enabled,
      obscureText: (widget.fieldDecorator.isPassword ?? false) && textMasked,
      maxLines: widget.fieldDecorator.maxLines ?? 1,
      maxLength: widget.fieldDecorator.maxLength,
      style: style,
      decoration: widget.fieldDecorator.label == null? (widget.fieldDecorator.inputDecoration ?? getDecoration()) : getDecoration2(),
      autovalidateMode: widget.fieldDecorator.autoValidateMode,
      minLines: widget.fieldDecorator.minLines,
      // textDirection: fieldDecorator.textDirection,
      textAlign: widget.fieldDecorator.textAlign ?? TextAlign.start,
      strutStyle: widget.fieldDecorator.strutStyle,
      onFieldSubmitted: (e){
        if(widget.fieldDecorator.onSubmit != null){
          widget.fieldDecorator.onSubmit;
        }
        if(widget.fieldDecorator.nextFocusNode == null){
          FocusScope.of(context).requestFocus(FocusNode());
        }else{
          FocusScope.of(context).requestFocus(widget.fieldDecorator.nextFocusNode);
        }
        },
    );
    if(widget.fieldDecorator.label.hasNothing){
      return textField;
    }else{
      return Container(
        padding: const EdgeInsets.only(left: 10,right: 10, bottom: 5, top: 5),
        decoration: BoxDecoration(
          color: widget.fieldDecorator.fillColor??Colors.grey[200],
          borderRadius: BorderRadius.circular(8)
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  kText(widget.fieldDecorator.label, fontSize: 10, color: textHintGrey),
                  textField.paddingMerge(t: 2, b: 5)
                ],
              ),
            ), getPasswordWidget()?? const SizedBox(),
          ],
        ),
      );
    }
  }

  Widget? getPasswordWidget() {
    if (widget.fieldDecorator.isPassword ?? false) {
      return IconButton(
          onPressed: () {
            setState(() {
              textMasked = !textMasked;
            });
          },
          icon: AnimatedCrossFade(
            firstChild: const Icon(
              Icons.visibility_off,
              color: grey,
            ),
            duration: defaultAnimationDuration,
            secondChild: const Icon(
              Icons.visibility,
              color: grey,
            ),
            crossFadeState: !textMasked
                ? CrossFadeState.showSecond
                : CrossFadeState.showFirst,
          ).center);
    }
    return null;
  }
}

enum BorderType { underline, outline, none }



    Widget get appLoadingWidget => const SpinKitRing(
      color: Colors.grey,
      size: 30,
      lineWidth: 2,
    );

Widget getImage(String? image, {double w = 80, double h = 80, BoxFit f = BoxFit.contain}) {
  if (image.hasNothing) {
    return getDefaultAvatar(w: w, h: h, f: f);
  }
  try {
    return Image.network(
      image!,
      height: h,
      width: w,
      fit: f,
      loadingBuilder: (context, widget, chuckEvent) {
        if (chuckEvent != null &&
            chuckEvent.cumulativeBytesLoaded != chuckEvent.expectedTotalBytes) {
          return appLoadingWidget;
        } else {
          return widget;
        }
      },
      errorBuilder: (_,__,___) => getDefaultAvatar(w: w, h: h, f: f),
    );
  } catch (e) {
    return getDefaultAvatar(w: w, h: h, f: f);
  }
}


Widget getDefaultAvatar({double w = 80, double h = 80, BoxFit f = BoxFit.contain}){
  return Image.asset(
    "$image_path/avatar_big.png",
    height: h,
    width: w,
    fit: f,
  );
}



ImageProvider imageProviderWidgetAd(List<String>? images) {
  if (images == null) {
    return const AssetImage("$image_path/default_image.png");
  }
  for (String image in images) {
    try {
      return NetworkImage(image.replaceAll("http:", "https:"));
    } catch (e) {}
  }
  return const AssetImage("$image_path/avater.png");
}


 bottomSheet(BuildContext context, Widget child){
   showModalBottomSheet(context: context,
       isScrollControlled: true,
       elevation: 0,
       backgroundColor: transparent,
       useRootNavigator: true,
       builder: (context){
         return Material(
           elevation: 2,
           borderRadius: const BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
           child: child,
         ).paddingTop(20.0.percentOfWindowHeight);
       });
 }



showToast(String message, {bool isError = false}){
  Fluttertoast.showToast(msg: message, gravity: ToastGravity.TOP, backgroundColor: isError ? red : green);
}


class OptionsAction{
  String label;
  Function onTap;
  Widget? leading;
  IconData? iconData;
  OptionsAction(this.label, this.onTap,{this.iconData, this.leading});

}

showBottomSheetOption(BuildContext context, String title, List<OptionsAction> actions){
  Widget w = Wrap(
    children: actions.map((e){
      late Widget l;
      if(e.leading != null){
       l =  e.leading!;
      }
      if(e.iconData != null){
       l = Icon(e.iconData) ;
      }
      return Container(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            SizedBox(
              height: 30,
              width: 30,
              child: l,
            ),
            addSpace(x: 20),
            kText(e.label)
          ],
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: kAppYellowDark.withAlpha(50), width: 1)
        ),
      ).onclickWithRipple(() => e.onTap()).paddingBottom(15);
    }).toList(),
  );
  launchBottomSheet(context, Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          kText(title),
          const Icon(Icons.close, size: 30,).onclickWithRipple((){
            goBack(context);
          })
        ],
      ).paddingTop(10),
      w.paddingMerge(t: 30, b: 65)
    ],
  ));



}


showBottomSheetCustomChild(BuildContext context, String title, Widget child, {bool centerTitle = false}){
  launchBottomSheet(context, Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Spacer().hideIf(!centerTitle),
          kText(title, weight: FontWeight.bold, fontSize: 14),
          const Icon(Icons.close, size: 30,).onclickWithRipple((){
            goBack(context);
          }).hideIf(centerTitle),
          Expanded(child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Icon(Icons.close, size: 30,).onclickWithRipple((){
                goBack(context);
              }).hideIf(!centerTitle),
            ],
          ))
        ],
      ).paddingTop(10),
      child.paddingMerge(t: 30, b: 65)
    ],
  ));

}

showBottomSheetFull(BuildContext context, String title, Widget child){
  launchBottomSheetFull(context, SizedBox(
    height: getPercentageHeight(100),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Spacer(),
            kText(title, weight: FontWeight.bold, fontSize: 14),
            Expanded(
              child: const Icon(Icons.close, size: 30,).onclickWithRipple((){
                goBack(context);
              }).right,
            )
          ],
        ).paddingMerge(t:20, b: 10),
        Expanded(child: child.paddingMerge(t: 10))
      ],
    ),
  ));

}


getDecoration({String? label,String? hint, Color? fillColor, Widget? password, Widget? counter, double? borderWidth,double? activeBorderWidth, Color? borderColor, Color? activeBorderColor,double? radius}){
  return InputDecoration(
    label: Text(label ?? ""),
    suffixIcon: password,
    contentPadding:
    const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
    border:  OutlineInputBorder(
        borderRadius:  BorderRadius.all(Radius.circular(radius??8)),
        borderSide: BorderSide(color: borderColor?? transparent, width: borderWidth??0.5)),
    focusedBorder:  OutlineInputBorder(
        borderRadius:  BorderRadius.all(Radius.circular(radius??8)),
        borderSide: BorderSide(color: activeBorderColor?? transparent, width:activeBorderWidth?? 1)),
    enabledBorder: OutlineInputBorder(
        borderRadius:  BorderRadius.all(Radius.circular(radius??8)),
        borderSide: BorderSide(color: borderColor?? Colors.grey[200]!, width: borderWidth??0.5)),
    hintText:hint,
    filled: true,
    counter: counter,
    fillColor: fillColor??Colors.grey[200],
  );
}

getUnderLineDecoration({String? label,String? hint, Color? fillColor, Widget? password, Widget? counter, double? borderWidth,double? activeBorderWidth, Color? borderColor, Color? activeBorderColor,double? radius}){
  return InputDecoration(
    label: Text(label ?? ""),
    suffixIcon: password,
    contentPadding:
    const EdgeInsets.symmetric(vertical: 15),
    border:  UnderlineInputBorder(
        borderSide: BorderSide(color: borderColor?? transparent, width: borderWidth??1)),
    focusedBorder:  UnderlineInputBorder(
        borderSide: BorderSide(color: activeBorderColor?? transparent, width:activeBorderWidth?? 1)),
    enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: borderColor?? Colors.grey[200]!, width: borderWidth??1)),
    hintText:hint,
    filled: true,
    counter: counter,
    fillColor: fillColor??Colors.grey[200],
  );
}

// limit, type,
