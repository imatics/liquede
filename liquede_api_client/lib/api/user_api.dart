part of swagger.api;



class UserApi {

  UserApi();

  ///
  ///
  ///
  Future<BaseResponse<UserView>?> completeReset({required PasswordReset body}) async {
    Object postBody = body;

    // verify required params are set

    // create path and map variables
    String path = "/api/User/reset/complete".replaceAll("{format}","json");

    // query params
    List<QueryParam> queryParams = [];
    Map<String, String> headerParams = {};
    Map<String, String> formParams = {};

    List<String> contentTypes = ["application/json-patch+json","application/json","text/json","application/_*+json"];

    String contentType = contentTypes.length > 0 ? contentTypes[0] : "application/json";
    List<String> authNames = ["Bearer"];

    if(contentType.startsWith("multipart/form-data")) {
      bool hasFields = false;
      // // MultipartRequest mp = new MultipartRequest(null, null);
      // if(hasFields)
        // // postBody = mp;
    }
    else {
          }

    var response = await defaultApiClient.invokeAPI(path,
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
  Future<BaseResponse<UserView>?> delete(String email) async {
    Object? postBody = null;

    // verify required params are set
    if(email == null) {
     throw new ApiException(400, "Missing required param: email");
    }

    // create path and map variables
    String path = "/api/User/delete/{email}".replaceAll("{format}","json").replaceAll("{" + "email" + "}", email.toString());

    // query params
    List<QueryParam> queryParams = [];
    Map<String, String> headerParams = {};
    Map<String, String> formParams = {};

    List<String> contentTypes = [];

    String contentType = contentTypes.length > 0 ? contentTypes[0] : "application/json";
    List<String> authNames = ["Bearer"];

    if(contentType.startsWith("multipart/form-data")) {
      bool hasFields = false;
      // // MultipartRequest mp = new MultipartRequest(null, null);
      // if(hasFields)
        // // postBody = mp;
    }
    else {
          }

    var response = await defaultApiClient.invokeAPI(path,
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
  Future<BaseResponse<UserView>?> getUser() async {
    Object? postBody = null;

    // verify required params are set

    // create path and map variables
    String path = "/api/User/getbyid".replaceAll("{format}","json");

    // query params
    List<QueryParam> queryParams = [];
    Map<String, String> headerParams = {};
    Map<String, String> formParams = {};

    List<String> contentTypes = [];

    String contentType = contentTypes.length > 0 ? contentTypes[0] : "application/json";
    List<String> authNames = ["Bearer"];

    if(contentType.startsWith("multipart/form-data")) {
      bool hasFields = false;
      // // MultipartRequest mp = new MultipartRequest(null, null);
      // if(hasFields)
        // // postBody = mp;
    }
    else {
          }

    var response = await defaultApiClient.invokeAPI(path,
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
  Future<BaseResponse<UserView>?> initiateReset(String email) async {
    Object? postBody = null;

    // verify required params are set
    if(email == null) {
     throw new ApiException(400, "Missing required param: email");
    }

    // create path and map variables
    String path = "/api/User/reset/initiate/{email}".replaceAll("{format}","json").replaceAll("{" + "email" + "}", email.toString());

    // query params
    List<QueryParam> queryParams = [];
    Map<String, String> headerParams = {};
    Map<String, String> formParams = {};

    List<String> contentTypes = [];

    String contentType = contentTypes.length > 0 ? contentTypes[0] : "application/json";
    List<String> authNames = ["Bearer"];

    if(contentType.startsWith("multipart/form-data")) {
      bool hasFields = false;
      // // MultipartRequest mp = new MultipartRequest(null, null);
      // if(hasFields)
        // // postBody = mp;
    }
    else {
          }

    var response = await defaultApiClient.invokeAPI(path,
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
  Future<BaseResponse<UserViewPagedCollection>?> listUsers({ required int offset, required int limit }) async {
    Object? postBody = null;

    // verify required params are set

    // create path and map variables
    String path = "/api/User/list".replaceAll("{format}","json");

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
      // // MultipartRequest mp = new MultipartRequest(null, null);
      // if(hasFields)
        // postBody = mp;
    }
    else {
          }

    var response = await defaultApiClient.invokeAPI(path,
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
  Future<BaseResponse<UserView>?> login({ required LoginModel body }) async {
    Object postBody = body;

    // verify required params are set

    // create path and map variables
    String path = "/api/User/token".replaceAll("{format}","json");

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
        // postBody = mp;
    }
    else {
          }

    var response = await defaultApiClient.invokeAPI(path,
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
  Future<BaseResponse<UserView>?> register({ required Register body }) async {
    Object postBody = body;

    // verify required params are set

    // create path and map variables
    String path = "/api/User/register".replaceAll("{format}","json");

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
        // postBody = mp;
    }
    else {
          }

    var response = await defaultApiClient.invokeAPI(path,
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
  Future<BaseResponse<List<UserView>>?> searchUsers(String search) async {
    Object? postBody = null;

    // verify required params are set
    if(search == null) {
     throw new ApiException(400, "Missing required param: search");
    }

    // create path and map variables
    String path = "/api/User/search/{search}".replaceAll("{format}","json").replaceAll("{" + "search" + "}", search.toString());

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
        // postBody = mp;
    }
    else {
          }

    var response = await defaultApiClient.invokeAPI(path,
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
      return BaseResponse<List<UserView>>.fromJson(json.decode(response.body));
    } else {
      return null;
    }
  }
  ///
  ///
  ///
  Future<BaseResponse<UserView>?> updatePassword({ required PasswordResetModel body }) async {
    Object postBody = body;

    // verify required params are set

    // create path and map variables
    String path = "/api/User/password/update".replaceAll("{format}","json");

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
      // // if(hasFields)
        // postBody = mp;
    }
    else {
          }

    var response = await defaultApiClient.invokeAPI(path,
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
  Future<BaseResponse<UserView>?> updateUser({ required UpdateUserModel body }) async {
    Object postBody = body;

    // verify required params are set

    // create path and map variables
    String path = "/api/User/update".replaceAll("{format}","json");

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
        // postBody = mp;
    }
    else {
          }

    var response = await defaultApiClient.invokeAPI(path,
                                             'PUT',
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
  Future<BaseResponse<UserView>?> verify(String token, String email) async {
    Object? postBody = null;

    // verify required params are set
    if(token == null) {
     throw new ApiException(400, "Missing required param: token");
    }
    if(email == null) {
     throw new ApiException(400, "Missing required param: email");
    }

    // create path and map variables
    String path = "/api/User/verifyUser/{token}/{email}".replaceAll("{format}","json").replaceAll("{" + "token" + "}", token.toString()).replaceAll("{" + "email" + "}", email.toString());

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
        // postBody = mp;
    }
    else {
          }

    var response = await defaultApiClient.invokeAPI(path,
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
}
