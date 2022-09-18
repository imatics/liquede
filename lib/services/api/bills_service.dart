import 'package:flutter/cupertino.dart';
import 'package:liquede/commons/def_types.dart';
import 'package:liquede/extensions/string.dart';
import 'package:liquede/services/api/base_service.dart';
import 'package:provider/provider.dart';
import 'package:swagger/api.dart';

import 'api_error.dart';

class BillsService extends BaseService{

  factory BillsService.I(BuildContext context){
    return Provider.of<BillsService>(context, listen: false);
  }

  late BillsApi _api;

  Map<String,List<ProviderBundleResponse>> _providerBundles = {};
  Map<String,List<ProviderBundleResponse>>? get providerBundles => _providerBundles;


  Map<String,List<ProviderBouquetResponse>> _providerAddon = {};
  Map<String,List<ProviderBouquetResponse>>? get providerAddons => _providerAddon;

  Map<String,List<ProviderBouquetResponse>> _providerBouquet = {};
  Map<String,List<ProviderBouquetResponse>>? get providerBouquet => _providerBouquet;

  BaxiProviderResponse? _airtimeProviders;
  BaxiProviderResponse? get airtimeProvider => _airtimeProviders;

  DataProviderResponse? _dataProviders;
  DataProviderResponse? get dataProviders => _dataProviders;


  BillsService(BuildContext context) : super(context){
    _api = BillsApi();
  }

  // @override
  // void update(ApiClient client) {
  //   _api = BillsApi(client);
  // }



  Stream<NetworkEvent<BaxiProviderResponse>> getAirtimeProviders(LoanModel model) {
    return executeReturnOrCall(_airtimeProviders, ()async{
      return _api.getAirtimeProviders();
    }).map<NetworkEvent<BaxiProviderResponse>>((event){
      if(event.type == NetworkEventType.completed){
      _airtimeProviders = event.data;
      }
      return event as NetworkEvent<BaxiProviderResponse>;
    });
  }

  Stream<NetworkEvent<DataProviderResponse>> getDataProviders(LoanModel model) {
    return executeReturnOrCall(_dataProviders, ()async{
      return _api.getDataProviders();
    }).map<NetworkEvent<DataProviderResponse>>((event){
      if(event.type == NetworkEventType.completed){
        _airtimeProviders = event.data;
      }
      return event as NetworkEvent<DataProviderResponse>;
    });
  }


 Stream<NetworkEvent<DataProviderResponse>> getElectricityProviders(LoanModel model) {
    return executeReturnOrCall(_dataProviders, ()async{
      return _api.getElectricityBillers();
    }).map<NetworkEvent<DataProviderResponse>>((event){
      if(event.type == NetworkEventType.completed){
        _airtimeProviders = event.data;
      }
      return event as NetworkEvent<DataProviderResponse>;
    });
  }


  Stream<NetworkEvent<AirtimePurchaseView>> purchaseAirtime(AirtimePurchaseInput model) {
    return executeReturnOrCall(null, ()async{
      return _api.purchaseAirtime(body: model);
    }).map<NetworkEvent<AirtimePurchaseView>>((event){
      if(event.type == NetworkEventType.completed){
      }
      return event as NetworkEvent<AirtimePurchaseView>;
    });
  }

  Stream<NetworkEvent<AirtimePurchaseView>> purchaseDataBundle(DataBundlePurchaseInput model) {
    return executeReturnOrCall(null, ()async{
      return _api.purchaseDataBundle(body: model);
    }).map<NetworkEvent<AirtimePurchaseView>>((event){
      return event as NetworkEvent<AirtimePurchaseView>;
    });
  }


  Stream<NetworkEvent<AirtimePurchaseView>> purchasePostPaidElectricity(PurchaseElectricityModel model) {
    return executeReturnOrCall(null, ()async{
      return _api.purchasePostPaidElectricity(body: model);
    }).map<NetworkEvent<AirtimePurchaseView>>((event){
      return event as NetworkEvent<AirtimePurchaseView>;
    });
  }

  Stream<NetworkEvent<AirtimePurchaseView>> purchasePrePaidElectricity(PurchaseElectricityModel model) {
    return executeReturnOrCall(null, ()async{
      return _api.purchasePrePaidElectricity(body: model);
    }).map<NetworkEvent<AirtimePurchaseView>>((event){
      return event as NetworkEvent<AirtimePurchaseView>;
    });
  }




  Stream<NetworkEvent<AirtimePurchaseView>> changeCableSubscription(CableSubscriptionModel model) {
    return executeCall(()async{
      return _api.changeCableTvSubscription(body: model);
    }).map<NetworkEvent<AirtimePurchaseView>>((event){
      return event as NetworkEvent<AirtimePurchaseView>;
    });
  }


  Stream<NetworkEvent<List<ProviderBundleResponse>>> getProviderBundles(String serviceType, String accountNumber, {bool force = false}) {
    return executeReturnOrCall(_providerBundles[serviceType],()async{
      return _api.getProviderBundles(serviceType, accountNumber);
    }, mustEx: (_providerBundles[serviceType]?.isEmpty == true || force)).map<NetworkEvent<List<ProviderBundleResponse>>>((event){
      if(event.type ==  NetworkEventType.completed){
       _providerBundles[serviceType] = event.data;
      }
      return event as NetworkEvent<List<ProviderBundleResponse>>;
    });
  }

  Stream<NetworkEvent<List<ProviderBouquetResponse>>> getProviderAddons(String serviceType, String productCode, {bool force = false}) {
    return executeReturnOrCall(_providerAddon[serviceType],()async{
      return _api.getProviderAddons(serviceType, productCode);
    }, mustEx: (_providerBundles[serviceType]?.isEmpty == true || force)).map<NetworkEvent<List<ProviderBouquetResponse>>>((event){
      if(event.type ==  NetworkEventType.completed){
       _providerAddon[serviceType] = event.data;
      }
      return event as NetworkEvent<List<ProviderBouquetResponse>>;
    });
  }

  Stream<NetworkEvent<List<ProviderBouquetResponse>>> getProviderBouquet(String serviceType,{bool force = false}) {
    return executeReturnOrCall(_providerBouquet[serviceType],()async{
      return _api.getProviderBouquets(serviceType);
    }, mustEx: (_providerBouquet[serviceType]?.isEmpty == true || force)).map<NetworkEvent<List<ProviderBouquetResponse>>>((event){
      if(event.type ==  NetworkEventType.completed){
        _providerBouquet[serviceType] = event.data;
      }
      return event as NetworkEvent<List<ProviderBouquetResponse>>;
    });
  }


  Stream<NetworkEvent<MultichoiceAccountResponse>> validateAccount(String serviceType, String accountNumber) {
    return executeCall(()async{
      return _api.validateMultiChoiceAccount(serviceType, accountNumber);
    }).map<NetworkEvent<MultichoiceAccountResponse>>((event){
      if(event.type ==  NetworkEventType.completed){
       _providerAddon[serviceType] = event.data;
      }
      return event as NetworkEvent<MultichoiceAccountResponse>;
    });
  }


  Stream<NetworkEvent<String>> renewSubscriptions(SubscriptionModel model) {
    return executeCall(()async{
      return _api.renewSubscription(body: model);
    }).map<NetworkEvent<String>>((event){
      return event as NetworkEvent<String>;
    });
  }



}
