part of swagger.api;

class LoanModel {

  String? amount = null;
  int? loanTermInMonth = null;
  int? loanTypeId = null;
  String? companyName = null;
  String? reason = null;
  String? documentReference = null;

  LoanModel();

  @override
  String toString() {
    return 'LoanModel[amount=$amount, loanTermInMonth=$loanTermInMonth, loanTypeId=$loanTypeId, companyName=$companyName, reason=$reason, documentReference=$documentReference, ]';
  }

  LoanModel.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    amount = json['amount'];
    loanTermInMonth = json['loanTermInMonth'];
    loanTypeId = json['loanTypeId'];
    companyName = json['companyName'];
    reason = json['reason'];
    documentReference = json['documentReference'];
  }

  Map<String, dynamic> toJson() {
    return {
      'amount': amount,
      'loanTermInMonth': loanTermInMonth,
      'loanTypeId': loanTypeId,
      'companyName': companyName,
      'reason': reason,
      'documentReference': documentReference
     };
  }

  static List<LoanModel> listFromJson(List<dynamic>? json) {
    return json == null ? [] : json.map((value) => new LoanModel.fromJson(value)).toList();
  }

  static Map<String, LoanModel> mapFromJson(Map<String, Map<String, dynamic>>? json) {
    var map = new Map<String, LoanModel>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new LoanModel.fromJson(value));
    }
    return map;
  }
}
