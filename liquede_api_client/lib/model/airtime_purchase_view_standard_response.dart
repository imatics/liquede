part of swagger.api;

class AirtimePurchaseViewStandardResponse {

  String? href = null;

  List<String> relations = [];

  String method = "GET";

  String? routeName = null;

  Object? routeValues = null;

  bool? status = null;

  String? message = null;

  AirtimePurchaseView? data = null;

  String? statusCode = null;

  Object? errors = null;

  AirtimePurchaseViewStandardResponse();

  @override
  String toString() {
    return 'AirtimePurchaseViewStandardResponse[href=$href, relations=$relations, method=$method, routeName=$routeName, routeValues=$routeValues, status=$status, message=$message, data=$data, statusCode=$statusCode, errors=$errors, ]';
  }

  AirtimePurchaseViewStandardResponse.fromJson(Map<String, dynamic>? json) {
    if (json == null) return;
    href = json['href'];
    relations = (json['relations'] as List).map((item) => item as String).toList();
    method = json['method'];
    routeName = json['routeName'];
    status = json['status'];
    message = json['message'];
    data = new AirtimePurchaseView.fromJson(json['data']);
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

  static List<AirtimePurchaseViewStandardResponse> listFromJson(List<dynamic>? json) {
    return json == null ? [] : json.map((value) => new AirtimePurchaseViewStandardResponse.fromJson(value)).toList();
  }

  static Map<String, AirtimePurchaseViewStandardResponse> mapFromJson(Map<String, Map<String, dynamic>>? json) {
    var map = new Map<String, AirtimePurchaseViewStandardResponse>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new AirtimePurchaseViewStandardResponse.fromJson(value));
    }
    return map;
  }
}
