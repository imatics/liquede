part of swagger.api;

class LoanViewPagedCollectionStandardResponse {

  String? href = null;
  List<String> relations = [];
  String? method = "GET";
  String? routeName = null;
  Object? routeValues = null;
  bool? status = null;
  String? message = null;
  LoanViewPagedCollection? data = null;
  String? statusCode = null;
  Object? errors = null;

  LoanViewPagedCollectionStandardResponse();

  @override
  String toString() {
    return 'LoanViewPagedCollectionStandardResponse[href=$href, relations=$relations, method=$method, routeName=$routeName, routeValues=$routeValues, status=$status, message=$message, data=$data, statusCode=$statusCode, errors=$errors, ]';
  }

  LoanViewPagedCollectionStandardResponse.fromJson(Map<String, dynamic>? json) {
    if (json == null) return;
    href = json['href'];
    relations = (json['relations'] as List).map((item) => item as String).toList();
    method = json['method'];
    routeName = json['routeName'];
    // routeValues = new Object.fromJson(json['routeValues']);
    status = json['status'];
    message = json['message'];
    data = new LoanViewPagedCollection.fromJson(json['data']);
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

  static List<LoanViewPagedCollectionStandardResponse> listFromJson(List<dynamic>? json) {
    return json == null ? [] : json.map((value) => new LoanViewPagedCollectionStandardResponse.fromJson(value)).toList();
  }

  static Map<String, LoanViewPagedCollectionStandardResponse> mapFromJson(Map<String, Map<String, dynamic>>? json) {
    var map = new Map<String, LoanViewPagedCollectionStandardResponse>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new LoanViewPagedCollectionStandardResponse.fromJson(value));
    }
    return map;
  }
}
