part of swagger.api;

class FundWalletModel {

  String? amount = null;
  int? userId = null;

  FundWalletModel();

  @override
  String toString() {
    return 'FundWalletModel[amount=$amount, userId=$userId, ]';
  }

  FundWalletModel.fromJson(Map<String, dynamic>? json) {
    if (json == null) return;
    amount = json['amount'];
    userId = json['userId'];
  }

  Map<String, dynamic> toJson() {
    return {
      'amount': amount,
      'userId': userId
     };
  }

  static List<FundWalletModel> listFromJson(List<dynamic>? json) {
    return json == null ? [] : json.map((value) => new FundWalletModel.fromJson(value)).toList();
  }

  static Map<String, FundWalletModel> mapFromJson(Map<String, Map<String, dynamic>>? json) {
    var map = new Map<String, FundWalletModel>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new FundWalletModel.fromJson(value));
    }
    return map;
  }
}
