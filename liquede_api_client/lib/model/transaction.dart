part of swagger.api;

class Transaction {

  int? id = null;
  DateTime? dateCreated = null;
  DateTime? dateModified = null;
  int? userId = null;
  User? user = null;
  String? transactionReference = null;
  int? paymentLogId = null;
  PaymentLog? paymentLog = null;
  int? statusId = null;
  Status? status = null;
  String? amount = null;
  String? description = null;
  String? title = null;
  int? flutterwaveId = null;
  int? savingPlansId = null;

  SavingPlans? plan = null;

  Transaction();

  @override
  String toString() {
    return 'Transaction[id=$id, dateCreated=$dateCreated, dateModified=$dateModified, userId=$userId, user=$user, transactionReference=$transactionReference, paymentLogId=$paymentLogId, paymentLog=$paymentLog, statusId=$statusId, status=$status, amount=$amount, description=$description, title=$title, flutterwaveId=$flutterwaveId, savingPlansId=$savingPlansId, plan=$plan, ]';
  }

  Transaction.fromJson(Map<String, dynamic>? json) {
    if (json == null) return;
    id = json['id'];
    dateCreated = json['dateCreated'] == null ? null : DateTime.parse(json['dateCreated']);
    dateModified = json['dateModified'] == null ? null : DateTime.parse(json['dateModified']);
    userId = json['userId'];
    user = new User.fromJson(json['user']);
    transactionReference = json['transactionReference'];
    paymentLogId = json['paymentLogId'];
    paymentLog = new PaymentLog.fromJson(json['paymentLog']);
    statusId = json['statusId'];
    status = new Status.fromJson(json['status']);
    amount = json['amount'];
    description = json['description'];
    title = json['title'];
    flutterwaveId = json['flutterwaveId'];
    savingPlansId = json['savingPlansId'];
    plan = new SavingPlans.fromJson(json['plan']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'dateCreated': dateCreated == null ? '' : dateCreated!.toUtc().toIso8601String(),
      'dateModified': dateModified == null ? '' : dateModified!.toUtc().toIso8601String(),
      'userId': userId,
      'user': user,
      'transactionReference': transactionReference,
      'paymentLogId': paymentLogId,
      'paymentLog': paymentLog,
      'statusId': statusId,
      'status': status,
      'amount': amount,
      'description': description,
      'title': title,
      'flutterwaveId': flutterwaveId,
      'savingPlansId': savingPlansId,
      'plan': plan
     };
  }

  static List<Transaction> listFromJson(List<dynamic>? json) {
    return json == null ? [] : json.map((value) => new Transaction.fromJson(value)).toList();
  }

  static Map<String, Transaction> mapFromJson(Map<String, Map<String, dynamic>>? json) {
    var map = new Map<String, Transaction>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new Transaction.fromJson(value));
    }
    return map;
  }
}
