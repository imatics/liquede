import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:liquede/commons/def_types.dart';
import 'package:liquede/extensions/string.dart';
import 'package:liquede/services/api/base_service.dart';
import 'package:provider/provider.dart';
import 'package:swagger/api.dart';

import 'api_error.dart';

class LoanService extends BaseService{

  factory LoanService.I(BuildContext context){
    return Provider.of<LoanService>(context, listen: false);
  }

  late LoanApi _api;

  List<LoanView> _userLoans = [];
  List<LoanView> get userLoans => _userLoans;


  LoanService(){
    _api = LoanApi();
  }



  Stream<NetworkEvent<List<LoanView?>>> createLoanRequest(LoanModel model) {
    StreamController<NetworkEvent<List<LoanView?>>> streamController = StreamController();
    executeCall(()async{
      return _api.createLoanRequest(body: model);
    }).map((event) => NetworkEvent(message: event.message, data: [event.data], error: event.error, type: event.type)).listen((event) {
     if(event.type == NetworkEventType.completed){
       streamController.addStream(getUserLoans(force: true));
     }else{
       streamController.add(event);
     }
    });


    return streamController.stream;
  }


  Stream<NetworkEvent<LoanView>> getRequest(int loanId) {
    return executeCall(()async{
      return _api.getLoanRequest(loanId);
    });
  }


  Stream<NetworkEvent<List<LoanView>>> getUserLoans({bool force = false}) {
    return executeReturnOrCall(() => _userLoans,()async{
      return _api.listMyLoans();
    }, mustEx: (_userLoans.isEmpty || force)).map<NetworkEvent<List<LoanView>>>((event){
      if(event.type ==  NetworkEventType.completed){
        _userLoans = event.data??[];
      }
      return event;
    });
  }



}
