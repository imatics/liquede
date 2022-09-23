import 'package:flutter/cupertino.dart';
import 'package:liquede/commons/def_types.dart';
import 'package:liquede/extensions/string.dart';
import 'package:liquede/services/api/base_service.dart';
import 'package:provider/provider.dart';
import 'package:swagger/api.dart';

import 'api_error.dart';

class WalletService extends BaseService{

  factory WalletService.I(BuildContext context){
    return Provider.of<WalletService>(context, listen: false);
  }

  late WalletApi _api;
  WalletView? _walletDetails;
  WalletView? get walletInfo => _walletDetails;

  List<CardView> _userCards = [];
  List<CardView>? get userCards => _userCards;

  String? _balance;
  String get balance => _balance??"##.##";

  WalletService (){
    _api = WalletApi();
  }

  // @override
  // void update(ApiClient client) {
  //   _api = WalletApi(client);
  // }



  Stream<NetworkEvent<WalletView>> createWallet(WalletModel model) {
    return executeCall(()async{
      return _api.createUserWallet(body: model);
    }).map<NetworkEvent<WalletView>>((event){
      if(event.type == NetworkEventType.completed){
        _walletDetails = event.data;
      }
      return event as NetworkEvent<WalletView>;
    });
  }


  Stream<NetworkEvent<WalletView>> createPin(WalletPinModel model) {
    return executeCall(()async{
      return _api.createTransactionPin(body: model);
    }).map<NetworkEvent<WalletView>>((event){
      if(event.type == NetworkEventType.completed){
        _walletDetails = event.data;
      }
      return event as NetworkEvent<WalletView>;
    });
  }


  Stream<NetworkEvent<String>> fundWallet(FundWalletModel model) {
    return executeCall(()async{
      return _api.fundWallet(body: model);
    }).map<NetworkEvent<String>>((event){return event as NetworkEvent<String>;
    });
  }

  Stream<NetworkEvent<String>> debitWallet(DebitWalletModel model) {
    return executeCall(()async{
      return _api.debitWallet(body: model);
    }).map<NetworkEvent<String>>((event){
      if(event.type == NetworkEventType.completed){
        _walletDetails = event.data;
      }
      return event as NetworkEvent<String>;
    });
  }



  Stream<NetworkEvent<TransactionViewPagedCollection>> getTransactionHistory(int userID) {
    return executeCall(()async{
      return _api.listTransactions(userID, offset: 0, search: '', limit: 10000);
    }).map<NetworkEvent<TransactionViewPagedCollection>>((event){
      if(event.type == NetworkEventType.completed){
        // _walletDetails = event.data;
      }
      return event as NetworkEvent<TransactionViewPagedCollection>;
    });
  }




  Stream<NetworkEvent<String>> getWalletBalance(int userID) {
  return executeCall(()async{
    return _api.walletBalance(userId:userID);
  }).map<NetworkEvent<String>>((event){
    if(event.type == NetworkEventType.completed){
    _balance = event.data;
    }
    return event;
  });
  }


  Stream<NetworkEvent<List<CardView>>> getUserCards(int userID) {
    return executeReturnOrCall<List<CardView>>(_userCards, ()async{
      return _api.listCards();
    }, mustEx: _userCards.isEmpty).map<NetworkEvent<List<CardView>>>((event){
      if(event.type == NetworkEventType.completed){
        _userCards = event.data??[];
      }
      return event;
    });
  }



  Stream<NetworkEvent<TransactionViewPagedCollection>> getAccountStatement(int userID, DateTime start, DateTime end) {
    return executeCall(()async{
      return _api.statementOfAccount(userID, start, end, offset: 0, limit: 10000);
    }).map<NetworkEvent<TransactionViewPagedCollection>>((event){
      if(event.type == NetworkEventType.completed){
        // _walletDetails = event.data;
      }
      return event;
    });
  }



  Stream<NetworkEvent<WalletView>> transferToBank(NGNTransferModel model) {
    return executeCall(()async{
      return _api.transferToNigerianBank(body: model);
    }).map<NetworkEvent<WalletView>>((event){
      if(event.type == NetworkEventType.completed){
        _walletDetails = event.data;
      }
      return event;
    });
  }


  Stream<NetworkEvent<WalletView>> transferToWallet(WalletTransferModel model) {
    return executeCall(()async{
      return _api.transferToWallet(body: model);
    }).map<NetworkEvent<WalletView>>((event){
      if(event.type == NetworkEventType.completed){
        _walletDetails = event.data;
      }
      return event;
    });
  }


}
