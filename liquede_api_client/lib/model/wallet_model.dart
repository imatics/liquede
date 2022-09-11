part of swagger.api;

class WalletModel {

  int? userId = null;
  String? balance = null;
  String? currency = null;
  int? walletTypeId = null;

  WalletModel();

  @override
  String toString() {
    return 'WalletModel[userId=$userId, balance=$balance, currency=$currency, walletTypeId=$walletTypeId, ]';
  }

  WalletModel.fromJson(Map<String, dynamic>? json) {
    if (json == null) return;
    userId = json['userId'];
    balance = json['balance'];
    currency = json['currency'];
    walletTypeId = json['walletTypeId'];
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'balance': balance,
      'currency': currency,
      'walletTypeId': walletTypeId
     };
  }

  static List<WalletModel> listFromJson(List<dynamic>? json) {
    return json == null ? [] : json.map((value) => new WalletModel.fromJson(value)).toList();
  }

  static Map<String, WalletModel> mapFromJson(Map<String, Map<String, dynamic>>? json) {
    var map = new Map<String, WalletModel>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new WalletModel.fromJson(value));
    }
    return map;
  }
}
