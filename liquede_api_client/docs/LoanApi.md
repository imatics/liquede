# swagger.api.LoanApi

## Load the API package
```dart
import 'package:swagger/api.dart';
```

All URIs are relative to */*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createLoanRequest**](LoanApi.md#createLoanRequest) | **POST** /api/Loan/apply | 
[**getLoanRequest**](LoanApi.md#getLoanRequest) | **GET** /api/Loan/{id} | 
[**listMyLoans**](LoanApi.md#listMyLoans) | **GET** /api/Loan/my | 

# **createLoanRequest**
> LoanViewStandardResponse createLoanRequest(body)



### Example
```dart
import 'package:swagger/api.dart';
// TODO Configure API key authorization: Bearer
//swagger.api.Configuration.apiKey{'Authorization'} = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//swagger.api.Configuration.apiKeyPrefix{'Authorization'} = "Bearer";

var api_instance = new LoanApi();
var body = new LoanModel(); // LoanModel | 

try {
    var result = api_instance.createLoanRequest(body);
    print(result);
} catch (e) {
    print("Exception when calling LoanApi->createLoanRequest: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**LoanModel**](LoanModel.md)|  | [optional] 

### Return type

[**LoanViewStandardResponse**](LoanViewStandardResponse.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json-patch+json, application/json, text/json, application/_*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getLoanRequest**
> LoanViewStandardResponse getLoanRequest(id)



### Example
```dart
import 'package:swagger/api.dart';
// TODO Configure API key authorization: Bearer
//swagger.api.Configuration.apiKey{'Authorization'} = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//swagger.api.Configuration.apiKeyPrefix{'Authorization'} = "Bearer";

var api_instance = new LoanApi();
var id = 56; // int | 

try {
    var result = api_instance.getLoanRequest(id);
    print(result);
} catch (e) {
    print("Exception when calling LoanApi->getLoanRequest: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 

### Return type

[**LoanViewStandardResponse**](LoanViewStandardResponse.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listMyLoans**
> LoanViewIEnumerableStandardResponse listMyLoans()



### Example
```dart
import 'package:swagger/api.dart';
// TODO Configure API key authorization: Bearer
//swagger.api.Configuration.apiKey{'Authorization'} = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//swagger.api.Configuration.apiKeyPrefix{'Authorization'} = "Bearer";

var api_instance = new LoanApi();

try {
    var result = api_instance.listMyLoans();
    print(result);
} catch (e) {
    print("Exception when calling LoanApi->listMyLoans: $e\n");
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**LoanViewIEnumerableStandardResponse**](LoanViewIEnumerableStandardResponse.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

