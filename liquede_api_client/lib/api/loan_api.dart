part of swagger.api;



class LoanApi {
  final ApiClient apiClient;

  LoanApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  ///
  ///
  ///
  Future<LoanViewStandardResponse?> createLoanRequest({ LoanModel? body }) async {
    Object? postBody = body;

    // verify required params are set

    // create path and map variables
    String path = "/api/Loan/apply".replaceAll("{format}","json");

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
          apiClient.deserialize(response.body, 'LoanViewStandardResponse') as LoanViewStandardResponse ;
    } else {
      return null;
    }
  }
  ///
  ///
  ///
  Future<LoanViewStandardResponse?> getLoanRequest(int id) async {
    Object? postBody = null;

    // verify required params are set
    if(id == null) {
     throw new ApiException(400, "Missing required param: id");
    }

    // create path and map variables
    String path = "/api/Loan/{id}".replaceAll("{format}","json").replaceAll("{" + "id" + "}", id.toString());

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
          apiClient.deserialize(response.body, 'LoanViewStandardResponse') as LoanViewStandardResponse ;
    } else {
      return null;
    }
  }
  ///
  ///
  ///
  Future<LoanViewIEnumerableStandardResponse?> listMyLoans() async {
    Object? postBody = null;

    // verify required params are set

    // create path and map variables
    String path = "/api/Loan/my".replaceAll("{format}","json");

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
          apiClient.deserialize(response.body, 'LoanViewIEnumerableStandardResponse') as LoanViewIEnumerableStandardResponse ;
    } else {
      return null;
    }
  }
}
