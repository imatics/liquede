part of swagger.api;

class DataBundlePurchaseInput {

  int? pin = null;

  String? amount = null;

  String? phoneNumber = null;

  String? serviceType = null;

  String? dataCode = null;

  DataBundlePurchaseInput();

  @override
  String toString() {
    return 'DataBundlePurchaseInput[pin=$pin, amount=$amount, phoneNumber=$phoneNumber, serviceType=$serviceType, dataCode=$dataCode, ]';
  }

  DataBundlePurchaseInput.fromJson(Map<String, dynamic>? json) {
    if (json == null) return;
    pin = json['pin'];
    amount = json['amount'];
    phoneNumber = json['phoneNumber'];
    serviceType = json['serviceType'];
    dataCode = json['dataCode'];
  }

  Map<String, dynamic> toJson() {
    return {
      'pin': pin,
      'amount': amount,
      'phoneNumber': phoneNumber,
      'serviceType': serviceType,
      'dataCode': dataCode
     };
  }

  static List<DataBundlePurchaseInput> listFromJson(List<dynamic>? json) {
    return json == null ? [] : json.map((value) => new DataBundlePurchaseInput.fromJson(value)).toList();
  }

  static Map<String, DataBundlePurchaseInput> mapFromJson(Map<String, Map<String, dynamic>>? json) {
    var map = new Map<String, DataBundlePurchaseInput>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new DataBundlePurchaseInput.fromJson(value));
    }
    return map;
  }
}
