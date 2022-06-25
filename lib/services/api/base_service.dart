import 'package:flutter/cupertino.dart';
import 'package:liquede/commons/def_types.dart';
import 'package:liquede/extensions/string.dart';
import 'package:liquede/services/network_service_state.dart';
import 'package:swagger/api.dart';
import 'api_error.dart';

abstract class BaseService with ChangeNotifier{

BaseService(this.context);

BuildContext context;

  void update(ApiClient client);


  Future<bool> isNetworkActive(APIAction<APIError>? onError)async{
    if (!NetworkServiceState2.getInstance(context).networkActive) {
      await Future.delayed(const Duration(milliseconds: 100), () {
        "====================>>Please check your internet connection!".log;
        if(onError != null) {
          onError(APIError.fromString(
              "Network Error\nPlease check your internet connection!"));
        }
      });
      return false;
    }
    return true;
  }

}
