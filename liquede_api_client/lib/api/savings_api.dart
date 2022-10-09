part of swagger.api;

class SavingsApi {
  SavingsApi();

  ///
  ///
  ///
  Future<BaseResponse<SavingsView>?> createLiqiedeGoalSavingPlan(
      {LiquiedeGoalInput? body}) async {
    Object? postBody = body;

    // verify required params are set

    // create path and map variables
    String path =
        "/api/Savings/plans/liqiede-goal".replaceAll("{format}", "json");

    // query params
    List<QueryParam> queryParams = [];
    Map<String, String> headerParams = {};
    Map<String, String> formParams = {};

    List<String> contentTypes = [
      "application/json-patch+json",
      "application/json",
      "text/json",
      "application/_*+json"
    ];

    String contentType =
        contentTypes.length > 0 ? contentTypes[0] : "application/json";
    List<String> authNames = ["Bearer"];

    if (contentType.startsWith("multipart/form-data")) {
      bool hasFields = false;
      // MultipartRequest mp = new MultipartRequest(null, null);
      // if(hasFields)
      //   postBody = mp;
    } else {}

    var response = await defaultApiClient.invokeAPI(path, 'POST', queryParams,
        postBody, headerParams, formParams, contentType, authNames);

    if (response.statusCode >= 400) {
      throw new ApiException(response.statusCode, response.body);
    } else if (response.body != null) {
      return BaseResponse<SavingsView>.fromJson(json.decode(response.body));
    } else {
      return null;
    }
  }

  ///
  ///
  ///
  Future<BaseResponse<SavingsView>?> createLiqiedeSealSavingPlan(
      {LiquedeSealInput? body}) async {
    Object? postBody = body;

    // verify required params are set

    // create path and map variables
    String path =
        "/api/Savings/plans/liqiede-seal".replaceAll("{format}", "json");

    // query params
    List<QueryParam> queryParams = [];
    Map<String, String> headerParams = {};
    Map<String, String> formParams = {};

    List<String> contentTypes = [
      "application/json-patch+json",
      "application/json",
      "text/json",
      "application/_*+json"
    ];

    String contentType =
        contentTypes.length > 0 ? contentTypes[0] : "application/json";
    List<String> authNames = ["Bearer"];

    if (contentType.startsWith("multipart/form-data")) {
      bool hasFields = false;
      // MultipartRequest mp = new MultipartRequest(null, null);
      // if(hasFields)
      //   postBody = mp;
    } else {}

    var response = await defaultApiClient.invokeAPI(path, 'POST', queryParams,
        postBody, headerParams, formParams, contentType, authNames);

    if (response.statusCode >= 400) {
      throw new ApiException(response.statusCode, response.body);
    } else if (response.body != null) {
      return BaseResponse<SavingsView>.fromJson(json.decode(response.body));
    } else {
      return null;
    }
  }

  ///
  ///
  ///
  Future<BaseResponse<List<SavingPlanType>>?> getSavingPlanTypes() async {
    Object? postBody = null;

    // verify required params are set

    // create path and map variables
    String path = "/api/Savings/plans/types".replaceAll("{format}", "json");

    // query params
    List<QueryParam> queryParams = [];
    Map<String, String> headerParams = {};
    Map<String, String> formParams = {};

    List<String> contentTypes = [];

    String contentType =
        contentTypes.length > 0 ? contentTypes[0] : "application/json";
    List<String> authNames = ["Bearer"];

    if (contentType.startsWith("multipart/form-data")) {
      bool hasFields = false;
      // MultipartRequest mp = new MultipartRequest(null, null);
      // if(hasFields)
      //   postBody = mp;
    } else {}

    var response = await defaultApiClient.invokeAPI(path, 'GET', queryParams,
        postBody, headerParams, formParams, contentType, authNames);

    if (response.statusCode >= 400) {
      throw new ApiException(response.statusCode, response.body);
    } else if (response.body != null) {
      return BaseResponse<List<SavingPlanType>>.fromJson(
          json.decode(response.body));
    } else {
      return null;
    }
  }

  ///
  ///
  ///
  Future<BaseResponse<int>?> getWithdrawalPenaltyPercentage() async {
    Object? postBody = null;
    String path = "/api/Savings/withdrawalpenaltypercentage"
        .replaceAll("{format}", "json");
    List<QueryParam> queryParams = [];
    Map<String, String> headerParams = {};
    Map<String, String> formParams = {};
    List<String> contentTypes = [];
    String contentType =
        contentTypes.length > 0 ? contentTypes[0] : "application/json";
    List<String> authNames = ["Bearer"];
    var response = await defaultApiClient.invokeAPI(path, 'GET', queryParams,
        postBody, headerParams, formParams, contentType, authNames);

    if (response.statusCode >= 400) {
      throw new ApiException(response.statusCode, response.body);
    } else if (response.body != null) {
      return BaseResponse.fromJson(json.decode(response.body));
    } else {
      return null;
    }
  }

  Future<BaseResponse<List<SavingsView>>?> getUserSavings() async {
    Object? postBody = null;
    String path = "/api/Savings/user".replaceAll("{format}", "json");
    var response = await defaultApiClient.invokeAPI(
        path, 'GET', [], postBody, {}, {}, "application/json", ["Bearer"]);

    if (response.statusCode >= 400) {
      throw new ApiException(response.statusCode, response.body);
    } else if (response.body != null) {
      return BaseResponse.fromJson(json.decode(response.body));
    } else {
      return null;
    }
  }

  ///
  ///
  ///
  Future<BaseResponse<SavingsView>?> retryPlanPayment(
      int planId, String paymentMethod) async {
    Object? postBody = null;

    // verify required params are set
    if (planId == null) {
      throw new ApiException(400, "Missing required param: planId");
    }
    if (paymentMethod == null) {
      throw new ApiException(400, "Missing required param: paymentMethod");
    }

    // create path and map variables
    String path = "/api/Savings/plans/retry-payment/{PlanId}/{PaymentMethod}"
        .replaceAll("{format}", "json")
        .replaceAll("{" + "PlanId" + "}", planId.toString())
        .replaceAll("{" + "PaymentMethod" + "}", paymentMethod.toString());

    // query params
    List<QueryParam> queryParams = [];
    Map<String, String> headerParams = {};
    Map<String, String> formParams = {};

    List<String> contentTypes = [];

    String contentType =
        contentTypes.length > 0 ? contentTypes[0] : "application/json";
    List<String> authNames = ["Bearer"];

    if (contentType.startsWith("multipart/form-data")) {
      bool hasFields = false;
      // MultipartRequest mp = new MultipartRequest(null, null);
      // if(hasFields)
      //   postBody = mp;
    } else {}

    var response = await defaultApiClient.invokeAPI(path, 'POST', queryParams,
        postBody, headerParams, formParams, contentType, authNames);

    if (response.statusCode >= 400) {
      throw new ApiException(response.statusCode, response.body);
    } else if (response.body != null) {
      return BaseResponse<SavingsView>.fromJson(json.decode(response.body));
    } else {
      return null;
    }
  }

  ///
  ///
  ///
  Future<BaseResponse<SavingsView>?> withdrawPrematurely(
      {SavingsWithdrawalModel? body}) async {
    Object? postBody = body;

    // verify required params are set

    // create path and map variables
    String path = "/api/Savings/plans/withdraw-prematurely"
        .replaceAll("{format}", "json");

    // query params
    List<QueryParam> queryParams = [];
    Map<String, String> headerParams = {};
    Map<String, String> formParams = {};

    List<String> contentTypes = [
      "application/json-patch+json",
      "application/json",
      "text/json",
      "application/_*+json"
    ];

    String contentType =
        contentTypes.length > 0 ? contentTypes[0] : "application/json";
    List<String> authNames = ["Bearer"];

    if (contentType.startsWith("multipart/form-data")) {
      bool hasFields = false;
      // MultipartRequest mp = new MultipartRequest(null, null);
      // if(hasFields)
      //   postBody = mp;
    } else {}

    var response = await defaultApiClient.invokeAPI(path, 'POST', queryParams,
        postBody, headerParams, formParams, contentType, authNames);

    if (response.statusCode >= 400) {
      throw new ApiException(response.statusCode, response.body);
    } else if (response.body != null) {
      return BaseResponse<SavingsView>.fromJson(json.decode(response.body));
    } else {
      return null;
    }
  }
}
