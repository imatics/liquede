part of swagger.api;

class WalletView {

  int? userId = null;
  String? balance = null;
  String? currency = null;
  String? walletType = null;

  WalletView();

  @override
  String toString() {
    return 'WalletView[userId=$userId, balance=$balance, currency=$currency, walletType=$walletType, ]';
  }

  WalletView.fromJson(Map<String, dynamic>? json) {
    if (json == null) return;
    userId = json['userId'];
    balance = json['balance'];
    currency = json['currency'];
    walletType = json['walletType'];
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'balance': balance,
      'currency': currency,
      'walletType': walletType
     };
  }

  static List<WalletView> listFromJson(List<dynamic>? json) {
    return json == null ? [] : json.map((value) => new WalletView.fromJson(value)).toList();
  }

  static Map<String, WalletView> mapFromJson(Map<String, Map<String, dynamic>>? json) {
    var map = new Map<String, WalletView>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new WalletView.fromJson(value));
    }
    return map;
  }
}
