part of swagger.api;

class PaymentView {

  String? status = null;
  Wallet? wallet = null;
  Transaction? transaction = null;
  String? message = null;

  PaymentView();

  @override
  String toString() {
    return 'PaymentView[status=$status, wallet=$wallet, transaction=$transaction, message=$message, ]';
  }

  PaymentView.fromJson(Map<String, dynamic>? json) {
    if (json == null) return;
    status = json['status'];
    wallet = new Wallet.fromJson(json['wallet']);
    transaction = new Transaction.fromJson(json['transaction']);
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'wallet': wallet,
      'transaction': transaction,
      'message': message
     };
  }

  static List<PaymentView> listFromJson(List<dynamic>? json) {
    return json == null ? [] : json.map((value) => new PaymentView.fromJson(value)).toList();
  }

  static Map<String, PaymentView> mapFromJson(Map<String, Map<String, dynamic>>? json) {
    var map = new Map<String, PaymentView>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new PaymentView.fromJson(value));
    }
    return map;
  }
}
