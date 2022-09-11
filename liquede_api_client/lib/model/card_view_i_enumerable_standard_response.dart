part of swagger.api;

class CardViewIEnumerableStandardResponse {

  String? href = null;

  List<String> relations = [];

  String method = "GET";

  String? routeName = null;

  Object? routeValues = null;

  bool? status = null;

  String? message = null;

  List<CardView> data = [];

  String? statusCode = null;

  Object? errors = null;

  CardViewIEnumerableStandardResponse();

  @override
  String toString() {
    return 'CardViewIEnumerableStandardResponse[href=$href, relations=$relations, method=$method, routeName=$routeName, routeValues=$routeValues, status=$status, message=$message, data=$data, statusCode=$statusCode, errors=$errors, ]';
  }

  CardViewIEnumerableStandardResponse.fromJson(Map<String, dynamic>? json) {
    if (json == null) return;
    href = json['href'];
    relations = (json['relations'] as List).map((item) => item as String).toList();
    method = json['method'];
    routeName = json['routeName'];
    status = json['status'];
    message = json['message'];
    data = CardView.listFromJson(json['data']);
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

  static List<CardViewIEnumerableStandardResponse> listFromJson(List<dynamic>? json) {
    return json == null ? [] : json.map((value) => new CardViewIEnumerableStandardResponse.fromJson(value)).toList();
  }

  static Map<String, CardViewIEnumerableStandardResponse> mapFromJson(Map<String, Map<String, dynamic>>? json) {
    var map = new Map<String, CardViewIEnumerableStandardResponse>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new CardViewIEnumerableStandardResponse.fromJson(value));
    }
    return map;
  }
}
