import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:liquede/services/network_service_state.dart';
import 'package:swagger/api.dart';

typedef EventChuck<T> = Stream<NetworkEvent<T>> Function();

abstract class BaseService with ChangeNotifier{

BaseService(this.context);

final String networkErrorMessage = "Network Error\nPlease check your internet connection!";

BuildContext context;

  void update(ApiClient client);


  Future<bool> isNetworkActive()async{
    if (!NetworkServiceState2.getInstance(context).networkActive) {
      await Future.delayed(const Duration(milliseconds: 100));
      return false;
    }
   return true;
  }




  Stream<NetworkEvent> makeCall(EventChuck eventChuck) async*{
    final streamController = StreamController();
    if(await isNetworkActive()){
   streamController.sink.add("");
  }
  }

}




class NetworkEvent<T>{
  final NetworkEventType type;
  final T? data;
  final String message;

  NetworkEvent({this.type = NetworkEventType.pending, this.data, this.message = ""});

}

enum NetworkEventType{
  pending,
  processing,
  completed,
  failed
}
