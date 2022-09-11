part of swagger.api;

class LoanView {

  int? userId = null;
  UserView? user = null;
  String? amount = null;
  int? loanTermInMonth = null;
  int? loanTypeId = null;
  String? loanType = null;
  String? companyName = null;
  String? reason = null;
  String? documentReference = null;
  String? status = null;

  LoanView();

  @override
  String toString() {
    return 'LoanView[userId=$userId, user=$user, amount=$amount, loanTermInMonth=$loanTermInMonth, loanTypeId=$loanTypeId, loanType=$loanType, companyName=$companyName, reason=$reason, documentReference=$documentReference, status=$status, ]';
  }

  LoanView.fromJson(Map<String, dynamic>? json) {
    if (json == null) return;
    userId = json['userId'];
    user = new UserView.fromJson(json['user']);
    amount = json['amount'];
    loanTermInMonth = json['loanTermInMonth'];
    loanTypeId = json['loanTypeId'];
    loanType = json['loanType'];
    companyName = json['companyName'];
    reason = json['reason'];
    documentReference = json['documentReference'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'user': user,
      'amount': amount,
      'loanTermInMonth': loanTermInMonth,
      'loanTypeId': loanTypeId,
      'loanType': loanType,
      'companyName': companyName,
      'reason': reason,
      'documentReference': documentReference,
      'status': status
     };
  }

  static List<LoanView> listFromJson(List<dynamic>? json) {
    return json == null ? [] : json.map((value) => new LoanView.fromJson(value)).toList();
  }

  static Map<String, LoanView> mapFromJson(Map<String, Map<String, dynamic>>? json) {
    var map = new Map<String, LoanView>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new LoanView.fromJson(value));
    }
    return map;
  }
}
