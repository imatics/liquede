import 'package:flutter/cupertino.dart';
import 'package:liquede/services/api/base_service.dart';
import 'package:provider/provider.dart';
import 'package:swagger/api.dart';

class BillsService extends BaseService {
  factory BillsService.I(BuildContext context) {
    return Provider.of<BillsService>(context, listen: false);
  }

  late BillsApi _api;

  Map<String, List<ProviderBundleResponse>> _providerBundles = {};
  Map<String, List<ProviderBundleResponse>>? get providerBundles =>
      _providerBundles;

  Map<String, List<ProviderBouquetResponse>> _providerAddon = {};
  Map<String, List<ProviderBouquetResponse>>? get providerAddons =>
      _providerAddon;

  Map<String, List<ProviderBouquetResponse>> _providerBouquet = {};
  Map<String, List<ProviderBouquetResponse>>? get providerBouquet =>
      _providerBouquet;

  BaxiProvidersResponse? _airtimeProviders;
  BaxiProvidersResponse? get airtimeProvider => _airtimeProviders;

  DataProviderResponse? _dataProviders;
  DataProviderResponse? get dataProviders => _dataProviders;

  DataProviderResponse? _electricProviders;
  DataProviderResponse? get electricProviders => _electricProviders;

  BillsService() {
    _api = BillsApi();
  }

  Stream<NetworkEvent<BaxiProvidersResponse>> getAirtimeProviders() {
    return executeReturnOrCall(() => _airtimeProviders, () async {
      return _api.getAirtimeProviders();
    });
  }

  Stream<NetworkEvent<DataProviderResponse>> getDataProviders() {
    return executeReturnOrCall(() => _dataProviders, () async {
      return _api.getDataProviders();
    }).map<NetworkEvent<DataProviderResponse>>((event) {
      if (event.type == NetworkEventType.completed) {
        _dataProviders = event.data;
      }
      return event;
    });
  }

  Stream<NetworkEvent<DataProviderResponse>> getElectricityProviders() {
    return executeReturnOrCall(() => _electricProviders, () async {
      return _api.getElectricityBillers();
    }).map<NetworkEvent<DataProviderResponse>>((event) {
      if (event.type == NetworkEventType.completed) {
        _electricProviders = event.data;
      }
      return event;
    });
  }

  Stream<NetworkEvent<AirtimePurchaseView>> purchaseAirtime(
      AirtimePurchaseInput model) {
    return executeCall(() async {
      return _api.purchaseAirtime(body: model);
    });
  }

  Stream<NetworkEvent<AirtimePurchaseView>> purchaseDataBundle(
      DataBundlePurchaseInput model) {
    return executeCall(() async {
      return _api.purchaseDataBundle(body: model);
    });
  }

  Stream<NetworkEvent<AirtimePurchaseView>> purchasePostPaidElectricity(
      PurchaseElectricityModel model) {
    return executeCall(() async {
      return _api.purchasePostPaidElectricity(body: model);
    }).map<NetworkEvent<AirtimePurchaseView>>((event) {
      return event;
    });
  }

  Stream<NetworkEvent<AirtimePurchaseView>> purchasePrePaidElectricity(
      PurchaseElectricityModel model) {
    return executeCall(() async {
      return _api.purchasePrePaidElectricity(body: model);
    }).map<NetworkEvent<AirtimePurchaseView>>((event) {
      return event;
    });
  }

  Stream<NetworkEvent<AirtimePurchaseView>> changeCableSubscription(
      CableSubscriptionModel model) {
    return executeCall(() async {
      return _api.changeCableTvSubscription(body: model);
    });
  }

  Stream<NetworkEvent<List<ProviderBundleResponse>>> getProviderBundles(
      String serviceType, String accountNumber,
      {bool force = false}) {
    return executeReturnOrCall(() => _providerBundles[serviceType], () async {
      return _api.getProviderBundles(serviceType, accountNumber);
    }, mustEx: (_providerBundles[serviceType]?.isEmpty == true || force))
        .map<NetworkEvent<List<ProviderBundleResponse>>>((event) {
      if (event.type == NetworkEventType.completed) {
        _providerBundles[serviceType] = event.data ?? [];
      }
      return event;
    });
  }

  Stream<NetworkEvent<List<ProviderBouquetResponse>>> getProviderAddons(
      String serviceType, String productCode,
      {bool force = false}) {
    return executeReturnOrCall(() => _providerAddon[serviceType], () async {
      return _api.getProviderAddons(serviceType, productCode);
    }, mustEx: (_providerBundles[serviceType]?.isEmpty == true || force))
        .map<NetworkEvent<List<ProviderBouquetResponse>>>((event) {
      if (event.type == NetworkEventType.completed) {
        _providerAddon[serviceType] = event.data ?? [];
      }
      return event;
    });
  }

  Stream<NetworkEvent<List<ProviderBouquetResponse>>> getProviderBouquet(
      String serviceType,
      {bool force = false}) {
    return executeReturnOrCall(() => _providerBouquet[serviceType], () async {
      return _api.getProviderBouquets(serviceType);
    }, mustEx: (_providerBouquet[serviceType]?.isEmpty == true || force))
        .map<NetworkEvent<List<ProviderBouquetResponse>>>((event) {
      if (event.type == NetworkEventType.completed) {
        _providerBouquet[serviceType] = event.data ?? [];
      }
      return event;
    });
  }



  Stream<NetworkEvent<MultichoiceAccountResponse>> validateAccount(
      String serviceType, String accountNumber) {
    return executeCall(() async {
      return _api.validateMultiChoiceAccount(serviceType, accountNumber);
    });
  }

  Stream<NetworkEvent<String>> renewSubscriptions(SubscriptionModel model) {
    return executeCall(() async {
      return _api.renewSubscription(body: model);
    });
  }
}
