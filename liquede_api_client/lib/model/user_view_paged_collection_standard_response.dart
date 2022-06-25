part of swagger.api;

class UserViewPagedCollectionStandardResponse {
  
  String href = null;

  List<String> relations = [];

  String method = "GET";

  String routeName = null;

  Object routeValues = null;

  bool status = null;

  String message = null;

  UserViewPagedCollection data = null;

  String statusCode = null;

  Object errors = null;

  UserViewPagedCollectionStandardResponse();

  @override
  String toString() {
    return 'UserViewPagedCollectionStandardResponse[href=$href, relations=$relations, method=$method, routeName=$routeName, routeValues=$routeValues, status=$status, message=$message, data=$data, statusCode=$statusCode, errors=$errors, ]';
  }

  UserViewPagedCollectionStandardResponse.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    href = json['href'];
    relations = (json['relations'] as List).map((item) => item as String).toList();
    method = json['method'];
    routeName = json['routeName'];
    routeValues = new Object.fromJson(json['routeValues']);
    status = json['status'];
    message = json['message'];
    data = new UserViewPagedCollection.fromJson(json['data']);
    statusCode = json['statusCode'];
    errors = new Object.fromJson(json['errors']);
  }

  Map<String, dynamic> toJson() {
    return {
      'href': href,
      'relations': relations,
      'method': method,
      'routeName': routeName,
      'routeValues': routeValues,
      'status': status,
      'message': message,
      'data': data,
      'statusCode': statusCode,
      'errors': errors
     };
  }

  static List<UserViewPagedCollectionStandardResponse> listFromJson(List<dynamic> json) {
    return json == null ? new List<UserViewPagedCollectionStandardResponse>() : json.map((value) => new UserViewPagedCollectionStandardResponse.fromJson(value)).toList();
  }

  static Map<String, UserViewPagedCollectionStandardResponse> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, UserViewPagedCollectionStandardResponse>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new UserViewPagedCollectionStandardResponse.fromJson(value));
    }
    return map;
  }
}
