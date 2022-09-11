part of swagger.api;

class BaxiProvidersResponseStandardResponse {

  String? href = null;

  List<String> relations = [];

  String method = "GET";

  String? routeName = null;

  Object? routeValues = null;

  bool? status = null;

  String? message = null;

  BaxiProvidersResponse? data = null;

  String? statusCode = null;

  Object? errors = null;

  BaxiProvidersResponseStandardResponse();

  @override
  String toString() {
    return 'BaxiProvidersResponseStandardResponse[href=$href, relations=$relations, method=$method, routeName=$routeName, routeValues=$routeValues, status=$status, message=$message, data=$data, statusCode=$statusCode, errors=$errors, ]';
  }

  BaxiProvidersResponseStandardResponse.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    href = json['href'];
    relations = (json['relations'] as List).map((item) => item as String).toList();
    method = json['method'];
    routeName = json['routeName'];
    status = json['status'];
    message = json['message'];
    data = new BaxiProvidersResponse.fromJson(json['data']);
    statusCode = json['statusCode'];
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

  static List<BaxiProvidersResponseStandardResponse> listFromJson(List<dynamic>? json) {
    return json == null ? [] : json.map((value) => new BaxiProvidersResponseStandardResponse.fromJson(value)).toList();
  }

  static Map<String, BaxiProvidersResponseStandardResponse> mapFromJson(Map<String, Map<String, dynamic>>? json) {
    var map = new Map<String, BaxiProvidersResponseStandardResponse>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new BaxiProvidersResponseStandardResponse.fromJson(value));
    }
    return map;
  }
}
