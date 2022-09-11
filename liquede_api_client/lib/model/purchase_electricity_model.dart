part of swagger.api;

class PurchaseElectricityModel {

  String? phone = null;
  int? amount = null;
  String? accountNumber = null;
  PurchaseElectricityModel();

  @override
  String toString() {
    return 'PurchaseElectricityModel[phone=$phone, amount=$amount, accountNumber=$accountNumber, ]';
  }

  PurchaseElectricityModel.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    phone = json['phone'];
    amount = json['amount'];
    accountNumber = json['account_number'];
  }

  Map<String, dynamic> toJson() {
    return {
      'phone': phone,
      'amount': amount,
      'account_number': accountNumber
     };
  }

  static List<PurchaseElectricityModel> listFromJson(List<dynamic> json) {
    return json == null ? [] : json.map((value) => new PurchaseElectricityModel.fromJson(value)).toList();
  }

  static Map<String, PurchaseElectricityModel> mapFromJson(Map<String, Map<String, dynamic>>? json) {
    var map = new Map<String, PurchaseElectricityModel>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new PurchaseElectricityModel.fromJson(value));
    }
    return map;
  }
}
