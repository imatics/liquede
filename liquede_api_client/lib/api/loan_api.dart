part of swagger.api;

class LoanApi {
  LoanApi();

  Future<BaseResponse<LoanView>?> createLoanRequest({LoanModel? body}) async {
    Object? postBody = body;

    String path = "/api/Loan/apply".replaceAll("{format}", "json");
    List<String> authNames = ["Bearer"];
    var response = await defaultApiClient.invokeAPI(
        path, 'POST', [], postBody, {}, {}, "application/json", authNames);

    if (response.statusCode >= 400) {
      throw new ApiException(response.statusCode, response.body);
    } else if (response.body != null) {
      return BaseResponse<LoanView>.fromJson(json.decode(response.body));
    } else {
      return null;
    }
  }

  Future<BaseResponse<LoanView>?> getLoanRequest(int id) async {
    Object? postBody = null;

    if (id == null) {
      throw new ApiException(400, "Missing required param: id");
    }
    String path = "/api/Loan/{id}"
        .replaceAll("{format}", "json")
        .replaceAll("{" + "id" + "}", id.toString());

    List<String> authNames = ["Bearer"];
    var response = await defaultApiClient.invokeAPI(
        path, 'GET', [], postBody, {}, {}, "application/json", authNames);

    if (response.statusCode >= 400) {
      throw new ApiException(response.statusCode, response.body);
    } else if (response.body != null) {
      return BaseResponse<LoanView>.fromJson(json.decode(response.body));
    } else {
      return null;
    }
  }

  Future<BaseResponse<List<LoanView>>?> listMyLoans() async {
    Object? postBody = null;

    String path = "/api/Loan/my".replaceAll("{format}", "json");

    List<String> authNames = ["Bearer"];

    var response = await defaultApiClient.invokeAPI(
        path, 'GET', [], postBody, {}, {}, "application/json", authNames);

    if (response.statusCode >= 400) {
      throw new ApiException(response.statusCode, response.body);
    } else if (response.body != null) {
      return BaseResponse<List<LoanView>>.fromJson(json.decode(response.body));
    } else {
      return null;
    }
  }

  Future<BaseResponse?> cancelLoan(String id) async {
    Object? postBody = null;
    String path = "/api/Loan/cancel/$id".replaceAll("{format}", "json");
    List<String> authNames = ["Bearer"];
    var response = await defaultApiClient.invokeAPI(
        path, 'GET', [], postBody, {}, {}, "application/json", authNames);

    if (response.statusCode >= 400) {
      throw new ApiException(response.statusCode, response.body);
    } else if (response.body != null) {
      return BaseResponse.fromJson(json.decode(response.body));
    } else {
      return null;
    }
  }
}
