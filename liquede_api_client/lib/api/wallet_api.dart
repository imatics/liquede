part of swagger.api;

class WalletApi {
  WalletApi();

  ///
  ///
  ///
  Future<BaseResponse<WalletView>?> createTransactionPin(
      {WalletPinModel? body}) async {
    Object? postBody = body;

    // verify required params are set
    String path = "/api/Wallet/create/pin".replaceAll("{format}", "json");

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
    var response = await defaultApiClient.invokeAPI(path, 'POST', queryParams,
        postBody, headerParams, formParams, contentType, authNames);

    if (response.statusCode >= 400) {
      throw new ApiException(response.statusCode, response.body);
    } else if (response.body != null) {
      return BaseResponse<WalletView>.fromJson(json.decode(response.body));
    } else {
      return null;
    }
  }

  ///
  ///
  ///
  Future<BaseResponse<WalletView>?> createUserWallet(
      {WalletModel? body}) async {
    Object? postBody = body;

    // verify required params are set
    String path = "/api/Wallet/create".replaceAll("{format}", "json");

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
    var response = await defaultApiClient.invokeAPI(path, 'POST', queryParams,
        postBody, headerParams, formParams, contentType, authNames);

    if (response.statusCode >= 400) {
      throw new ApiException(response.statusCode, response.body);
    } else if (response.body != null) {
      return BaseResponse<WalletView>.fromJson(json.decode(response.body));
    } else {
      return null;
    }
  }

  ///
  ///
  ///
  Future<BaseResponse<WalletView>?> debitWallet(
      {DebitWalletModel? body}) async {
    Object? postBody = body;

    // verify required params are set
    String path = "/api/Wallet/debit".replaceAll("{format}", "json");

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
    var response = await defaultApiClient.invokeAPI(path, 'POST', queryParams,
        postBody, headerParams, formParams, contentType, authNames);

    if (response.statusCode >= 400) {
      throw new ApiException(response.statusCode, response.body);
    } else if (response.body != null) {
      return BaseResponse<WalletView>.fromJson(json.decode(response.body));
    } else {
      return null;
    }
  }

  ///
  ///
  ///
  Future<BaseResponse<String>?> fundWallet({FundWalletModel? body}) async {
    Object? postBody = body;

    // verify required params are set
    String path = "/api/Wallet/fund".replaceAll("{format}", "json");

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
    var response = await defaultApiClient.invokeAPI(path, 'POST', queryParams,
        postBody, headerParams, formParams, contentType, authNames);

    if (response.statusCode >= 400) {
      throw new ApiException(response.statusCode, response.body);
    } else if (response.body != null) {
      return BaseResponse<String>.fromJson(json.decode(response.body));
    } else {
      return null;
    }
  }

  ///
  ///
  ///
  Future<BaseResponse<int>?> getTransactionPin(int userId) async {
    Object? postBody = null;

    // verify required params are set
    if (userId == null) {
      throw new ApiException(400, "Missing required param: userId");
    }
    String path = "/api/Wallet/pin/{userId}"
        .replaceAll("{format}", "json")
        .replaceAll("{" + "userId" + "}", userId.toString());

    // query params
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
      return BaseResponse<int>.fromJson(json.decode(response.body));
    } else {
      return null;
    }
  }

  ///
  ///
  ///
  Future<BaseResponse<List<CardView>>?> listCards() async {
    Object? postBody = null;
    String path = "/api/Wallet/cards/list".replaceAll("{format}", "json");
    List<String> authNames = ["Bearer"];
    var response = await defaultApiClient.invokeAPI(
        path, 'GET', [], postBody, {}, {}, "application/json", authNames);

    if (response.statusCode >= 400) {
      throw new ApiException(response.statusCode, response.body);
    } else if (response.body != null) {
      return BaseResponse<List<CardView>>.fromJson(json.decode(response.body));
    } else {
      return null;
    }
  }

  Future<BaseResponse<BeneficiaryModel>?> saveBeneficiary({required BeneficiaryModel model}) async {
    Object? postBody = model;
    String path = "/api/Beneficiary/create".replaceAll("{format}", "json");
    List<String> authNames = ["Bearer"];
    var response = await defaultApiClient.invokeAPI(
        path, 'POST', [], postBody, {}, {}, "application/json", authNames);

    if (response.statusCode >= 400) {
      throw new ApiException(response.statusCode, response.body);
    } else if (response.body != null) {
      return BaseResponse<BeneficiaryModel>.fromJson(json.decode(response.body));
    } else {
      return null;
    }
  }

  Future<BaseResponse<List<BeneficiaryModel>>?> getBeneficiaries() async {
    Object? postBody;
    String path = "/api/Beneficiary/list/my".replaceAll("{format}", "json");
    List<String> authNames = ["Bearer"];
    var response = await defaultApiClient.invokeAPI(
        path, 'GET', [], postBody, {}, {}, "application/json", authNames);
    if (response.statusCode >= 400) {
      throw new ApiException(response.statusCode, response.body);
    } else if (response.body != null) {
      return BaseResponse<List<BeneficiaryModel>>.fromJson(json.decode(response.body));
    } else {
      return null;
    }
  }

  ///
  ///
  ///
  Future<BaseResponse<TransactionViewPagedCollection>?> listCardsByUserId(
      int userId,
      {int? offset,
      int? limit}) async {
    Object? postBody = null;

    // verify required params are set
    if (userId == null) {
      throw new ApiException(400, "Missing required param: userId");
    }
    String path = "/api/Wallet/card/{userId}/list"
        .replaceAll("{format}", "json")
        .replaceAll("{" + "userId" + "}", userId.toString());

    // query params
    List<QueryParam> queryParams = [];
    Map<String, String> headerParams = {};
    Map<String, String> formParams = {};
    if (offset != null) {
      queryParams
          .addAll(_convertParametersForCollectionFormat("", "Offset", offset));
    }
    if (limit != null) {
      queryParams
          .addAll(_convertParametersForCollectionFormat("", "Limit", limit));
    }

    List<String> contentTypes = [];

    String contentType =
        contentTypes.length > 0 ? contentTypes[0] : "application/json";
    List<String> authNames = ["Bearer"];
    var response = await defaultApiClient.invokeAPI(path, 'GET', queryParams,
        postBody, headerParams, formParams, contentType, authNames);

    if (response.statusCode >= 400) {
      throw new ApiException(response.statusCode, response.body);
    } else if (response.body != null) {
      return BaseResponse<TransactionViewPagedCollection>.fromJson(
          json.decode(response.body));
    } else {
      return null;
    }
  }

  ///
  ///
  ///
  Future<BaseResponse<TransactionViewPagedCollection>?> listTransactions(
      int userId,
      {int? offset,
      int? limit,
      String? search}) async {
    Object? postBody = null;

    // verify required params are set
    if (userId == null) {
      throw new ApiException(400, "Missing required param: userId");
    }
    String path = "/api/Wallet/transaction/{userId}/list"
        .replaceAll("{format}", "json")
        .replaceAll("{" + "userId" + "}", userId.toString());

    // query params
    List<QueryParam> queryParams = [];
    Map<String, String> headerParams = {};
    Map<String, String> formParams = {};
    if (offset != null) {
      queryParams
          .addAll(_convertParametersForCollectionFormat("", "Offset", offset));
    }
    if (limit != null) {
      queryParams
          .addAll(_convertParametersForCollectionFormat("", "Limit", limit));
    }
    if (search != null) {
      queryParams
          .addAll(_convertParametersForCollectionFormat("", "search", search));
    }

    List<String> contentTypes = [];

    String contentType =
        contentTypes.length > 0 ? contentTypes[0] : "application/json";
    List<String> authNames = ["Bearer"];
    var response = await defaultApiClient.invokeAPI(path, 'GET', queryParams,
        postBody, headerParams, formParams, contentType, authNames);

    if (response.statusCode >= 400) {
      throw new ApiException(response.statusCode, response.body);
    } else if (response.body != null) {
      return BaseResponse<TransactionViewPagedCollection>.fromJson(
          json.decode(response.body));
    } else {
      return null;
    }
  }

  ///
  ///
  ///
  Future<BaseResponse<TransactionViewPagedCollection>?> statementOfAccount(
      int? userId, DateTime? startDate, DateTime? endDate,
      {int? offset, int? limit}) async {
    Object? postBody = null;

    // verify required params are set
    if (userId == null) {
      throw new ApiException(400, "Missing required param: userId");
    }
    if (startDate == null) {
      throw new ApiException(400, "Missing required param: startDate");
    }
    if (endDate == null) {
      throw new ApiException(400, "Missing required param: endDate");
    }
    String path =
        "/api/Wallet/statementOfAccount/{userId}/{startDate}/{endDate}"
            .replaceAll("{format}", "json")
            .replaceAll("{" + "userId" + "}", userId.toString())
            .replaceAll("{" + "startDate" + "}", startDate.toString())
            .replaceAll("{" + "endDate" + "}", endDate.toString());

    // query params
    List<QueryParam> queryParams = [];
    Map<String, String> headerParams = {};
    Map<String, String> formParams = {};
    if (offset != null) {
      queryParams
          .addAll(_convertParametersForCollectionFormat("", "Offset", offset));
    }
    if (limit != null) {
      queryParams
          .addAll(_convertParametersForCollectionFormat("", "Limit", limit));
    }

    List<String> contentTypes = [];

    String contentType =
        contentTypes.length > 0 ? contentTypes[0] : "application/json";
    List<String> authNames = ["Bearer"];
    var response = await defaultApiClient.invokeAPI(path, 'GET', queryParams,
        postBody, headerParams, formParams, contentType, authNames);

    if (response.statusCode >= 400) {
      throw new ApiException(response.statusCode, response.body);
    } else if (response.body != null) {
      return BaseResponse<TransactionViewPagedCollection>.fromJson(
          json.decode(response.body));
    } else {
      return null;
    }
  }

  ///
  ///
  ///
  Future<BaseResponse<WalletView>?> transferToNigerianBank(
      {NGNTransferModel? body}) async {
    Object? postBody = body;

    // verify required params are set
    String path =
        "/api/Wallet/transfer/nigerianbank".replaceAll("{format}", "json");

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
    var response = await defaultApiClient.invokeAPI(path, 'POST', queryParams,
        postBody, headerParams, formParams, contentType, authNames);

    if (response.statusCode >= 400) {
      throw new ApiException(response.statusCode, response.body);
    } else if (response.body != null) {
      return BaseResponse<WalletView>.fromJson(json.decode(response.body));
    } else {
      return null;
    }
  }

  ///
  ///
  ///
  Future<BaseResponse<WalletView>?> transferToWallet(
      {WalletTransferModel? body}) async {
    Object? postBody = body;

    // verify required params are set
    String path = "/api/Wallet/transfer".replaceAll("{format}", "json");

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
    var response = await defaultApiClient.invokeAPI(path, 'POST', queryParams,
        postBody, headerParams, formParams, contentType, authNames);

    if (response.statusCode >= 400) {
      throw new ApiException(response.statusCode, response.body);
    } else if (response.body != null) {
      return BaseResponse<WalletView>.fromJson(json.decode(response.body));
    } else {
      return null;
    }
  }

  ///
  ///
  ///
  Future<BaseResponse<PaymentView>?> validatePayment(
      String transactionReference, String transactionId) async {
    Object? postBody = null;

    // verify required params are set
    if (transactionReference == null) {
      throw new ApiException(
          400, "Missing required param: transactionReference");
    }
    if (transactionId == null) {
      throw new ApiException(400, "Missing required param: transactionId");
    }
    String path =
        "/api/Wallet/payment/validate/{transactionReference}/{transactionId}"
            .replaceAll("{format}", "json")
            .replaceAll("{" + "transactionReference" + "}",
                transactionReference.toString())
            .replaceAll("{" + "transactionId" + "}", transactionId.toString());

    // query params
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
      return BaseResponse<PaymentView>.fromJson(json.decode(response.body));
    } else {
      return null;
    }
  }

  ///
  ///
  ///
  Future<BaseResponse<WalletView>?> walletBalance({int? userId}) async {
    Object? postBody = null;

    // verify required params are set
    String path = "/api/Wallet/balance".replaceAll("{format}", "json");

    // query params
    List<QueryParam> queryParams = [];
    Map<String, String> headerParams = {};
    Map<String, String> formParams = {};
    if (userId != null) {
      queryParams
          .addAll(_convertParametersForCollectionFormat("", "userId", userId));
    }

    List<String> contentTypes = [];

    String contentType =
        contentTypes.length > 0 ? contentTypes[0] : "application/json";
    List<String> authNames = ["Bearer"];
    var response = await defaultApiClient.invokeAPI(path, 'GET', queryParams,
        postBody, headerParams, formParams, contentType, authNames);

    if (response.statusCode >= 400) {
      throw new ApiException(response.statusCode, response.body);
    } else if (response.body != null) {
      return BaseResponse<WalletView>.fromJson(json.decode(response.body));
    } else {
      return null;
    }
  }
}
