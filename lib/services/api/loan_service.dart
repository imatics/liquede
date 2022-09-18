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
  List<LoanView>? get userLoans => _userLoans;


  LoanService(BuildContext context) : super(context){
    _api = LoanApi();
  }
  //
  // @override
  // void update(ApiClient client) {
  //   _api = LoanApi(client);
  // }



  Stream<NetworkEvent<LoanView>> createLoanRequest(LoanModel model) {
    return executeCall(()async{
      return _api.createLoanRequest(body: model);
    }).map<NetworkEvent<LoanView>>((event){
      return event as NetworkEvent<LoanView>;
    });
  }


  Stream<NetworkEvent<LoanView>> getRequest(int loanId) {
    return executeCall(()async{
      return _api.getLoanRequest(loanId);
    }).map<NetworkEvent<LoanView>>((event){
      return event as NetworkEvent<LoanView>;
    });
  }


  Stream<NetworkEvent<List<LoanView>>> getUserLoans({bool force = false}) {
    return executeReturnOrCall(_userLoans,()async{
      return _api.listMyLoans();
    }, mustEx: (_userLoans.isEmpty || force)).map<NetworkEvent<List<LoanView>>>((event){
      if(event.type ==  NetworkEventType.completed){
        _userLoans = event.data;
      }
      return event as NetworkEvent<List<LoanView>>;
    });
  }



}