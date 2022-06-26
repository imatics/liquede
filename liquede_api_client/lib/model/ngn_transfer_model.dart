part of swagger.api;

class NGNTransferModel {

  String? accountBank = null;
  String? accountNumber = null;
  String? amount = null;
  String? narration = null;
  int? userId = null;

  NGNTransferModel();

  @override
  String toString() {
    return 'NGNTransferModel[accountBank=$accountBank, accountNumber=$accountNumber, amount=$amount, narration=$narration, userId=$userId, ]';
  }

  NGNTransferModel.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    accountBank = json['accountBank'];
    accountNumber = json['accountNumber'];
    amount = json['amount'];
    narration = json['narration'];
    userId = json['userId'];
  }

  Map<String, dynamic> toJson() {
    return {
      'accountBank': accountBank,
      'accountNumber': accountNumber,
      'amount': amount,
      'narration': narration,
      'userId': userId
     };
  }

  static List<NGNTransferModel> listFromJson(List<dynamic>? json) {
    return json == null ? [] : json.map((value) => new NGNTransferModel.fromJson(value)).toList();
  }

  static Map<String, NGNTransferModel> mapFromJson(Map<String, Map<String, dynamic>>? json) {
    var map = new Map<String, NGNTransferModel>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new NGNTransferModel.fromJson(value));
    }
    return map;
  }
}
