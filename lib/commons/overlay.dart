
import 'package:flutter/material.dart';

import 'constants.dart';
import 'def_types.dart';
import '../services/network_service_state.dart';
import 'reusables.dart';

class OverlayScreen {



  OverlayScreen._internal();

  static String _message = '';
  static final OverlayScreen _instance = OverlayScreen._internal();

  /// Singleton constructor.
  factory OverlayScreen() => _instance;

  Screen _state = Screen.none;
  late BuildContext _overlayScreenContext;
  final Map<String, CustomOverlayScreen> _customOverLayScreens = {
    'default-loading': CustomOverlayScreen(
      backgroundColor: Colors.transparent,
      content: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          appLoadingWidgetBig,
          const SizedBox(height: 20.0),
          kText(
            _message,
            defaultStyle: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w500,
                fontStyle: FontStyle.italic),
          ),
        ],
      ),
    )
  };

  /// Getter to know the state of the [OverlayScreen].
  Screen get state => _state;

  /// This method saves widgets to show by [show].
  void saveScreens(Map<String, CustomOverlayScreen> widgets) =>
      _instance._customOverLayScreens.addAll(widgets);

  /// This method removes widgets to show by [show].
  void removeScreens(List<String> identifiers) => identifiers.forEach(
          (identifier) => _instance._customOverLayScreens.remove(identifier));

  /// This method displays a [OverlayScreen] by an identifier.
  void show(BuildContext context,
      {String identifier = 'default-loading',
        String message = 'loading please wait...'}) {
    _message = message;
    assert(_instance._customOverLayScreens.isNotEmpty, "overlay screens empty");
    assert(_customOverLayScreens.containsKey(identifier), "widget not found");
    assert(_instance._state == Screen.none, "already showing screen");
    _instance._state = Screen.showing;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        _instance._overlayScreenContext = context;
        print("instancke created");
        return WillPopScope(
          onWillPop: () async => true,
          child: Center(
            child: SizedBox(
              height: 100,
              width: 100,
              child: Material(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal:15.0, vertical: 25),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      appLoadingWidgetBig,
                      const SizedBox(height: 10.0),
                      Text(
                        _message,
                        style: const TextStyle(
                            color: primaryColor,
                            fontSize: 12,
                            decoration: TextDecoration.none,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w400,
                            fontFamily: "Baloo_Bhai_2"),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    ).then((value) {
      _instance._state = Screen.none;
    });
  }

  /// This method dispose the [OverlayScreen].
  void pop() {
    if(_instance._state == Screen.showing){
      print(_instance._overlayScreenContext);
      // if(_instance._overlayScreenContext != null)
      Navigator.pop(_instance._overlayScreenContext);
      // _instance._overlayScreenContext = null;
      _instance._state = Screen.none;
    }}
}

/// Custom widget to display in a [OverlayScreen].
class CustomOverlayScreen extends StatelessWidget {
  /// Backgroundcolor for [OverlayScreen].
  final Color backgroundColor;

  /// Custom content for [OverlayScreen].
  final Widget content;

  /// CustomOverlayScreen constructor.
  const CustomOverlayScreen({
    required this.content,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return AlertDialog(
      backgroundColor: backgroundColor,
      contentPadding: EdgeInsets.zero,
      insetPadding: EdgeInsets.zero,
      elevation: 10,
      content: Container(
        height: size.height,
        width: size.width,
        child: content,
      ),
    );
  }
}

/// State of the [OverlayScreen].
enum Screen {
  /// Already [OverlayScreen] showing.
  showing,

  /// No [OverlayScreen] showing.
  none,
}

bool _overlayActive = false;
void showOverlay(BuildContext context, {String message = "processing"}){
  _overlayActive = true;
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return WillPopScope(
        onWillPop: () async => true,
        child: Center(
          child: SizedBox(
            height: 150,
            width: 150,
            child: Material(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal:15.0, vertical: 25),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    appLoadingWidgetBig,
                    const SizedBox(height: 15.0),
                    Text(
                      message,
                      style: const TextStyle(
                        // color: $styles.colors.secondaryColor_900,
                          fontSize: 14,
                          decoration: TextDecoration.none,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w400,
                          fontFamily: "Baloo_Bhai_2"),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    },
  ).then((value) {
    _overlayActive = false;
  });


}


void hideOverlay(BuildContext context){
  if(_overlayActive){
    Navigator.of(context).pop();
  }
}



Future<bool> doWithOverlay(BuildContext context, Operation task,
    {String? message}) async {
  if (task != null) {
    try {
      if (OverlayScreen().state != Screen.none) {
        OverlayScreen().pop();
      }
      OverlayScreen().show(context, message: message??"");
      if (await task()) {
        OverlayScreen().pop();
        return true;
      } else {
        OverlayScreen().pop();
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }
  return false;
}




Future<DateTime?> showDatePickerDialog(BuildContext context, {DateTime?  initialDate, DateTime?  firstDate, DateTime?  lastDate}) {
  return showDatePicker(
      context: context,
      initialDate: initialDate?? DateTime.now(),
      firstDate:firstDate?? DateTime(1900, 1, 1),
      lastDate: lastDate??DateTime.now().add(const Duration(days: 1000)),
      builder: (context, child) => Theme(
        data: Theme.of(context).copyWith(
          colorScheme: ColorScheme.light(
            primary: Colors.black, // header background color
            onPrimary: Colors.white, // header text color
            onSurface: Colors.black, // body text color
          ),
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
              primary: Colors.black, // button text color
            ),
          ),
        ),
        child: child!,
      ));
}
