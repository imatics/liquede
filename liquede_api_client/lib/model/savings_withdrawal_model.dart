part of swagger.api;

class SavingsWithdrawalModel {

  String? amount = null;
  int? planId = null;

  SavingsWithdrawalModel();

  @override
  String toString() {
    return 'SavingsWithdrawalModel[amount=$amount, planId=$planId, ]';
  }

  SavingsWithdrawalModel.fromJson(Map<String, dynamic>? json) {
    if (json == null) return;
    amount = json['amount'];
    planId = json['planId'];
  }

  Map<String, dynamic> toJson() {
    return {
      'amount': amount,
      'planId': planId
     };
  }

  static List<SavingsWithdrawalModel> listFromJson(List<dynamic>? json) {
    return json == null ? [] : json.map((value) => new SavingsWithdrawalModel.fromJson(value)).toList();
  }

  static Map<String, SavingsWithdrawalModel> mapFromJson(Map<String, Map<String, dynamic>>? json) {
    var map = new Map<String, SavingsWithdrawalModel>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new SavingsWithdrawalModel.fromJson(value));
    }
    return map;
  }
}
