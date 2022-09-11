import 'package:flutter/cupertino.dart';
import 'package:liquede/commons/def_types.dart';
import 'package:liquede/services/api/base_service.dart';
import 'package:provider/provider.dart';
import 'package:swagger/api.dart';
import 'package:liquede/extensions/string.dart';

import 'api_error.dart';

class UserService extends BaseService{

  factory UserService.I(BuildContext context){
    return Provider.of<UserService>(context, listen: false);
  }


  late UserApi _api;
  late UserView _userView;
  UserView get userView => _userView;

  late BuildContext _context;
  UserService(this._context) : super(_context){
    _api = UserApi();
  }

  @override
  void update(ApiClient client) {
    _api = UserApi(client);
  }


  Stream<NetworkEvent> login(LoginModel request) async* {
    if(!await isNetworkActive()){
      return ;
    }else{
      _api.login(body: request).then((value){
        value!.status.log;
        value.statusCode.log;
        if(value.status??false){
           _userView = value.data!;
          onSuccess(value.data!);
        }else{

          onError(APIError.fromString(value.message));
        }
      }).onError((error, stackTrace){
        error.log;
        stackTrace.log;
        onError(APIError.fromString(error.toString()));
      });
    }
  }


  void register(Register request, APIAction<bool> onSuccess,
      APIAction<APIError> onError) async {
    if(!await isNetworkActive(onError)){
      return;
    }else{
      _api.register(body: request).then((value){
        value!.status.log;
        value.statusCode.log;
        if(value.status){
          onSuccess(value.data);
        }else{
          onError(APIError.fromString(value.message));
        }
      }).onError((error, stackTrace){
        error.log;
        stackTrace.log;
        onError(APIError.fromString(error.toString()));
      });
    }
  }


  void verifyUser(String token, String email, APIAction<UserView> onSuccess,
      APIAction<APIError> onError) async {
    if(!await isNetworkActive(onError)){
      return;
    }else{
      _api.verify(token,email).then((value){
        value!.status.log;
        value.statusCode.log;
        if(value.status??false){
          _userView = value.data!;
          onSuccess(value.data!);
        }else{
          onError(APIError.fromString(value.message));
        }
      }).onError((error, stackTrace){
        error.log;
        stackTrace.log;
        onError(APIError.fromString(error.toString()));
      });
    }
  }


 void deleteUser(String email, APIAction<UserView> onSuccess,
      APIAction<APIError> onError) async {
    if(!await isNetworkActive(onError)){
      return;
    }else{
      _api.delete(email).then((value){
        value!.status.log;
        value.statusCode.log;
        if(value.status??false){
          onSuccess(value.data!);
        }else{
          onError(APIError.fromString(value.message));
        }
      }).onError((error, stackTrace){
        error.log;
        stackTrace.log;
        onError(APIError.fromString(error.toString()));
      });
    }
  }


 void requestOTP(String email, APIAction<UserView> onSuccess,
      APIAction<APIError> onError) async {
    if(!await isNetworkActive(onError)){
      return;
    }else{
      _api.initiateReset(email).then((value){
        value!.status.log;
        value.statusCode.log;
        if(value.status??false){
          onSuccess(value.data!);
        }else{
          onError(APIError.fromString(value.message));
        }
      }).onError((error, stackTrace){
        error.log;
        stackTrace.log;
        onError(APIError.fromString(error.toString()));
      });
    }
  }

  void resetPassword(PasswordReset model, APIAction<UserView> onSuccess,
      APIAction<APIError> onError) async {
    if(!await isNetworkActive(onError)){
      return;
    }else{
      _api.completeReset(body: model).then((value){
        value!.status.log;
        value.statusCode.log;
        if(value.status??false){
          onSuccess(value.data!);
        }else{
          onError(APIError.fromString(value.message));
        }
      }).onError((error, stackTrace){
        error.log;
        stackTrace.log;
        onError(APIError.fromString(error.toString()));
      });
    }
  }


  void changePassword(PasswordResetModel model, APIAction<UserView> onSuccess,
      APIAction<APIError> onError) async {
    if(!await isNetworkActive(onError)){
      return;
    }else{
      _api.updatePassword(body: model).then((value){
        value!.status.log;
        value.statusCode.log;
        if(value.status??false){
          onSuccess(value.data!);
        }else{
          onError(APIError.fromString(value.message));
        }
      }).onError((error, stackTrace){
        error.log;
        stackTrace.log;
        onError(APIError.fromString(error.toString()));
      });
    }
  }











}
