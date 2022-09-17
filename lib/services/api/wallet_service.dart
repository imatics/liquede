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
  WalletView get walletInfo => _walletDetails!;
  late BuildContext _context;
  WalletService(this._context) : super(_context){
    _api = WalletApi();
  }

  @override
  void update(ApiClient client) {
    _api = WalletApi(client);
  }




  void createWallet(WalletModel model, APIAction<WalletView> onSuccess,
      APIAction<APIError> onError) async {
    if(!await isNetworkActive()){
      return;
    }else{
      _api.createUserWallet(body: model).then((value){
        value!.status.log;
        value.statusCode.log;
        if(value.status == true){
          _walletDetails = value.data;
          // onSuccess(value.data);
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


  void createPin(WalletPinModel model, APIAction<WalletView> onSuccess,
      APIAction<APIError> onError) async {
    if(!await isNetworkActive()){
      return;
    }else{
      _api.createTransactionPin(body: model).then((value){
        value!.status.log;
        value.statusCode.log;
        if(value.status == true){
          _walletDetails = value.data;
          // onSuccess(value.data);
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

  void fundWallet(FundWalletModel model, APIAction<String> onSuccess,
      APIAction<APIError> onError) async {
    if(!await isNetworkActive()){
      return;
    }else{
      _api.fundWallet(body: model).then((value){
        value!.status.log;
        value.statusCode.log;
        if(value.status == true){
          // onSuccess(value.data);
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

  void debitWallet(DebitWalletModel model, APIAction<WalletView> onSuccess,
      APIAction<APIError> onError) async {
    if(!await isNetworkActive()){
      return;
    }else{
      _api.debitWallet(body: model).then((value){
        value!.status.log;
        value.statusCode.log;
        if(value.status == true){
          _walletDetails = value.data;
          // onSuccess(value.data);
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


  void getWalletBalance(int userID, APIAction<UserView> onSuccess,
      APIAction<APIError> onError) async {
    if(!await isNetworkActive()){
      return;
    }else{
      _api.walletBalance(userId:userID).then((value){
        value!.status.log;
        value.statusCode.log;
        if(value.status == true && value.data != null){
          // onSuccess(value.data?.);
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



  void getTransactionHistory(int userID, APIAction<List<TransactionView>> onSuccess,
      APIAction<APIError> onError) async {
    if(!await isNetworkActive()){
      return;
    }else{
      _api.listTransactions(userID, offset: 0, search: '', limit: 10000).then((value){
        value!.status.log;
        value.statusCode.log;
        if(value.status == true){
          onSuccess(value.data?.value??[]);
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

  void getUserCards(int userID, APIAction<UserView> onSuccess,
      APIAction<APIError> onError) async {
    if(!await isNetworkActive()){
      return;
    }else{
      _api.listCardsByUserId(userID, offset: 0, limit: 10000).then((value){
        value!.status.log;
        value.statusCode.log;
        if(value.status == true){
          // onSuccess(value.data);
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

  void statementOfAccount(int userID, DateTime start, DateTime end, APIAction<UserView> onSuccess,
      APIAction<APIError> onError) async {
    if(!await isNetworkActive()){
      return;
    }else{
      _api.statementOfAccount(userID, start, end, offset: 0, limit: 10000).then((value){
        value!.status.log;
        value.statusCode.log;
        if(value.status == true){
          // onSuccess(value.data);
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


    void transferToBank(NGNTransferModel model, APIAction<UserView> onSuccess,
      APIAction<APIError> onError) async {
    if(!await isNetworkActive()){
      return;
    }else{
      _api.transferToNigerianBank(body: model).then((value){
        value!.status.log;
        value.statusCode.log;
        if(value.status == true){
          // onSuccess(value.data);
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

      void transferToWallet(WalletTransferModel model, APIAction<UserView> onSuccess,
      APIAction<APIError> onError) async {
    if(!await isNetworkActive()){
      return;
    }else{
      _api.transferToWallet(body: model).then((value){
        value!.status.log;
        value.statusCode.log;
        if(value.status == true){
          // onSuccess(value.data);
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
