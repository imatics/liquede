part of swagger.api;

class UserViewStandardResponse {
  
  String href = null;

  List<String> relations = [];

  String method = "GET";

  String routeName = null;

  Object routeValues = null;

  bool status = null;

  String message = null;

  UserView data = null;

  String statusCode = null;

  Object errors = null;

  UserViewStandardResponse();

  @override
  String toString() {
    return 'UserViewStandardResponse[href=$href, relations=$relations, method=$method, routeName=$routeName, routeValues=$routeValues, status=$status, message=$message, data=$data, statusCode=$statusCode, errors=$errors, ]';
  }

  UserViewStandardResponse.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    href = json['href'];
    relations = (json['relations'] as List).map((item) => item as String).toList();
    method = json['method'];
    routeName = json['routeName'];
    routeValues = new Object.fromJson(json['routeValues']);
    status = json['status'];
    message = json['message'];
    data = new UserView.fromJson(json['data']);
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

  static List<UserViewStandardResponse> listFromJson(List<dynamic> json) {
    return json == null ? new List<UserViewStandardResponse>() : json.map((value) => new UserViewStandardResponse.fromJson(value)).toList();
  }

  static Map<String, UserViewStandardResponse> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, UserViewStandardResponse>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new UserViewStandardResponse.fromJson(value));
    }
    return map;
  }
}
