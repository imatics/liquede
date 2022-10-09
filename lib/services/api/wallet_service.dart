import 'package:flutter/cupertino.dart';
import 'package:liquede/commons/def_types.dart';
import 'package:liquede/commons/utils.dart';
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
  late FlutterWaveApi _flwApi;

  List<BankInfo> _bankList = [];
  List<BankInfo> get bankList => _bankList;

  List<BeneficiaryModel> _beneficiaries = [];
  List<BeneficiaryModel> get beneficiaries => _beneficiaries;
  WalletView? _walletDetails;
  WalletView? get walletInfo => _walletDetails;

  List<CardView> _userCards = [];
  List<CardView>? get userCards => _userCards;

  List<TransactionView> _transactions = [];
  List<TransactionView>  get transactions => _transactions;

  String? _balance;
  String get balance => _balance??"##.##";

  WalletService (){
    _api = WalletApi();
    _flwApi = FlutterWaveApi();
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
      return event;
    });
  }


  Stream<NetworkEvent<WalletView>> createPin(WalletPinModel model) {
    return executeCall(()async{
      return _api.createTransactionPin(body: model);
    }).map<NetworkEvent<WalletView>>((event){
      if(event.type == NetworkEventType.completed){
        _walletDetails = event.data;
      }
      return event;
    });
  }


  Stream<NetworkEvent<String>> fundWallet(FundWalletModel model) {
    return executeCall(()async{
      return _api.fundWallet(body: model);
    }).map((event){

      return event;
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
    return executeReturnOrCall(() => TransactionViewPagedCollection()..value =  _transactions, () async{
      return _api.listTransactions(userID, offset: 0, search: '', limit: 100);
    }, mustEx: transactions.isEmpty).map((event){
      if(event.type == NetworkEventType.completed){
        _transactions = event.data?.value??[];
      }
      return event;
    });
  }




  Stream<NetworkEvent<WalletView>> getWalletBalance(int userID) {
  return executeCall(()async{
    return _api.walletBalance(userId:userID);
  }).map<NetworkEvent<WalletView>>((event){
    if(event.type == NetworkEventType.completed){
    _walletDetails = event.data;
    if(_walletDetails?.balance != null){
      _balance = formatMoney(double.parse(_walletDetails!.balance!));
    }
    }
    return event;
  });
  }


  Stream<NetworkEvent<List<CardView>>> getUserCards(int userID) {
    return executeReturnOrCall<List<CardView>>(() => _userCards, ()async{
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


  Stream<NetworkEvent<PaymentView>> validatePayment(String id, String ref) {
    return executeCall(()async{
      return _api.validatePayment(ref, id);
    });
  }


  Stream<NetworkEvent<BankAccountInfo>> getAccountDetails(AccountDetailsRequestModel req,
      {bool force = false}) {
    return executeCall(()  async {
      return _flwApi.getAccountInfo(req);
    });
  }

  Stream<NetworkEvent<List<BankInfo>>> getBankList(
      {bool force = false}) {
    print(_bankList);
    return executeReturnOrCall(() => _bankList, () async {
      return _flwApi.getBankList();
    }, mustEx: (_bankList.isEmpty == true || force))
        .map<NetworkEvent<List<BankInfo>>>((event) {
      if (event.type == NetworkEventType.completed) {
        _bankList = event.data ?? [];
      }
      return event;
    });
  }

  Stream<NetworkEvent<List<BeneficiaryModel>>> getBeneficiaries(
      {bool force = false}) {
    return executeReturnOrCall(() => _beneficiaries, () async {
      return _api.getBeneficiaries();
    }, mustEx: (_beneficiaries.isEmpty == true || force))
        .map<NetworkEvent<List<BeneficiaryModel>>>((event) {
      if (event.type == NetworkEventType.completed) {
        _beneficiaries = event.data ?? [];
      }
      return event;
    });
  }


  Stream<NetworkEvent<BeneficiaryModel>> saveBeneficiary(BeneficiaryModel model) {
    return executeCall(() async {
      return _api.saveBeneficiary(model: model);
    })
        .map<NetworkEvent<BeneficiaryModel>>((event) {
      if (event.type == NetworkEventType.completed && event.data != null) {
        _beneficiaries.add(event.data!);
      }
      return event;
    });
  }



}
