part of swagger.api;

class RawOutputResponse {

  String? accountStatus = null;
  String? firstName = null;
  String? lastName = null;
  String? customerType = null;
  int? invoicePeriod = null;
  DateTime? dueDate = null;
  int? customerNumber = null;

  RawOutputResponse();

  @override
  String toString() {
    return 'RawOutputResponse[accountStatus=$accountStatus, firstName=$firstName, lastName=$lastName, customerType=$customerType, invoicePeriod=$invoicePeriod, dueDate=$dueDate, customerNumber=$customerNumber, ]';
  }

  RawOutputResponse.fromJson(Map<String, dynamic>? json) {
    if (json == null) return;
    accountStatus = json['accountStatus'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    customerType = json['customerType'];
    invoicePeriod = json['invoicePeriod'];
    dueDate = json['dueDate'] == null ? null : DateTime.parse(json['dueDate']);
    customerNumber = json['customerNumber'];
  }

  Map<String, dynamic> toJson() {
    return {
      'accountStatus': accountStatus,
      'firstName': firstName,
      'lastName': lastName,
      'customerType': customerType,
      'invoicePeriod': invoicePeriod,
      'dueDate': dueDate == null ? '' : dueDate!.toUtc().toIso8601String(),
      'customerNumber': customerNumber
     };
  }

  static List<RawOutputResponse> listFromJson(List<dynamic>? json) {
    return json == null ? [] : json.map((value) => new RawOutputResponse.fromJson(value)).toList();
  }

  static Map<String, RawOutputResponse> mapFromJson(Map<String, Map<String, dynamic>>? json) {
    var map = new Map<String, RawOutputResponse>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new RawOutputResponse.fromJson(value));
    }
    return map;
  }
}
