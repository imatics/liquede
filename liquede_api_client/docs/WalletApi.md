# swagger.api.WalletApi

## Load the API package
```dart
import 'package:swagger/api.dart';
```

All URIs are relative to */*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createTransactionPin**](WalletApi.md#createTransactionPin) | **POST** /api/Wallet/create/pin | 
[**createUserWallet**](WalletApi.md#createUserWallet) | **POST** /api/Wallet/create | 
[**debitWallet**](WalletApi.md#debitWallet) | **POST** /api/Wallet/debit | 
[**fundWallet**](WalletApi.md#fundWallet) | **POST** /api/Wallet/fund | 
[**getTransactionPin**](WalletApi.md#getTransactionPin) | **GET** /api/Wallet/pin/{userId} | 
[**listCards**](WalletApi.md#listCards) | **GET** /api/Wallet/cards/list | 
[**listCardsByUserId**](WalletApi.md#listCardsByUserId) | **GET** /api/Wallet/card/{userId}/list | 
[**listTransactions**](WalletApi.md#listTransactions) | **GET** /api/Wallet/transaction/{userId}/list | 
[**statementOfAccount**](WalletApi.md#statementOfAccount) | **GET** /api/Wallet/statementOfAccount/{userId}/{startDate}/{endDate} | 
[**transferToNigerianBank**](WalletApi.md#transferToNigerianBank) | **POST** /api/Wallet/transfer/nigerianbank | 
[**transferToWallet**](WalletApi.md#transferToWallet) | **POST** /api/Wallet/transfer | 
[**validatePayment**](WalletApi.md#validatePayment) | **GET** /api/Wallet/payment/validate/{transactionReference}/{transactionId} | 
[**walletBalance**](WalletApi.md#walletBalance) | **GET** /api/Wallet/balance | 

# **createTransactionPin**
> WalletViewStandardResponse createTransactionPin(body)



### Example
```dart
import 'package:swagger/api.dart';
// TODO Configure API key authorization: Bearer
//swagger.api.Configuration.apiKey{'Authorization'} = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//swagger.api.Configuration.apiKeyPrefix{'Authorization'} = "Bearer";

var api_instance = new WalletApi();
var body = new WalletPinModel(); // WalletPinModel | 

try {
    var result = api_instance.createTransactionPin(body);
    print(result);
} catch (e) {
    print("Exception when calling WalletApi->createTransactionPin: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**WalletPinModel**](WalletPinModel.md)|  | [optional] 

### Return type

[**WalletViewStandardResponse**](WalletViewStandardResponse.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json-patch+json, application/json, text/json, application/_*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **createUserWallet**
> WalletViewStandardResponse createUserWallet(body)



### Example
```dart
import 'package:swagger/api.dart';
// TODO Configure API key authorization: Bearer
//swagger.api.Configuration.apiKey{'Authorization'} = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//swagger.api.Configuration.apiKeyPrefix{'Authorization'} = "Bearer";

var api_instance = new WalletApi();
var body = new WalletModel(); // WalletModel | 

try {
    var result = api_instance.createUserWallet(body);
    print(result);
} catch (e) {
    print("Exception when calling WalletApi->createUserWallet: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**WalletModel**](WalletModel.md)|  | [optional] 

### Return type

[**WalletViewStandardResponse**](WalletViewStandardResponse.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json-patch+json, application/json, text/json, application/_*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **debitWallet**
> WalletViewStandardResponse debitWallet(body)



### Example
```dart
import 'package:swagger/api.dart';
// TODO Configure API key authorization: Bearer
//swagger.api.Configuration.apiKey{'Authorization'} = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//swagger.api.Configuration.apiKeyPrefix{'Authorization'} = "Bearer";

var api_instance = new WalletApi();
var body = new DebitWalletModel(); // DebitWalletModel | 

try {
    var result = api_instance.debitWallet(body);
    print(result);
} catch (e) {
    print("Exception when calling WalletApi->debitWallet: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**DebitWalletModel**](DebitWalletModel.md)|  | [optional] 

### Return type

[**WalletViewStandardResponse**](WalletViewStandardResponse.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json-patch+json, application/json, text/json, application/_*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **fundWallet**
> StringStandardResponse fundWallet(body)



### Example
```dart
import 'package:swagger/api.dart';
// TODO Configure API key authorization: Bearer
//swagger.api.Configuration.apiKey{'Authorization'} = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//swagger.api.Configuration.apiKeyPrefix{'Authorization'} = "Bearer";

var api_instance = new WalletApi();
var body = new FundWalletModel(); // FundWalletModel | 

try {
    var result = api_instance.fundWallet(body);
    print(result);
} catch (e) {
    print("Exception when calling WalletApi->fundWallet: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**FundWalletModel**](FundWalletModel.md)|  | [optional] 

### Return type

[**StringStandardResponse**](StringStandardResponse.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json-patch+json, application/json, text/json, application/_*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getTransactionPin**
> Int32StandardResponse getTransactionPin(userId)



### Example
```dart
import 'package:swagger/api.dart';
// TODO Configure API key authorization: Bearer
//swagger.api.Configuration.apiKey{'Authorization'} = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//swagger.api.Configuration.apiKeyPrefix{'Authorization'} = "Bearer";

var api_instance = new WalletApi();
var userId = 56; // int | 

try {
    var result = api_instance.getTransactionPin(userId);
    print(result);
} catch (e) {
    print("Exception when calling WalletApi->getTransactionPin: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **userId** | **int**|  | 

### Return type

[**Int32StandardResponse**](Int32StandardResponse.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listCards**
> CardViewIEnumerableStandardResponse listCards()



### Example
```dart
import 'package:swagger/api.dart';
// TODO Configure API key authorization: Bearer
//swagger.api.Configuration.apiKey{'Authorization'} = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//swagger.api.Configuration.apiKeyPrefix{'Authorization'} = "Bearer";

var api_instance = new WalletApi();

try {
    var result = api_instance.listCards();
    print(result);
} catch (e) {
    print("Exception when calling WalletApi->listCards: $e\n");
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**CardViewIEnumerableStandardResponse**](CardViewIEnumerableStandardResponse.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listCardsByUserId**
> TransactionViewPagedCollectionStandardResponse listCardsByUserId(userId, offset, limit)



### Example
```dart
import 'package:swagger/api.dart';
// TODO Configure API key authorization: Bearer
//swagger.api.Configuration.apiKey{'Authorization'} = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//swagger.api.Configuration.apiKeyPrefix{'Authorization'} = "Bearer";

var api_instance = new WalletApi();
var userId = 56; // int | 
var offset = 56; // int | 
var limit = 56; // int | 

try {
    var result = api_instance.listCardsByUserId(userId, offset, limit);
    print(result);
} catch (e) {
    print("Exception when calling WalletApi->listCardsByUserId: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **userId** | **int**|  | 
 **offset** | **int**|  | [optional] 
 **limit** | **int**|  | [optional] 

### Return type

[**TransactionViewPagedCollectionStandardResponse**](TransactionViewPagedCollectionStandardResponse.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listTransactions**
> TransactionViewPagedCollectionStandardResponse listTransactions(userId, offset, limit, search)



### Example
```dart
import 'package:swagger/api.dart';
// TODO Configure API key authorization: Bearer
//swagger.api.Configuration.apiKey{'Authorization'} = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//swagger.api.Configuration.apiKeyPrefix{'Authorization'} = "Bearer";

var api_instance = new WalletApi();
var userId = 56; // int | 
var offset = 56; // int | 
var limit = 56; // int | 
var search = search_example; // String | 

try {
    var result = api_instance.listTransactions(userId, offset, limit, search);
    print(result);
} catch (e) {
    print("Exception when calling WalletApi->listTransactions: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **userId** | **int**|  | 
 **offset** | **int**|  | [optional] 
 **limit** | **int**|  | [optional] 
 **search** | **String**|  | [optional] 

### Return type

[**TransactionViewPagedCollectionStandardResponse**](TransactionViewPagedCollectionStandardResponse.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **statementOfAccount**
> TransactionViewPagedCollectionStandardResponse statementOfAccount(userId, startDate, endDate, offset, limit)



### Example
```dart
import 'package:swagger/api.dart';
// TODO Configure API key authorization: Bearer
//swagger.api.Configuration.apiKey{'Authorization'} = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//swagger.api.Configuration.apiKeyPrefix{'Authorization'} = "Bearer";

var api_instance = new WalletApi();
var userId = 56; // int | 
var startDate = 2013-10-20T19:20:30+01:00; // DateTime | 
var endDate = 2013-10-20T19:20:30+01:00; // DateTime | 
var offset = 56; // int | 
var limit = 56; // int | 

try {
    var result = api_instance.statementOfAccount(userId, startDate, endDate, offset, limit);
    print(result);
} catch (e) {
    print("Exception when calling WalletApi->statementOfAccount: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **userId** | **int**|  | 
 **startDate** | **DateTime**|  | 
 **endDate** | **DateTime**|  | 
 **offset** | **int**|  | [optional] 
 **limit** | **int**|  | [optional] 

### Return type

[**TransactionViewPagedCollectionStandardResponse**](TransactionViewPagedCollectionStandardResponse.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **transferToNigerianBank**
> WalletViewStandardResponse transferToNigerianBank(body)



### Example
```dart
import 'package:swagger/api.dart';
// TODO Configure API key authorization: Bearer
//swagger.api.Configuration.apiKey{'Authorization'} = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//swagger.api.Configuration.apiKeyPrefix{'Authorization'} = "Bearer";

var api_instance = new WalletApi();
var body = new NGNTransferModel(); // NGNTransferModel | 

try {
    var result = api_instance.transferToNigerianBank(body);
    print(result);
} catch (e) {
    print("Exception when calling WalletApi->transferToNigerianBank: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**NGNTransferModel**](NGNTransferModel.md)|  | [optional] 

### Return type

[**WalletViewStandardResponse**](WalletViewStandardResponse.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json-patch+json, application/json, text/json, application/_*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **transferToWallet**
> WalletViewStandardResponse transferToWallet(body)



### Example
```dart
import 'package:swagger/api.dart';
// TODO Configure API key authorization: Bearer
//swagger.api.Configuration.apiKey{'Authorization'} = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//swagger.api.Configuration.apiKeyPrefix{'Authorization'} = "Bearer";

var api_instance = new WalletApi();
var body = new WalletTransferModel(); // WalletTransferModel | 

try {
    var result = api_instance.transferToWallet(body);
    print(result);
} catch (e) {
    print("Exception when calling WalletApi->transferToWallet: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**WalletTransferModel**](WalletTransferModel.md)|  | [optional] 

### Return type

[**WalletViewStandardResponse**](WalletViewStandardResponse.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json-patch+json, application/json, text/json, application/_*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **validatePayment**
> PaymentViewStandardResponse validatePayment(transactionReference, transactionId)



### Example
```dart
import 'package:swagger/api.dart';
// TODO Configure API key authorization: Bearer
//swagger.api.Configuration.apiKey{'Authorization'} = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//swagger.api.Configuration.apiKeyPrefix{'Authorization'} = "Bearer";

var api_instance = new WalletApi();
var transactionReference = transactionReference_example; // String | 
var transactionId = 56; // int | 

try {
    var result = api_instance.validatePayment(transactionReference, transactionId);
    print(result);
} catch (e) {
    print("Exception when calling WalletApi->validatePayment: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **transactionReference** | **String**|  | 
 **transactionId** | **int**|  | 

### Return type

[**PaymentViewStandardResponse**](PaymentViewStandardResponse.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **walletBalance**
> TransactionViewPagedCollectionStandardResponse walletBalance(userId)



### Example
```dart
import 'package:swagger/api.dart';
// TODO Configure API key authorization: Bearer
//swagger.api.Configuration.apiKey{'Authorization'} = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//swagger.api.Configuration.apiKeyPrefix{'Authorization'} = "Bearer";

var api_instance = new WalletApi();
var userId = 56; // int | 

try {
    var result = api_instance.walletBalance(userId);
    print(result);
} catch (e) {
    print("Exception when calling WalletApi->walletBalance: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **userId** | **int**|  | [optional] 

### Return type

[**TransactionViewPagedCollectionStandardResponse**](TransactionViewPagedCollectionStandardResponse.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

