import 'package:flutter/cupertino.dart';
import 'package:liquede/commons/def_types.dart';
import 'package:liquede/commons/utils.dart';
import 'package:liquede/extensions/string.dart';
import 'package:liquede/presentation/history.dart';
import 'package:liquede/services/api/base_service.dart';
import 'package:provider/provider.dart';
import 'package:swagger/api.dart';

import 'api_error.dart';

class SavingsService extends BaseService{

  factory SavingsService.I(BuildContext context){
    return Provider.of<SavingsService>(context, listen: false);
  }

  late SavingsApi _api;

  List<SavingsView> _userSaving = [];
  List<SavingsView> get userSavings => _userSaving;

  int? _withdrawalPenalty;

  int get withdrawalPenalty => _withdrawalPenalty??0;



  SavingsService(){
    _api = SavingsApi();
  }


  String getWorth(){
    double total = 0;
    if(_userSaving.isEmpty){
      getUserSavings().performOnSuccess((p0) {
        for (var value in p0) {
          total += value.amount??0.0;
        }
      });
    }else{
      for (var value in _userSaving) {
        total += value.amount??0.0;
      }
    }
    return formatMoney(total);
  }


  Stream<NetworkEvent<SavingsView>> createLiquedeGoal(LiquiedeGoalInput model) {
    return executeCall(()async{
      return _api.createLiqiedeGoalSavingPlan(body: model);
    });
  }


  Stream<NetworkEvent<SavingsView>> createLiquedeSeal(LiquedeSealInput model) {
    return executeCall(()async{
      return _api.createLiqiedeSealSavingPlan(body: model);
    });
  }


  Stream<NetworkEvent<List<SavingPlanType>>> getTypes() {
    return executeCall(()async{
      return _api.getSavingPlanTypes();
    }).map<NetworkEvent<List<SavingPlanType>>>((event){
      return event;
    });
  }


  Stream<NetworkEvent<int>> getWithdrawalPenalty({bool force = false}) {
    return executeReturnOrCall(() => _withdrawalPenalty,()async{
      return _api.getWithdrawalPenaltyPercentage();
    });
  }



  Stream<NetworkEvent<SavingsView>> withDrawPrematurely(SavingsWithdrawalModel model) {
    return executeCall(()async{
      return _api.withdrawPrematurely(body: model);
    });
  }


  Stream<NetworkEvent<SavingsView>> retryPayment(int planId, String paymentMethod) {
    return executeCall(()async{
      return _api.retryPlanPayment(planId,paymentMethod);
    });
  }


  Stream<NetworkEvent<List<SavingsView>>> getUserSavings({bool force = false}) {
    return executeReturnOrCall(() => _userSaving,()async{
      return _api.getUserSavings();
    }, mustEx: (_userSaving.isEmpty || force)).map<NetworkEvent<List<SavingsView>>>((event){
      if(event.type ==  NetworkEventType.completed){
        _userSaving = event.data??[];
      }
      return event;
    });
  }





}
