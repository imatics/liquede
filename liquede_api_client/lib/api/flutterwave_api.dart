part of swagger.api;

class FlutterWaveApi {

  FlutterWaveApi(){
    flutterwaveClient.setAccessToken("FLWSECK_TEST-3031ea97b2786d7546b6975b927c330d-X");
  }

  Future<BaseResponse<List<BankInfo>>?> getBankList() async {
    Object? postBody;
    String path = "/banks/NG".replaceAll("{format}", "json");

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

    var response = await flutterwaveClient.invokeAPI(path, 'GET', queryParams,
        postBody, headerParams, formParams, contentType, []);

    if (response.statusCode >= 400) {
      throw new ApiException(response.statusCode, response.body);
    } else if (response.body != null) {
      return BaseResponse<List<BankInfo>>.fromJson(json.decode(response.body));
    } else {
      return null;
    }
  }

  Future<BaseResponse<BankAccountInfo>?> getAccountInfo(
      String bankCode, String accountNumber) async {
    Object? postBody = {"account_number": "$accountNumber", "account_bank": "$bankCode"};

    // verify required params are set

    // create path and map variables
    String path = "/accounts/resolve".replaceAll("{format}", "json");

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


    var response = await flutterwaveClient.invokeAPI(path, 'POST', queryParams,
        postBody, headerParams, formParams, contentType, []);

    if (response.statusCode >= 400) {
      throw new ApiException(response.statusCode, response.body);
    } else if (response.body != null) {
      return BaseResponse<BankAccountInfo>.fromJson(json.decode(response.body));
    } else {
      return null;
    }
  }
}
