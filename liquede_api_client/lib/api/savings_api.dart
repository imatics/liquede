part of swagger.api;



class SavingsApi {
  final ApiClient apiClient;

  SavingsApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  ///
  ///
  ///
  Future<SavingsViewStandardResponse?> createLiqiedeGoalSavingPlan({ LiquiedeGoalInput? body }) async {
    Object? postBody = body;

    // verify required params are set

    // create path and map variables
    String path = "/api/Savings/plans/liqiede-goal".replaceAll("{format}","json");

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
          apiClient.deserialize(response.body, 'SavingsViewStandardResponse') as SavingsViewStandardResponse ;
    } else {
      return null;
    }
  }
  ///
  ///
  ///
  Future<SavingsViewStandardResponse?> createLiqiedeSealSavingPlan({ LiquedeSealInput? body }) async {
    Object? postBody = body;

    // verify required params are set

    // create path and map variables
    String path = "/api/Savings/plans/liqiede-seal".replaceAll("{format}","json");

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
          apiClient.deserialize(response.body, 'SavingsViewStandardResponse') as SavingsViewStandardResponse ;
    } else {
      return null;
    }
  }
  ///
  ///
  ///
  Future<SavingPlanTypeIEnumerableStandardResponse?> getSavingPlanTypes() async {
    Object? postBody = null;

    // verify required params are set

    // create path and map variables
    String path = "/api/Savings/plans/types".replaceAll("{format}","json");

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
          apiClient.deserialize(response.body, 'SavingPlanTypeIEnumerableStandardResponse') as SavingPlanTypeIEnumerableStandardResponse ;
    } else {
      return null;
    }
  }
  ///
  ///
  ///
  Future<Int32StandardResponse?> getWithdrawalPenaltyPercentage() async {
    Object? postBody = null;

    // verify required params are set

    // create path and map variables
    String path = "/api/Savings/withdrawalpenaltypercentage".replaceAll("{format}","json");

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
          apiClient.deserialize(response.body, 'Int32StandardResponse') as Int32StandardResponse ;
    } else {
      return null;
    }
  }
  ///
  ///
  ///
  Future<SavingsViewStandardResponse?> retryPlanPayment(int planId, String paymentMethod) async {
    Object? postBody = null;

    // verify required params are set
    if(planId == null) {
     throw new ApiException(400, "Missing required param: planId");
    }
    if(paymentMethod == null) {
     throw new ApiException(400, "Missing required param: paymentMethod");
    }

    // create path and map variables
    String path = "/api/Savings/plans/retry-payment/{PlanId}/{PaymentMethod}".replaceAll("{format}","json").replaceAll("{" + "PlanId" + "}", planId.toString()).replaceAll("{" + "PaymentMethod" + "}", paymentMethod.toString());

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
          apiClient.deserialize(response.body, 'SavingsViewStandardResponse') as SavingsViewStandardResponse ;
    } else {
      return null;
    }
  }
  ///
  ///
  ///
  Future<SavingsViewStandardResponse?> withdrawPrematurely({ SavingsWithdrawalModel? body }) async {
    Object? postBody = body;

    // verify required params are set

    // create path and map variables
    String path = "/api/Savings/plans/withdraw-prematurely".replaceAll("{format}","json");

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
          apiClient.deserialize(response.body, 'SavingsViewStandardResponse') as SavingsViewStandardResponse ;
    } else {
      return null;
    }
  }
}
