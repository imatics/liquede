part of swagger.api;



class BillsApi {
  final ApiClient apiClient;

  BillsApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  ///
  ///
  ///
  Future<AirtimePurchaseViewStandardResponse?> changeCableTvSubscription({ CableSubscriptionModel? body }) async {
    Object? postBody = body;

    // verify required params are set

    // create path and map variables
    String path = "/api/Bills/airtime/change-cable-tv-subscription".replaceAll("{format}","json");

    // query params
    List<QueryParam> queryParams = [];
    Map<String, String> headerParams = {};
    Map<String, String> formParams = {};

    List<String> contentTypes = ["application/json-patch+json","application/json","text/json","application/_*+json"];

    String contentType = contentTypes.length > 0 ? contentTypes[0] : "application/json";
    List<String> authNames = ["Bearer"];

    if(contentType.startsWith("multipart/form-data")) {
      bool hasFields = false;
      // MultipartRequest mp = new MultipartRequest(null, null);
      // if(hasFields)
      //   postBody = mp;
    }
    else {
          }

    var response = await apiClient.invokeAPI(path,
                                             'POST',
                                             queryParams,
                                             postBody,
                                             headerParams,
                                             formParams,
                                             contentType,
                                             authNames);

    if(response.statusCode >= 400) {
      throw new ApiException(response.statusCode, response.body);
    } else if(response.body != null) {
      return
          apiClient.deserialize(response.body, 'AirtimePurchaseViewStandardResponse') as AirtimePurchaseViewStandardResponse ;
    } else {
      return null;
    }
  }
  ///
  ///
  ///
  Future<BaxiProvidersResponseStandardResponse?> getAirtimeProviders() async {
    Object? postBody = null;

    // verify required params are set

    // create path and map variables
    String path = "/api/Bills/airtime/providers".replaceAll("{format}","json");

    // query params
    List<QueryParam> queryParams = [];
    Map<String, String> headerParams = {};
    Map<String, String> formParams = {};

    List<String> contentTypes = [];

    String contentType = contentTypes.length > 0 ? contentTypes[0] : "application/json";
    List<String> authNames = ["Bearer"];

    if(contentType.startsWith("multipart/form-data")) {
      bool hasFields = false;
      // MultipartRequest mp = new MultipartRequest(null, null);
      // if(hasFields)
      //   postBody = mp;
    }
    else {
          }

    var response = await apiClient.invokeAPI(path,
                                             'GET',
                                             queryParams,
                                             postBody,
                                             headerParams,
                                             formParams,
                                             contentType,
                                             authNames);

    if(response.statusCode >= 400) {
      throw new ApiException(response.statusCode, response.body);
    } else if(response.body != null) {
      return
          apiClient.deserialize(response.body, 'BaxiProvidersResponseStandardResponse') as BaxiProvidersResponseStandardResponse ;
    } else {
      return null;
    }
  }
  ///
  ///
  ///
  Future<DataProviderResponseStandardResponse?> getDataProviders() async {
    Object? postBody = null;

    // verify required params are set

    // create path and map variables
    String path = "/api/Bills/airtime/data-providers".replaceAll("{format}","json");

    // query params
    List<QueryParam> queryParams = [];
    Map<String, String> headerParams = {};
    Map<String, String> formParams = {};

    List<String> contentTypes = [];

    String contentType = contentTypes.length > 0 ? contentTypes[0] : "application/json";
    List<String> authNames = ["Bearer"];

    if(contentType.startsWith("multipart/form-data")) {
      bool hasFields = false;
      // MultipartRequest mp = new MultipartRequest(null, null);
      // if(hasFields)
      //   postBody = mp;
    }
    else {
          }

    var response = await apiClient.invokeAPI(path,
                                             'GET',
                                             queryParams,
                                             postBody,
                                             headerParams,
                                             formParams,
                                             contentType,
                                             authNames);

    if(response.statusCode >= 400) {
      throw new ApiException(response.statusCode, response.body);
    } else if(response.body != null) {
      return
          apiClient.deserialize(response.body, 'DataProviderResponseStandardResponse') as DataProviderResponseStandardResponse ;
    } else {
      return null;
    }
  }
  ///
  ///
  ///
  Future<DataProviderResponseStandardResponse?> getElectricityBillers() async {
    Object? postBody = null;

    // verify required params are set

    // create path and map variables
    String path = "/api/Bills/airtime/electricity-billers".replaceAll("{format}","json");

    // query params
    List<QueryParam> queryParams = [];
    Map<String, String> headerParams = {};
    Map<String, String> formParams = {};

    List<String> contentTypes = [];

    String contentType = contentTypes.length > 0 ? contentTypes[0] : "application/json";
    List<String> authNames = ["Bearer"];

    if(contentType.startsWith("multipart/form-data")) {
      bool hasFields = false;
      // MultipartRequest mp = new MultipartRequest(null, null);
      // if(hasFields)
      //   postBody = mp;
    }
    else {
          }

    var response = await apiClient.invokeAPI(path,
                                             'GET',
                                             queryParams,
                                             postBody,
                                             headerParams,
                                             formParams,
                                             contentType,
                                             authNames);

    if(response.statusCode >= 400) {
      throw new ApiException(response.statusCode, response.body);
    } else if(response.body != null) {
      return
          apiClient.deserialize(response.body, 'DataProviderResponseStandardResponse') as DataProviderResponseStandardResponse ;
    } else {
      return null;
    }
  }
  ///
  ///
  ///
  Future<ProviderBouquetResponseListStandardResponse?> getProviderAddons(String serviceType, String productCode, { String? body }) async {
    Object? postBody = body;

    // verify required params are set
    if(serviceType == null) {
     throw new ApiException(400, "Missing required param: serviceType");
    }
    if(productCode == null) {
     throw new ApiException(400, "Missing required param: productCode");
    }

    // create path and map variables
    String path = "/api/Bills/multichoice/provider-addons/{ServiceType}/{ProductCode}".replaceAll("{format}","json").replaceAll("{" + "ServiceType" + "}", serviceType.toString()).replaceAll("{" + "ProductCode" + "}", productCode.toString());

    // query params
    List<QueryParam> queryParams = [];
    Map<String, String> headerParams = {};
    Map<String, String> formParams = {};

    List<String> contentTypes = ["application/json-patch+json","application/json","text/json","application/_*+json"];

    String contentType = contentTypes.length > 0 ? contentTypes[0] : "application/json";
    List<String> authNames = ["Bearer"];

    if(contentType.startsWith("multipart/form-data")) {
      bool hasFields = false;
      // MultipartRequest mp = new MultipartRequest(null, null);
      // if(hasFields)
      //   postBody = mp;
    }
    else {
          }

    var response = await apiClient.invokeAPI(path,
                                             'POST',
                                             queryParams,
                                             postBody,
                                             headerParams,
                                             formParams,
                                             contentType,
                                             authNames);

    if(response.statusCode >= 400) {
      throw new ApiException(response.statusCode, response.body);
    } else if(response.body != null) {
      return
          apiClient.deserialize(response.body, 'ProviderBouquetResponseListStandardResponse') as ProviderBouquetResponseListStandardResponse ;
    } else {
      return null;
    }
  }
  ///
  ///
  ///
  Future<ProviderBouquetResponseListStandardResponse?> getProviderBouquets(String serviceType) async {
    Object? postBody = null;

    // verify required params are set
    if(serviceType == null) {
     throw new ApiException(400, "Missing required param: serviceType");
    }

    // create path and map variables
    String path = "/api/Bills/multichoice/provider-bouquets/{serviceType}".replaceAll("{format}","json").replaceAll("{" + "serviceType" + "}", serviceType.toString());

    // query params
    List<QueryParam> queryParams = [];
    Map<String, String> headerParams = {};
    Map<String, String> formParams = {};

    List<String> contentTypes = [];

    String contentType = contentTypes.length > 0 ? contentTypes[0] : "application/json";
    List<String> authNames = ["Bearer"];

    if(contentType.startsWith("multipart/form-data")) {
      bool hasFields = false;
      // MultipartRequest mp = new MultipartRequest(null, null);
      // if(hasFields)
      //   postBody = mp;
    }
    else {
          }

    var response = await apiClient.invokeAPI(path,
                                             'POST',
                                             queryParams,
                                             postBody,
                                             headerParams,
                                             formParams,
                                             contentType,
                                             authNames);

    if(response.statusCode >= 400) {
      throw new ApiException(response.statusCode, response.body);
    } else if(response.body != null) {
      return
          apiClient.deserialize(response.body, 'ProviderBouquetResponseListStandardResponse') as ProviderBouquetResponseListStandardResponse ;
    } else {
      return null;
    }
  }
  ///
  ///
  ///
  Future<ProviderBundleResponseListStandardResponse?> getProviderBundles(String serviceType, String accountNumber) async {
    Object? postBody = null;

    // verify required params are set
    if(serviceType == null) {
     throw new ApiException(400, "Missing required param: serviceType");
    }
    if(accountNumber == null) {
     throw new ApiException(400, "Missing required param: accountNumber");
    }

    // create path and map variables
    String path = "/api/Bills/airtime/data-bundles/{ServiceType}/{AccountNumber}".replaceAll("{format}","json").replaceAll("{" + "ServiceType" + "}", serviceType.toString()).replaceAll("{" + "AccountNumber" + "}", accountNumber.toString());

    // query params
    List<QueryParam> queryParams = [];
    Map<String, String> headerParams = {};
    Map<String, String> formParams = {};

    List<String> contentTypes = [];

    String contentType = contentTypes.length > 0 ? contentTypes[0] : "application/json";
    List<String> authNames = ["Bearer"];

    if(contentType.startsWith("multipart/form-data")) {
      bool hasFields = false;
      // MultipartRequest mp = new MultipartRequest(null, null);
      // if(hasFields)
      //   postBody = mp;
    }
    else {
          }

    var response = await apiClient.invokeAPI(path,
                                             'POST',
                                             queryParams,
                                             postBody,
                                             headerParams,
                                             formParams,
                                             contentType,
                                             authNames);

    if(response.statusCode >= 400) {
      throw new ApiException(response.statusCode, response.body);
    } else if(response.body != null) {
      return
          apiClient.deserialize(response.body, 'ProviderBundleResponseListStandardResponse') as ProviderBundleResponseListStandardResponse ;
    } else {
      return null;
    }
  }
  ///
  ///
  ///
  Future<AirtimePurchaseViewStandardResponse?> purchaseAirtime({ AirtimePurchaseInput? body }) async {
    Object? postBody = body;

    // verify required params are set

    // create path and map variables
    String path = "/api/Bills/airtime/purchase".replaceAll("{format}","json");

    // query params
    List<QueryParam> queryParams = [];
    Map<String, String> headerParams = {};
    Map<String, String> formParams = {};

    List<String> contentTypes = ["application/json-patch+json","application/json","text/json","application/_*+json"];

    String contentType = contentTypes.length > 0 ? contentTypes[0] : "application/json";
    List<String> authNames = ["Bearer"];

    if(contentType.startsWith("multipart/form-data")) {
      bool hasFields = false;
      // MultipartRequest mp = new MultipartRequest(null, null);
      // if(hasFields)
      //   postBody = mp;
    }
    else {
          }

    var response = await apiClient.invokeAPI(path,
                                             'POST',
                                             queryParams,
                                             postBody,
                                             headerParams,
                                             formParams,
                                             contentType,
                                             authNames);

    if(response.statusCode >= 400) {
      throw new ApiException(response.statusCode, response.body);
    } else if(response.body != null) {
      return
          apiClient.deserialize(response.body, 'AirtimePurchaseViewStandardResponse') as AirtimePurchaseViewStandardResponse ;
    } else {
      return null;
    }
  }
  ///
  ///
  ///
  Future<AirtimePurchaseViewStandardResponse?> purchaseDataBundle({ DataBundlePurchaseInput? body }) async {
    Object? postBody = body;

    // verify required params are set

    // create path and map variables
    String path = "/api/Bills/airtime/data-bundle".replaceAll("{format}","json");

    // query params
    List<QueryParam> queryParams = [];
    Map<String, String> headerParams = {};
    Map<String, String> formParams = {};

    List<String> contentTypes = ["application/json-patch+json","application/json","text/json","application/_*+json"];

    String contentType = contentTypes.length > 0 ? contentTypes[0] : "application/json";
    List<String> authNames = ["Bearer"];

    if(contentType.startsWith("multipart/form-data")) {
      bool hasFields = false;
      // MultipartRequest mp = new MultipartRequest(null, null);
      // if(hasFields)
      //   postBody = mp;
    }
    else {
          }

    var response = await apiClient.invokeAPI(path,
                                             'POST',
                                             queryParams,
                                             postBody,
                                             headerParams,
                                             formParams,
                                             contentType,
                                             authNames);

    if(response.statusCode >= 400) {
      throw new ApiException(response.statusCode, response.body);
    } else if(response.body != null) {
      return
          apiClient.deserialize(response.body, 'AirtimePurchaseViewStandardResponse') as AirtimePurchaseViewStandardResponse ;
    } else {
      return null;
    }
  }
  ///
  ///
  ///
  Future<AirtimePurchaseViewStandardResponse?> purchasePostPaidElectricity({ PurchaseElectricityModel? body }) async {
    Object? postBody = body;

    // verify required params are set

    // create path and map variables
    String path = "/api/Bills/airtime/purchase-postpaid-electricity".replaceAll("{format}","json");

    // query params
    List<QueryParam> queryParams = [];
    Map<String, String> headerParams = {};
    Map<String, String> formParams = {};

    List<String> contentTypes = ["application/json-patch+json","application/json","text/json","application/_*+json"];

    String contentType = contentTypes.length > 0 ? contentTypes[0] : "application/json";
    List<String> authNames = ["Bearer"];

    if(contentType.startsWith("multipart/form-data")) {
      bool hasFields = false;
      // MultipartRequest mp = new MultipartRequest(null, null);
      // if(hasFields)
      //   postBody = mp;
    }
    else {
          }

    var response = await apiClient.invokeAPI(path,
                                             'POST',
                                             queryParams,
                                             postBody,
                                             headerParams,
                                             formParams,
                                             contentType,
                                             authNames);

    if(response.statusCode >= 400) {
      throw new ApiException(response.statusCode, response.body);
    } else if(response.body != null) {
      return
          apiClient.deserialize(response.body, 'AirtimePurchaseViewStandardResponse') as AirtimePurchaseViewStandardResponse ;
    } else {
      return null;
    }
  }
  ///
  ///
  ///
  Future<AirtimePurchaseViewStandardResponse?> purchasePrePaidElectricity({ PurchaseElectricityModel? body }) async {
    Object? postBody = body;

    // verify required params are set

    // create path and map variables
    String path = "/api/Bills/airtime/purchase-prepaid-electricity".replaceAll("{format}","json");

    // query params
    List<QueryParam> queryParams = [];
    Map<String, String> headerParams = {};
    Map<String, String> formParams = {};

    List<String> contentTypes = ["application/json-patch+json","application/json","text/json","application/_*+json"];

    String contentType = contentTypes.length > 0 ? contentTypes[0] : "application/json";
    List<String> authNames = ["Bearer"];

    if(contentType.startsWith("multipart/form-data")) {
      bool hasFields = false;
      // MultipartRequest mp = new MultipartRequest(null, null);
      // if(hasFields)
      //   postBody = mp;
    }
    else {
          }

    var response = await apiClient.invokeAPI(path,
                                             'POST',
                                             queryParams,
                                             postBody,
                                             headerParams,
                                             formParams,
                                             contentType,
                                             authNames);

    if(response.statusCode >= 400) {
      throw new ApiException(response.statusCode, response.body);
    } else if(response.body != null) {
      return
          apiClient.deserialize(response.body, 'AirtimePurchaseViewStandardResponse') as AirtimePurchaseViewStandardResponse ;
    } else {
      return null;
    }
  }
  ///
  ///
  ///
  Future<StringStandardResponse?> renewSubscription({ SubscriptionModel? body }) async {
    Object? postBody = body;

    // verify required params are set

    // create path and map variables
    String path = "/api/Bills/multichoice/renew-subscription".replaceAll("{format}","json");

    // query params
    List<QueryParam> queryParams = [];
    Map<String, String> headerParams = {};
    Map<String, String> formParams = {};

    List<String> contentTypes = ["application/json-patch+json","application/json","text/json","application/_*+json"];

    String contentType = contentTypes.length > 0 ? contentTypes[0] : "application/json";
    List<String> authNames = ["Bearer"];

    if(contentType.startsWith("multipart/form-data")) {
      bool hasFields = false;
      // MultipartRequest mp = new MultipartRequest(null, null);
      // if(hasFields)
      //   postBody = mp;
    }
    else {
          }

    var response = await apiClient.invokeAPI(path,
                                             'POST',
                                             queryParams,
                                             postBody,
                                             headerParams,
                                             formParams,
                                             contentType,
                                             authNames);

    if(response.statusCode >= 400) {
      throw new ApiException(response.statusCode, response.body);
    } else if(response.body != null) {
      return
          apiClient.deserialize(response.body, 'StringStandardResponse') as StringStandardResponse ;
    } else {
      return null;
    }
  }
  ///
  ///
  ///
  Future<MultichoiceAccountResponseStandardResponse?> validateMultiChoiceAccount(String serviceType, String accountNumber) async {
    Object? postBody = null;

    // verify required params are set
    if(serviceType == null) {
     throw new ApiException(400, "Missing required param: serviceType");
    }
    if(accountNumber == null) {
     throw new ApiException(400, "Missing required param: accountNumber");
    }

    // create path and map variables
    String path = "/api/Bills/multichoice/multichoice-account/{ServiceType}/{AccountNumber}".replaceAll("{format}","json").replaceAll("{" + "ServiceType" + "}", serviceType.toString()).replaceAll("{" + "AccountNumber" + "}", accountNumber.toString());

    // query params
    List<QueryParam> queryParams = [];
    Map<String, String> headerParams = {};
    Map<String, String> formParams = {};

    List<String> contentTypes = [];

    String contentType = contentTypes.length > 0 ? contentTypes[0] : "application/json";
    List<String> authNames = ["Bearer"];

    if(contentType.startsWith("multipart/form-data")) {
      bool hasFields = false;
      // MultipartRequest mp = new MultipartRequest(null, null);
      // if(hasFields)
      //   postBody = mp;
    }
    else {
          }

    var response = await apiClient.invokeAPI(path,
                                             'POST',
                                             queryParams,
                                             postBody,
                                             headerParams,
                                             formParams,
                                             contentType,
                                             authNames);

    if(response.statusCode >= 400) {
      throw new ApiException(response.statusCode, response.body);
    } else if(response.body != null) {
      return
          apiClient.deserialize(response.body, 'MultichoiceAccountResponseStandardResponse') as MultichoiceAccountResponseStandardResponse ;
    } else {
      return null;
    }
  }
}
