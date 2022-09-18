import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:liquede/services/api/api_error.dart';
import 'package:liquede/services/network_service_state.dart';
import 'package:swagger/api.dart';

typedef EventChuck<T> = Stream<NetworkEvent<T>> Function();
typedef NetWorkCall<T> = Future<BaseResponse<T>?> Function();

abstract class BaseService with ChangeNotifier{

BaseService(this.context);

final String networkErrorMessage = "Network Error\nPlease check your internet connection!";

BuildContext context;

  // void update(ApiClient client);


  Future<bool> isNetworkActive()async{
    if (!NetworkServiceState2.getInstance(context).networkActive) {
      await Future.delayed(const Duration(milliseconds: 100));
      return false;
    }
   return true;
  }



Stream<NetworkEvent<dynamic>> executeCall(NetWorkCall<dynamic> workCall){
  final streamController = StreamController<NetworkEvent<dynamic>>();
  streamController.add(NetworkEvent(message: "",type: NetworkEventType.pending));
  isNetworkActive().then((value){
    if(value){
      streamController.add(NetworkEvent(message: "",type: NetworkEventType.processing));
      workCall.call().then((value){
        if(value?.status == true){
          streamController.add(NetworkEvent(message: "",type: NetworkEventType.completed, data: value?.data));
        }else{
          streamController.add(NetworkEvent(message: value?.message??"Something went wrong",type: NetworkEventType.failed,));
        }
      });
    }else{
      streamController.add(NetworkEvent(type: NetworkEventType.failed, message: networkErrorMessage));
    }
  }).onError((error, stackTrace){
    streamController.add(NetworkEvent(type: NetworkEventType.failed, message: "Something went wrong", error: APIError.fromTrace(error, stackTrace)));
  });
  return streamController.stream;
}


Stream<NetworkEvent<dynamic>> executeReturnOrCall( dynamic data, NetWorkCall<dynamic> workCall, {bool mustEx = false}){
  final streamController = StreamController<NetworkEvent<dynamic>>();
  if(data != null || mustEx){
    streamController.add(NetworkEvent(type: NetworkEventType.completed, message: "", data:  data));
    return streamController.stream;
  }else{
    return executeCall(workCall);
  }
}

}




class NetworkEvent<T>{
  final NetworkEventType type;
  final T? data;
  final String message;
  final APIError? error;
  NetworkEvent({this.type = NetworkEventType.pending, this.data, this.message = "", this.error});

}

enum NetworkEventType{
  pending,
  processing,
  completed,
  failed
}
