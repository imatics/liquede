part of swagger.api;

class DebitWalletModel {

  int? userId = null;

  String? amount = null;

  DebitWalletModel();

  @override
  String toString() {
    return 'DebitWalletModel[userId=$userId, amount=$amount, ]';
  }

  DebitWalletModel.fromJson(Map<String, dynamic>? json) {
    if (json == null) return;
    userId = json['userId'];
    amount = json['amount'];
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'amount': amount
     };
  }

  static List<DebitWalletModel> listFromJson(List<dynamic>? json) {
    return json == null ? [] : json.map((value) => new DebitWalletModel.fromJson(value)).toList();
  }

  static Map<String, DebitWalletModel> mapFromJson(Map<String, Map<String, dynamic>>? json) {
    var map = new Map<String, DebitWalletModel>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new DebitWalletModel.fromJson(value));
    }
    return map;
  }
}
