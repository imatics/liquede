part of swagger.api;



class AdminApi {
  final ApiClient apiClient;

  AdminApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  ///
  ///
  ///
  Future<BaseResponse<UserView>?> authenticate({ LoginModel? body }) async {
    Object? postBody = body;

    // verify required params are set

    // create path and map variables
    String path = "/api/Admin/token".replaceAll("{format}","json");

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
      return BaseResponse<UserView>.fromJson(json.decode(response.body));
    } else {
      return null;
    }
  }
  ///
  ///
  ///
  Future<BaseResponse<UserView>?> create({ Register? body }) async {
    Object? postBody = body;

    // verify required params are set

    // create path and map variables
    String path = "/api/Admin/create".replaceAll("{format}","json");

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
      return BaseResponse<UserView>.fromJson(json.decode(response.body));
    } else {
      return null;
    }
  }
  ///
  ///
  ///
  Future<BaseResponse<UserView>?> deleteUser(String email) async {
    Object? postBody = null;

    // verify required params are set
    if(email == null) {
     throw new ApiException(400, "Missing required param: email");
    }

    // create path and map variables
    String path = "/api/Admin/delete/{email}".replaceAll("{format}","json").replaceAll("{" + "email" + "}", email.toString());

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
      return BaseResponse<UserView>.fromJson(json.decode(response.body));
    } else {
      return null;
    }
  }
  ///
  ///
  ///
  Future<BaseResponse<UserViewPagedCollection>?> getUserById(int id) async {
    Object? postBody = null;

    // verify required params are set
    if(id == null) {
     throw new ApiException(400, "Missing required param: id");
    }

    // create path and map variables
    String path = "/api/Admin/user/get/{id}".replaceAll("{format}","json").replaceAll("{" + "id" + "}", id.toString());

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
      return BaseResponse<UserViewPagedCollection>.fromJson(json.decode(response.body));
    } else {
      return null;
    }
  }
  ///
  ///
  ///
  Future<BaseResponse<UserViewPagedCollection>?> listAdmins({ int? offset, int? limit, String? search }) async {
    Object? postBody = null;

    // verify required params are set

    // create path and map variables
    String path = "/api/Admin/list".replaceAll("{format}","json");

    // query params
    List<QueryParam> queryParams = [];
    Map<String, String> headerParams = {};
    Map<String, String> formParams = {};
    if(offset != null) {
      queryParams.addAll(_convertParametersForCollectionFormat("", "Offset", offset));
    }
    if(limit != null) {
      queryParams.addAll(_convertParametersForCollectionFormat("", "Limit", limit));
    }
    if(search != null) {
      queryParams.addAll(_convertParametersForCollectionFormat("", "search", search));
    }

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
          BaseResponse<UserViewPagedCollection>.fromJson(json.decode(response.body));
    } else {
      return null;
    }
  }
  ///
  ///
  ///
  Future<BaseResponse<LoanViewPagedCollection>?> listLoans({ int? offset, int? limit }) async {
    Object? postBody = null;

    // verify required params are set

    // create path and map variables
    String path = "/api/Admin/loans/list".replaceAll("{format}","json");

    // query params
    List<QueryParam> queryParams = [];
    Map<String, String> headerParams = {};
    Map<String, String> formParams = {};
    if(offset != null) {
      queryParams.addAll(_convertParametersForCollectionFormat("", "Offset", offset));
    }
    if(limit != null) {
      queryParams.addAll(_convertParametersForCollectionFormat("", "Limit", limit));
    }

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
      return BaseResponse<LoanViewPagedCollection>.fromJson(json.decode(response.body));
    } else {
      return null;
    }
  }
}
