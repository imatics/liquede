import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:liquede/services/api/base_service.dart';
import 'package:provider/provider.dart';
import 'package:swagger/api.dart';


class UserService extends BaseService{

  factory UserService.I(BuildContext context){
    return Provider.of<UserService>(context, listen: false);
  }


  late String _email;
  late String _password;
  late UserApi _api;
  UserView? _userView;
  UserView? get userView => _userView;

  UserService(){
    _api = UserApi();
  }

  Stream<NetworkEvent<UserView?>> login(LoginModel request){
    _email = request.email??"";
    _password = request.password??"";
    // StreamController<NetworkEvent<UserView>> controller = StreamController();
    return executeCall(()async{
      return _api.login(body: request);
    }).map<NetworkEvent<UserView?>>((event){
      if(event.type == NetworkEventType.completed){
        _userView = event.data;
        if(_userView?.token != null){
        updateClient(_userView!.token!);
      }
      }
      return event;
    });
    //     .listen((event) {
    //   if(event.type == NetworkEventType.completed){
    //
    //   }else{
    //     controller.add(event as NetworkEvent<UserView>);
    //   }
    //
    // });
    // return controller.stream;
  }


  Stream<NetworkEvent<UserView>> register(Register request) {
    _email = request.email??"";
    _password = request.password??"";
    return executeCall(()async{
      return _api.register(body: request);
    }).map<NetworkEvent<UserView>>((event){
      if(event.type == NetworkEventType.completed){
        _userView = event.data;
      }
      return event;
    });
  }

  Stream<NetworkEvent<UserView>> getProfile() {
    return executeCall(()async{
      return _api.getUser();
    }).map<NetworkEvent<UserView>>((event){
      if(event.type == NetworkEventType.completed){

      }
      return event;
    });
  }


  Stream<NetworkEvent<UserView>> verifyUser(String token) {
    print(token);
    StreamController<NetworkEvent<UserView>> controller = StreamController();
    executeCall(()async{
      return _api.verify(token, _userView?.email??"");
    }).listen((event) {
      if(event.type == NetworkEventType.completed){
            login(LoginModel()..email = _email ..password = _password).listen((event) {
              debugPrint("$event");
              controller.add(event as NetworkEvent<UserView>);
            });
          }else{
            controller.add(event);
          }
    });

    // map<NetworkEvent<UserView>>((event){
    //   if(event.type == NetworkEventType.completed){
    //     login(LoginModel()..email = _email ..password = _password).listen((event) {
    //       debugPrint("$event");
    //       controller.add(event as NetworkEvent<UserView>);
    //     });
    //   }else{
    //     controller.add(event);
    //   }
    //   return event;
    // });
    return controller.stream;
  }


 Stream<NetworkEvent<UserView>> deleteUser(String email)  {
   return executeCall(()async{
     return _api.delete(email);
   }).map<NetworkEvent<UserView>>((event){
     if(event.type == NetworkEventType.completed){
       _userView = event.data;
     }
     return event;
   });

  }


 Stream<NetworkEvent<UserView>> requestOTP({String? email}) {
   return executeCall(()async{
     return _api.initiateReset(email??_userView?.email??"");
   }).map<NetworkEvent<UserView>>((event){
     if(event.type == NetworkEventType.completed){
     }
     return event;
   });

  }

  Stream<NetworkEvent<UserView>> resetPassword(PasswordReset model) {
    return executeCall(()async{
      return _api.completeReset(body: model);
    }).map<NetworkEvent<UserView>>((event){
      if(event.type == NetworkEventType.completed){
      }
      return event;
    });
  }


  Stream<NetworkEvent<UserView>> changePassword(PasswordResetModel model) {
    return executeCall(()async{
      return _api.updatePassword(body: model);
    }).map<NetworkEvent<UserView>>((event){
      if(event.type == NetworkEventType.completed){
      }
      return event;
    });
  }











}
