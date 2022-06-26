part of swagger.api;

class Int32StandardResponse {

  String? href = null;
  List<String>? relations = [];
  String? method = "GET";
  String? routeName = null;
  Object? routeValues = null;
  bool? status = null;
  String? message = null;
  int? data = null;
  String? statusCode = null;
  Object? errors = null;

  Int32StandardResponse();

  @override
  String toString() {
    return 'Int32StandardResponse[href=$href, relations=$relations, method=$method, routeName=$routeName, routeValues=$routeValues, status=$status, message=$message, data=$data, statusCode=$statusCode, errors=$errors, ]';
  }

  Int32StandardResponse.fromJson(Map<String, dynamic>? json) {
    if (json == null) return;
    href = json['href'];
    relations = (json['relations'] as List).map((item) => item as String).toList();
    method = json['method'];
    routeName = json['routeName'];
    // routeValues = new Object.fromJson(json['routeValues']);
    status = json['status'];
    message = json['message'];
    data = json['data'];
    statusCode = json['statusCode'];
    // errors = new Object.fromJson(json['errors']);
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

  static List<Int32StandardResponse> listFromJson(List<dynamic>? json) {
    return json == null ? [] : json.map((value) => new Int32StandardResponse.fromJson(value)).toList();
  }

  static Map<String, Int32StandardResponse> mapFromJson(Map<String, Map<String, dynamic>>? json) {
    var map = new Map<String, Int32StandardResponse>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new Int32StandardResponse.fromJson(value));
    }
    return map;
  }
}
