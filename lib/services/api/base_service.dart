import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:liquede/commons/overlay.dart';
import 'package:liquede/commons/utils.dart';
import 'package:liquede/main.dart';
import 'package:liquede/services/api/api_error.dart';
import 'package:liquede/services/network_service_state.dart';
import 'package:swagger/api.dart';

typedef EventChuck<T> = Stream<NetworkEvent<T>> Function();
typedef NetWorkCall<T> = Future<BaseResponse<T>?> Function();

abstract class BaseService with ChangeNotifier{

BaseService();

final String networkErrorMessage = "Network Error\nPlease check your internet connection!";


  // void update(ApiClient client);


  Future<bool> isNetworkActive()async{
    if (!networkState.networkActive) {
      await Future.delayed(const Duration(milliseconds: 100));
      return false;
    }
   return true;
  }



Stream<NetworkEvent<T>> executeCall<T>(NetWorkCall<T> workCall){
  final streamController = StreamController<NetworkEvent<T>>();
  streamController.add(NetworkEvent<T>(message: "",type: NetworkEventType.pending));
  isNetworkActive().then((value){
    if(value){
      streamController.add(NetworkEvent<T>(message: "",type: NetworkEventType.processing));
      workCall.call().then((value){
        if(value?.status == true){
          streamController.add(NetworkEvent<T>(message: "",type: NetworkEventType.completed, data: value?.data));
        }else{
          streamController.add(NetworkEvent<T>(message: value?.message??"Something went wrong",type: NetworkEventType.failed,));
        }
      });
    }else{
      streamController.add(NetworkEvent<T>(type: NetworkEventType.failed, message: networkErrorMessage));
    }
  }).onError((error, stackTrace){
    streamController.add(NetworkEvent<T>(type: NetworkEventType.failed, message: "Something went wrong", error: APIError.fromTrace(error, stackTrace)));
  });
  return streamController.stream;
}


Stream<NetworkEvent<T>> executeReturnOrCall<T>( T data, NetWorkCall<T> workCall, {bool mustEx = false}){
  final streamController = StreamController<NetworkEvent<T>>();
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







typedef Action<T> = void Function(T);

extension NetworkEventEXT<T> on NetworkEvent<T>{

  performOnSuccess(Action<T> action){
    if(type == NetworkEventType.completed){
      action.call(data!);
    }
  }


  void handleState(BuildContext context, {String message = "Processing", String? errorMessage}){
    if(type == NetworkEventType.processing){
      showOverlay(context, message: message);
    }else if(type == NetworkEventType.completed){
      hideOverlay(context);
    }else if(type == NetworkEventType.failed){
      showErrorPopUp(context, errorMessage??message);
    }
  }

}
