part of swagger.api;

class TransactionView {
  
  int userId = null;

  String transactionReference = null;

  int paymentLogId = null;

  String status = null;

  String amount = null;

  String description = null;

  String title = null;

  DateTime dateCreated = null;

  TransactionView();

  @override
  String toString() {
    return 'TransactionView[userId=$userId, transactionReference=$transactionReference, paymentLogId=$paymentLogId, status=$status, amount=$amount, description=$description, title=$title, dateCreated=$dateCreated, ]';
  }

  TransactionView.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    userId = json['userId'];
    transactionReference = json['transactionReference'];
    paymentLogId = json['paymentLogId'];
    status = json['status'];
    amount = json['amount'];
    description = json['description'];
    title = json['title'];
    dateCreated = json['dateCreated'] == null ? null : DateTime.parse(json['dateCreated']);
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'transactionReference': transactionReference,
      'paymentLogId': paymentLogId,
      'status': status,
      'amount': amount,
      'description': description,
      'title': title,
      'dateCreated': dateCreated == null ? '' : dateCreated.toUtc().toIso8601String()
     };
  }

  static List<TransactionView> listFromJson(List<dynamic> json) {
    return json == null ? new List<TransactionView>() : json.map((value) => new TransactionView.fromJson(value)).toList();
  }

  static Map<String, TransactionView> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, TransactionView>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new TransactionView.fromJson(value));
    }
    return map;
  }
}
