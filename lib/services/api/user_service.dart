import 'package:flutter/cupertino.dart';
import 'package:liquede/services/api/base_service.dart';
import 'package:provider/provider.dart';
import 'package:swagger/api.dart';


class UserService extends BaseService{

  factory UserService.I(BuildContext context){
    return Provider.of<UserService>(context, listen: false);
  }


  late UserApi _api;
  late UserView? _userView;
  UserView? get userView => _userView;

  UserService(BuildContext context) : super(context){
    _api = UserApi();
  }
  //
  // @override
  // void update(ApiClient client) {
  //   _api = UserApi(client);
  // }


  Stream<NetworkEvent<UserView>> login(LoginModel request){
    return executeReturnOrCall(userView, ()async{
      return _api.login(body: request);
    }).map<NetworkEvent<UserView>>((event){
      if(event.type == NetworkEventType.completed){
        _userView = event.data;
      }
      return event as NetworkEvent<UserView>;
    });
  }


  Stream<NetworkEvent<UserView>> register(Register request) {
    return executeCall(()async{
      return _api.register(body: request);
    }).map<NetworkEvent<UserView>>((event){
      if(event.type == NetworkEventType.completed){
        _userView = event.data;
      }
      return event as NetworkEvent<UserView>;
    });
  }


  Stream<NetworkEvent<UserView>> verifyUser(String token, String email, )  {
    return executeCall(()async{
      return _api.verify(token, email);
    }).map<NetworkEvent<UserView>>((event){
      if(event.type == NetworkEventType.completed){
        _userView = event.data;
      }
      return event as NetworkEvent<UserView>;
    });
  }


 Stream<NetworkEvent<UserView>> deleteUser(String email)  {
   return executeCall(()async{
     return _api.delete(email);
   }).map<NetworkEvent<UserView>>((event){
     if(event.type == NetworkEventType.completed){
       _userView = event.data;
     }
     return event as NetworkEvent<UserView>;
   });

  }


 Stream<NetworkEvent<UserView>> requestOTP(String email) {
   return executeCall(()async{
     return _api.initiateReset(email);
   }).map<NetworkEvent<UserView>>((event){
     if(event.type == NetworkEventType.completed){
       _userView = event.data;
     }
     return event as NetworkEvent<UserView>;
   });

  }

  Stream<NetworkEvent<UserView>> resetPassword(PasswordReset model) {
    return executeCall(()async{
      return _api.completeReset(body: model);
    }).map<NetworkEvent<UserView>>((event){
      if(event.type == NetworkEventType.completed){
        _userView = event.data;
      }
      return event as NetworkEvent<UserView>;
    });
  }


  Stream<NetworkEvent<UserView>> changePassword(PasswordResetModel model) {
    return executeCall(()async{
      return _api.updatePassword(body: model);
    }).map<NetworkEvent<UserView>>((event){
      if(event.type == NetworkEventType.completed){
        _userView = event.data;
      }
      return event as NetworkEvent<UserView>;
    });
  }











}
