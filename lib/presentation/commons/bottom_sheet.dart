import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:liquede/commons/constants.dart';
import 'package:liquede/commons/size_config.dart';
import 'package:liquede/extensions/widget.dart';

class _CustomBottomSheet extends StatefulWidget {
  const _CustomBottomSheet(Widget child, {Key? key}) : super(key: key);

  @override
  State<_CustomBottomSheet> createState() => _CustomBottomSheetState();
}

class _CustomBottomSheetState extends State<_CustomBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

Future launchBottomSheet(BuildContext context, Widget child) {
  return showModalBottomSheet(
      context: context,
      backgroundColor: transparent,
      barrierColor: Colors.white60,
      builder: (context) {
        return Material(
                color: white,
                elevation: 10,
                shadowColor: Colors.black,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        topLeft: Radius.circular(20))),
                child: child.paddingAll(20))
            .paddingMerge(t: 80); //CustomBottomSheet(child);
      });
}


Future launchBottomSheetFull(BuildContext context, Widget child, {double hFactor = 1, double horizontalPadding = 1}) {
  return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: transparent,
      barrierColor: Colors.black38,
      builder: (context) {
        return FractionallySizedBox(
          heightFactor: hFactor,
          child: Material(
              color: white,
              elevation: 4,
              shadowColor: Colors.black,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(20))),
              child: child.paddingMerge(t: 20,r: 20,l: 20)),
        );

      });
}
