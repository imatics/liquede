# swagger.api.SavingsApi

## Load the API package
```dart
import 'package:swagger/api.dart';
```

All URIs are relative to */*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createLiqiedeGoalSavingPlan**](SavingsApi.md#createLiqiedeGoalSavingPlan) | **POST** /api/Savings/plans/liqiede-goal | 
[**createLiqiedeSealSavingPlan**](SavingsApi.md#createLiqiedeSealSavingPlan) | **POST** /api/Savings/plans/liqiede-seal | 
[**getSavingPlanTypes**](SavingsApi.md#getSavingPlanTypes) | **GET** /api/Savings/plans/types | 
[**getWithdrawalPenaltyPercentage**](SavingsApi.md#getWithdrawalPenaltyPercentage) | **GET** /api/Savings/withdrawalpenaltypercentage | 
[**retryPlanPayment**](SavingsApi.md#retryPlanPayment) | **POST** /api/Savings/plans/retry-payment/{PlanId}/{PaymentMethod} | 
[**withdrawPrematurely**](SavingsApi.md#withdrawPrematurely) | **POST** /api/Savings/plans/withdraw-prematurely | 

# **createLiqiedeGoalSavingPlan**
> SavingsViewStandardResponse createLiqiedeGoalSavingPlan(body)



### Example
```dart
import 'package:swagger/api.dart';
// TODO Configure API key authorization: Bearer
//swagger.api.Configuration.apiKey{'Authorization'} = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//swagger.api.Configuration.apiKeyPrefix{'Authorization'} = "Bearer";

var api_instance = new SavingsApi();
var body = new LiquiedeGoalInput(); // LiquiedeGoalInput | 

try {
    var result = api_instance.createLiqiedeGoalSavingPlan(body);
    print(result);
} catch (e) {
    print("Exception when calling SavingsApi->createLiqiedeGoalSavingPlan: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**LiquiedeGoalInput**](LiquiedeGoalInput.md)|  | [optional] 

### Return type

[**SavingsViewStandardResponse**](SavingsViewStandardResponse.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json-patch+json, application/json, text/json, application/_*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **createLiqiedeSealSavingPlan**
> SavingsViewStandardResponse createLiqiedeSealSavingPlan(body)



### Example
```dart
import 'package:swagger/api.dart';
// TODO Configure API key authorization: Bearer
//swagger.api.Configuration.apiKey{'Authorization'} = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//swagger.api.Configuration.apiKeyPrefix{'Authorization'} = "Bearer";

var api_instance = new SavingsApi();
var body = new LiquedeSealInput(); // LiquedeSealInput | 

try {
    var result = api_instance.createLiqiedeSealSavingPlan(body);
    print(result);
} catch (e) {
    print("Exception when calling SavingsApi->createLiqiedeSealSavingPlan: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**LiquedeSealInput**](LiquedeSealInput.md)|  | [optional] 

### Return type

[**SavingsViewStandardResponse**](SavingsViewStandardResponse.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json-patch+json, application/json, text/json, application/_*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getSavingPlanTypes**
> SavingPlanTypeIEnumerableStandardResponse getSavingPlanTypes()



### Example
```dart
import 'package:swagger/api.dart';
// TODO Configure API key authorization: Bearer
//swagger.api.Configuration.apiKey{'Authorization'} = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//swagger.api.Configuration.apiKeyPrefix{'Authorization'} = "Bearer";

var api_instance = new SavingsApi();

try {
    var result = api_instance.getSavingPlanTypes();
    print(result);
} catch (e) {
    print("Exception when calling SavingsApi->getSavingPlanTypes: $e\n");
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**SavingPlanTypeIEnumerableStandardResponse**](SavingPlanTypeIEnumerableStandardResponse.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getWithdrawalPenaltyPercentage**
> Int32StandardResponse getWithdrawalPenaltyPercentage()



### Example
```dart
import 'package:swagger/api.dart';
// TODO Configure API key authorization: Bearer
//swagger.api.Configuration.apiKey{'Authorization'} = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//swagger.api.Configuration.apiKeyPrefix{'Authorization'} = "Bearer";

var api_instance = new SavingsApi();

try {
    var result = api_instance.getWithdrawalPenaltyPercentage();
    print(result);
} catch (e) {
    print("Exception when calling SavingsApi->getWithdrawalPenaltyPercentage: $e\n");
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**Int32StandardResponse**](Int32StandardResponse.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **retryPlanPayment**
> SavingsViewStandardResponse retryPlanPayment(planId, paymentMethod)



### Example
```dart
import 'package:swagger/api.dart';
// TODO Configure API key authorization: Bearer
//swagger.api.Configuration.apiKey{'Authorization'} = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//swagger.api.Configuration.apiKeyPrefix{'Authorization'} = "Bearer";

var api_instance = new SavingsApi();
var planId = 56; // int | 
var paymentMethod = paymentMethod_example; // String | 

try {
    var result = api_instance.retryPlanPayment(planId, paymentMethod);
    print(result);
} catch (e) {
    print("Exception when calling SavingsApi->retryPlanPayment: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **planId** | **int**|  | 
 **paymentMethod** | **String**|  | 

### Return type

[**SavingsViewStandardResponse**](SavingsViewStandardResponse.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **withdrawPrematurely**
> SavingsViewStandardResponse withdrawPrematurely(body)



### Example
```dart
import 'package:swagger/api.dart';
// TODO Configure API key authorization: Bearer
//swagger.api.Configuration.apiKey{'Authorization'} = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//swagger.api.Configuration.apiKeyPrefix{'Authorization'} = "Bearer";

var api_instance = new SavingsApi();
var body = new SavingsWithdrawalModel(); // SavingsWithdrawalModel | 

try {
    var result = api_instance.withdrawPrematurely(body);
    print(result);
} catch (e) {
    print("Exception when calling SavingsApi->withdrawPrematurely: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**SavingsWithdrawalModel**](SavingsWithdrawalModel.md)|  | [optional] 

### Return type

[**SavingsViewStandardResponse**](SavingsViewStandardResponse.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json-patch+json, application/json, text/json, application/_*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

