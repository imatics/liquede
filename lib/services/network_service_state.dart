import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NetworkServiceState2 with ChangeNotifier{

  bool _networkActive = false;
  bool get networkActive => _networkActive;
  late StreamSubscription _networkStream;

  NetworkServiceState2(){
    _initListener();
  }


  void _initListener(){
    _networkStream = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      _networkActive = result == ConnectivityResult.mobile ||
          result == ConnectivityResult.wifi;
      notifyListeners();
      print("network changed $_networkActive");
    });
    (Connectivity().checkConnectivity()).then((result) {
      _networkActive = result == ConnectivityResult.mobile ||
          result == ConnectivityResult.wifi;
      notifyListeners();
      print("network changed $_networkActive");

    });
  }

  @override
  void dispose() {
    super.dispose();
    _networkStream.cancel();
  }

}




class BaseWidgetState with ChangeNotifier{

  BaseWidgetState();

  factory BaseWidgetState.getInstance(BuildContext context) {
    return Provider.of<BaseWidgetState>(context, listen: false);
  }



  bool _isOverlayShowing = false;

  bool get isOverlayShowing => _isOverlayShowing;

  set isOverlayShowing(bool b) {
    if(b != _isOverlayShowing){
    _isOverlayShowing = b;
    Future.delayed(const Duration(milliseconds: 0), ()=> notifyListeners());
    }
  }


  OverlayStatus _status = OverlayStatus.normal;

  OverlayStatus get status => _status;

  set status(OverlayStatus newStatus) {
    if(status != newStatus){
    _status = newStatus;
    Future.delayed(const Duration(milliseconds: 0), ()=> notifyListeners());
    }
  }



}

enum OverlayStatus{
  normal,
  success,
  error
}
