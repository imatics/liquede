# swagger.api.AdminApi

## Load the API package
```dart
import 'package:swagger/api.dart';
```

All URIs are relative to */*

Method | HTTP request | Description
------------- | ------------- | -------------
[**authenticate**](AdminApi.md#authenticate) | **POST** /api/Admin/token | 
[**create**](AdminApi.md#create) | **POST** /api/Admin/create | 
[**deleteUser**](AdminApi.md#deleteUser) | **GET** /api/Admin/delete/{email} | 
[**getUserById**](AdminApi.md#getUserById) | **GET** /api/Admin/user/get/{id} | 
[**listAdmins**](AdminApi.md#listAdmins) | **GET** /api/Admin/list | 
[**listLoans**](AdminApi.md#listLoans) | **GET** /api/Admin/loans/list | 

# **authenticate**
> UserViewStandardResponse authenticate(body)



### Example
```dart
import 'package:swagger/api.dart';
// TODO Configure API key authorization: Bearer
//swagger.api.Configuration.apiKey{'Authorization'} = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//swagger.api.Configuration.apiKeyPrefix{'Authorization'} = "Bearer";

var api_instance = new AdminApi();
var body = new LoginModel(); // LoginModel | 

try {
    var result = api_instance.authenticate(body);
    print(result);
} catch (e) {
    print("Exception when calling AdminApi->authenticate: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**LoginModel**](LoginModel.md)|  | [optional] 

### Return type

[**UserViewStandardResponse**](UserViewStandardResponse.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json-patch+json, application/json, text/json, application/_*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **create**
> UserViewStandardResponse create(body)



### Example
```dart
import 'package:swagger/api.dart';
// TODO Configure API key authorization: Bearer
//swagger.api.Configuration.apiKey{'Authorization'} = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//swagger.api.Configuration.apiKeyPrefix{'Authorization'} = "Bearer";

var api_instance = new AdminApi();
var body = new Register(); // Register | 

try {
    var result = api_instance.create(body);
    print(result);
} catch (e) {
    print("Exception when calling AdminApi->create: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**Register**](Register.md)|  | [optional] 

### Return type

[**UserViewStandardResponse**](UserViewStandardResponse.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json-patch+json, application/json, text/json, application/_*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteUser**
> UserViewStandardResponse deleteUser(email)



### Example
```dart
import 'package:swagger/api.dart';
// TODO Configure API key authorization: Bearer
//swagger.api.Configuration.apiKey{'Authorization'} = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//swagger.api.Configuration.apiKeyPrefix{'Authorization'} = "Bearer";

var api_instance = new AdminApi();
var email = email_example; // String | 

try {
    var result = api_instance.deleteUser(email);
    print(result);
} catch (e) {
    print("Exception when calling AdminApi->deleteUser: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **email** | **String**|  | 

### Return type

[**UserViewStandardResponse**](UserViewStandardResponse.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getUserById**
> UserViewPagedCollectionStandardResponse getUserById(id)



### Example
```dart
import 'package:swagger/api.dart';
// TODO Configure API key authorization: Bearer
//swagger.api.Configuration.apiKey{'Authorization'} = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//swagger.api.Configuration.apiKeyPrefix{'Authorization'} = "Bearer";

var api_instance = new AdminApi();
var id = 56; // int | 

try {
    var result = api_instance.getUserById(id);
    print(result);
} catch (e) {
    print("Exception when calling AdminApi->getUserById: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 

### Return type

[**UserViewPagedCollectionStandardResponse**](UserViewPagedCollectionStandardResponse.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listAdmins**
> UserViewPagedCollectionStandardResponse listAdmins(offset, limit, search)



### Example
```dart
import 'package:swagger/api.dart';
// TODO Configure API key authorization: Bearer
//swagger.api.Configuration.apiKey{'Authorization'} = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//swagger.api.Configuration.apiKeyPrefix{'Authorization'} = "Bearer";

var api_instance = new AdminApi();
var offset = 56; // int | 
var limit = 56; // int | 
var search = search_example; // String | 

try {
    var result = api_instance.listAdmins(offset, limit, search);
    print(result);
} catch (e) {
    print("Exception when calling AdminApi->listAdmins: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **offset** | **int**|  | [optional] 
 **limit** | **int**|  | [optional] 
 **search** | **String**|  | [optional] 

### Return type

[**UserViewPagedCollectionStandardResponse**](UserViewPagedCollectionStandardResponse.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listLoans**
> LoanViewPagedCollectionStandardResponse listLoans(offset, limit)



### Example
```dart
import 'package:swagger/api.dart';
// TODO Configure API key authorization: Bearer
//swagger.api.Configuration.apiKey{'Authorization'} = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//swagger.api.Configuration.apiKeyPrefix{'Authorization'} = "Bearer";

var api_instance = new AdminApi();
var offset = 56; // int | 
var limit = 56; // int | 

try {
    var result = api_instance.listLoans(offset, limit);
    print(result);
} catch (e) {
    print("Exception when calling AdminApi->listLoans: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **offset** | **int**|  | [optional] 
 **limit** | **int**|  | [optional] 

### Return type

[**LoanViewPagedCollectionStandardResponse**](LoanViewPagedCollectionStandardResponse.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

