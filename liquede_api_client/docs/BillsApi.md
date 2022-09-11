# swagger.api.BillsApi

## Load the API package
```dart
import 'package:swagger/api.dart';
```

All URIs are relative to */*

Method | HTTP request | Description
------------- | ------------- | -------------
[**changeCableTvSubscription**](BillsApi.md#changeCableTvSubscription) | **POST** /api/Bills/airtime/change-cable-tv-subscription | 
[**getAirtimeProviders**](BillsApi.md#getAirtimeProviders) | **GET** /api/Bills/airtime/providers | 
[**getDataProviders**](BillsApi.md#getDataProviders) | **GET** /api/Bills/airtime/data-providers | 
[**getElectricityBillers**](BillsApi.md#getElectricityBillers) | **GET** /api/Bills/airtime/electricity-billers | 
[**getProviderAddons**](BillsApi.md#getProviderAddons) | **POST** /api/Bills/multichoice/provider-addons/{ServiceType}/{ProductCode} | 
[**getProviderBouquets**](BillsApi.md#getProviderBouquets) | **POST** /api/Bills/multichoice/provider-bouquets/{serviceType} | 
[**getProviderBundles**](BillsApi.md#getProviderBundles) | **POST** /api/Bills/airtime/data-bundles/{ServiceType}/{AccountNumber} | 
[**purchaseAirtime**](BillsApi.md#purchaseAirtime) | **POST** /api/Bills/airtime/purchase | 
[**purchaseDataBundle**](BillsApi.md#purchaseDataBundle) | **POST** /api/Bills/airtime/data-bundle | 
[**purchasePostPaidElectricity**](BillsApi.md#purchasePostPaidElectricity) | **POST** /api/Bills/airtime/purchase-postpaid-electricity | 
[**purchasePrePaidElectricity**](BillsApi.md#purchasePrePaidElectricity) | **POST** /api/Bills/airtime/purchase-prepaid-electricity | 
[**renewSubscription**](BillsApi.md#renewSubscription) | **POST** /api/Bills/multichoice/renew-subscription | 
[**validateMultiChoiceAccount**](BillsApi.md#validateMultiChoiceAccount) | **POST** /api/Bills/multichoice/multichoice-account/{ServiceType}/{AccountNumber} | 

# **changeCableTvSubscription**
> AirtimePurchaseViewStandardResponse changeCableTvSubscription(body)



### Example
```dart
import 'package:swagger/api.dart';
// TODO Configure API key authorization: Bearer
//swagger.api.Configuration.apiKey{'Authorization'} = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//swagger.api.Configuration.apiKeyPrefix{'Authorization'} = "Bearer";

var api_instance = new BillsApi();
var body = new CableSubscriptionModel(); // CableSubscriptionModel | 

try {
    var result = api_instance.changeCableTvSubscription(body);
    print(result);
} catch (e) {
    print("Exception when calling BillsApi->changeCableTvSubscription: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**CableSubscriptionModel**](CableSubscriptionModel.md)|  | [optional] 

### Return type

[**AirtimePurchaseViewStandardResponse**](AirtimePurchaseViewStandardResponse.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json-patch+json, application/json, text/json, application/_*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getAirtimeProviders**
> BaxiProvidersResponseStandardResponse getAirtimeProviders()



### Example
```dart
import 'package:swagger/api.dart';
// TODO Configure API key authorization: Bearer
//swagger.api.Configuration.apiKey{'Authorization'} = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//swagger.api.Configuration.apiKeyPrefix{'Authorization'} = "Bearer";

var api_instance = new BillsApi();

try {
    var result = api_instance.getAirtimeProviders();
    print(result);
} catch (e) {
    print("Exception when calling BillsApi->getAirtimeProviders: $e\n");
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**BaxiProvidersResponseStandardResponse**](BaxiProvidersResponseStandardResponse.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getDataProviders**
> DataProviderResponseStandardResponse getDataProviders()



### Example
```dart
import 'package:swagger/api.dart';
// TODO Configure API key authorization: Bearer
//swagger.api.Configuration.apiKey{'Authorization'} = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//swagger.api.Configuration.apiKeyPrefix{'Authorization'} = "Bearer";

var api_instance = new BillsApi();

try {
    var result = api_instance.getDataProviders();
    print(result);
} catch (e) {
    print("Exception when calling BillsApi->getDataProviders: $e\n");
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**DataProviderResponseStandardResponse**](DataProviderResponseStandardResponse.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getElectricityBillers**
> DataProviderResponseStandardResponse getElectricityBillers()



### Example
```dart
import 'package:swagger/api.dart';
// TODO Configure API key authorization: Bearer
//swagger.api.Configuration.apiKey{'Authorization'} = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//swagger.api.Configuration.apiKeyPrefix{'Authorization'} = "Bearer";

var api_instance = new BillsApi();

try {
    var result = api_instance.getElectricityBillers();
    print(result);
} catch (e) {
    print("Exception when calling BillsApi->getElectricityBillers: $e\n");
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**DataProviderResponseStandardResponse**](DataProviderResponseStandardResponse.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getProviderAddons**
> ProviderBouquetResponseListStandardResponse getProviderAddons(serviceType, productCode, body)



### Example
```dart
import 'package:swagger/api.dart';
// TODO Configure API key authorization: Bearer
//swagger.api.Configuration.apiKey{'Authorization'} = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//swagger.api.Configuration.apiKeyPrefix{'Authorization'} = "Bearer";

var api_instance = new BillsApi();
var serviceType = serviceType_example; // String | 
var productCode = productCode_example; // String | 
var body = new String(); // String | 

try {
    var result = api_instance.getProviderAddons(serviceType, productCode, body);
    print(result);
} catch (e) {
    print("Exception when calling BillsApi->getProviderAddons: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **serviceType** | **String**|  | 
 **productCode** | **String**|  | 
 **body** | [**String**](String.md)|  | [optional] 

### Return type

[**ProviderBouquetResponseListStandardResponse**](ProviderBouquetResponseListStandardResponse.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json-patch+json, application/json, text/json, application/_*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getProviderBouquets**
> ProviderBouquetResponseListStandardResponse getProviderBouquets(serviceType)



### Example
```dart
import 'package:swagger/api.dart';
// TODO Configure API key authorization: Bearer
//swagger.api.Configuration.apiKey{'Authorization'} = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//swagger.api.Configuration.apiKeyPrefix{'Authorization'} = "Bearer";

var api_instance = new BillsApi();
var serviceType = serviceType_example; // String | 

try {
    var result = api_instance.getProviderBouquets(serviceType);
    print(result);
} catch (e) {
    print("Exception when calling BillsApi->getProviderBouquets: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **serviceType** | **String**|  | 

### Return type

[**ProviderBouquetResponseListStandardResponse**](ProviderBouquetResponseListStandardResponse.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getProviderBundles**
> ProviderBundleResponseListStandardResponse getProviderBundles(serviceType, accountNumber)



### Example
```dart
import 'package:swagger/api.dart';
// TODO Configure API key authorization: Bearer
//swagger.api.Configuration.apiKey{'Authorization'} = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//swagger.api.Configuration.apiKeyPrefix{'Authorization'} = "Bearer";

var api_instance = new BillsApi();
var serviceType = serviceType_example; // String | 
var accountNumber = accountNumber_example; // String | 

try {
    var result = api_instance.getProviderBundles(serviceType, accountNumber);
    print(result);
} catch (e) {
    print("Exception when calling BillsApi->getProviderBundles: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **serviceType** | **String**|  | 
 **accountNumber** | **String**|  | 

### Return type

[**ProviderBundleResponseListStandardResponse**](ProviderBundleResponseListStandardResponse.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **purchaseAirtime**
> AirtimePurchaseViewStandardResponse purchaseAirtime(body)



### Example
```dart
import 'package:swagger/api.dart';
// TODO Configure API key authorization: Bearer
//swagger.api.Configuration.apiKey{'Authorization'} = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//swagger.api.Configuration.apiKeyPrefix{'Authorization'} = "Bearer";

var api_instance = new BillsApi();
var body = new AirtimePurchaseInput(); // AirtimePurchaseInput | 

try {
    var result = api_instance.purchaseAirtime(body);
    print(result);
} catch (e) {
    print("Exception when calling BillsApi->purchaseAirtime: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**AirtimePurchaseInput**](AirtimePurchaseInput.md)|  | [optional] 

### Return type

[**AirtimePurchaseViewStandardResponse**](AirtimePurchaseViewStandardResponse.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json-patch+json, application/json, text/json, application/_*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **purchaseDataBundle**
> AirtimePurchaseViewStandardResponse purchaseDataBundle(body)



### Example
```dart
import 'package:swagger/api.dart';
// TODO Configure API key authorization: Bearer
//swagger.api.Configuration.apiKey{'Authorization'} = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//swagger.api.Configuration.apiKeyPrefix{'Authorization'} = "Bearer";

var api_instance = new BillsApi();
var body = new DataBundlePurchaseInput(); // DataBundlePurchaseInput | 

try {
    var result = api_instance.purchaseDataBundle(body);
    print(result);
} catch (e) {
    print("Exception when calling BillsApi->purchaseDataBundle: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**DataBundlePurchaseInput**](DataBundlePurchaseInput.md)|  | [optional] 

### Return type

[**AirtimePurchaseViewStandardResponse**](AirtimePurchaseViewStandardResponse.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json-patch+json, application/json, text/json, application/_*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **purchasePostPaidElectricity**
> AirtimePurchaseViewStandardResponse purchasePostPaidElectricity(body)



### Example
```dart
import 'package:swagger/api.dart';
// TODO Configure API key authorization: Bearer
//swagger.api.Configuration.apiKey{'Authorization'} = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//swagger.api.Configuration.apiKeyPrefix{'Authorization'} = "Bearer";

var api_instance = new BillsApi();
var body = new PurchaseElectricityModel(); // PurchaseElectricityModel | 

try {
    var result = api_instance.purchasePostPaidElectricity(body);
    print(result);
} catch (e) {
    print("Exception when calling BillsApi->purchasePostPaidElectricity: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**PurchaseElectricityModel**](PurchaseElectricityModel.md)|  | [optional] 

### Return type

[**AirtimePurchaseViewStandardResponse**](AirtimePurchaseViewStandardResponse.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json-patch+json, application/json, text/json, application/_*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **purchasePrePaidElectricity**
> AirtimePurchaseViewStandardResponse purchasePrePaidElectricity(body)



### Example
```dart
import 'package:swagger/api.dart';
// TODO Configure API key authorization: Bearer
//swagger.api.Configuration.apiKey{'Authorization'} = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//swagger.api.Configuration.apiKeyPrefix{'Authorization'} = "Bearer";

var api_instance = new BillsApi();
var body = new PurchaseElectricityModel(); // PurchaseElectricityModel | 

try {
    var result = api_instance.purchasePrePaidElectricity(body);
    print(result);
} catch (e) {
    print("Exception when calling BillsApi->purchasePrePaidElectricity: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**PurchaseElectricityModel**](PurchaseElectricityModel.md)|  | [optional] 

### Return type

[**AirtimePurchaseViewStandardResponse**](AirtimePurchaseViewStandardResponse.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json-patch+json, application/json, text/json, application/_*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **renewSubscription**
> StringStandardResponse renewSubscription(body)



### Example
```dart
import 'package:swagger/api.dart';
// TODO Configure API key authorization: Bearer
//swagger.api.Configuration.apiKey{'Authorization'} = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//swagger.api.Configuration.apiKeyPrefix{'Authorization'} = "Bearer";

var api_instance = new BillsApi();
var body = new SubscriptionModel(); // SubscriptionModel | 

try {
    var result = api_instance.renewSubscription(body);
    print(result);
} catch (e) {
    print("Exception when calling BillsApi->renewSubscription: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**SubscriptionModel**](SubscriptionModel.md)|  | [optional] 

### Return type

[**StringStandardResponse**](StringStandardResponse.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json-patch+json, application/json, text/json, application/_*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **validateMultiChoiceAccount**
> MultichoiceAccountResponseStandardResponse validateMultiChoiceAccount(serviceType, accountNumber)



### Example
```dart
import 'package:swagger/api.dart';
// TODO Configure API key authorization: Bearer
//swagger.api.Configuration.apiKey{'Authorization'} = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//swagger.api.Configuration.apiKeyPrefix{'Authorization'} = "Bearer";

var api_instance = new BillsApi();
var serviceType = serviceType_example; // String | 
var accountNumber = accountNumber_example; // String | 

try {
    var result = api_instance.validateMultiChoiceAccount(serviceType, accountNumber);
    print(result);
} catch (e) {
    print("Exception when calling BillsApi->validateMultiChoiceAccount: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **serviceType** | **String**|  | 
 **accountNumber** | **String**|  | 

### Return type

[**MultichoiceAccountResponseStandardResponse**](MultichoiceAccountResponseStandardResponse.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

