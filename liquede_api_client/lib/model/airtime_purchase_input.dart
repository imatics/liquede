part of swagger.api;

class AirtimePurchaseInput {

  int? pin = null;

  String? amount = null;

  String? phoneNumber = null;

  String? serviceType = null;

  AirtimePurchaseInput();

  @override
  String toString() {
    return 'AirtimePurchaseInput[pin=$pin, amount=$amount, phoneNumber=$phoneNumber, serviceType=$serviceType, ]';
  }

  AirtimePurchaseInput.fromJson(Map<String, dynamic>? json) {
    if (json == null) return;
    pin = json['pin'];
    amount = json['amount'];
    phoneNumber = json['phoneNumber'];
    serviceType = json['serviceType'];
  }

  Map<String, dynamic> toJson() {
    return {
      'pin': pin,
      'amount': amount,
      'phoneNumber': phoneNumber,
      'serviceType': serviceType
     };
  }

  static List<AirtimePurchaseInput> listFromJson(List<dynamic>? json) {
    return json == null ?  [] : json.map((value) => new AirtimePurchaseInput.fromJson(value)).toList();
  }

  static Map<String, AirtimePurchaseInput> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, AirtimePurchaseInput>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new AirtimePurchaseInput.fromJson(value));
    }
    return map;
  }
}
