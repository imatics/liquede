part of swagger.api;

class SavingPlans {

  int? id = null;
  DateTime? dateCreated = null;
  DateTime? dateModified = null;
  String? name = null;
  String? description = null;
  int? savingPlanTypeId = null;
  SavingPlanType? savingPlanType = null;
  int? durationInDays = null;
  double? amount = null;
  double? interestRate = null;
  double? monthlyPayment = null;
  DateTime? maturityDate = null;
  String? paymentMethod = null;
  double? targetAmount = null;
  double? targetDate = null;
  int? debitFrequencyInDays = null;
  DateTime? preferredRecurringPaymentDate = null;
  DateTime? startDate = null;
  int? userId = null;
  User? user = null;
  int? statusId = null;
  Status? status = null;
  int? cardId = null;
  Card? card = null;

  String? paid = null;

  SavingPlans();

  @override
  String toString() {
    return 'SavingPlans[id=$id, dateCreated=$dateCreated, dateModified=$dateModified, name=$name, description=$description, savingPlanTypeId=$savingPlanTypeId, savingPlanType=$savingPlanType, durationInDays=$durationInDays, amount=$amount, interestRate=$interestRate, monthlyPayment=$monthlyPayment, maturityDate=$maturityDate, paymentMethod=$paymentMethod, targetAmount=$targetAmount, targetDate=$targetDate, debitFrequencyInDays=$debitFrequencyInDays, preferredRecurringPaymentDate=$preferredRecurringPaymentDate, startDate=$startDate, userId=$userId, user=$user, statusId=$statusId, status=$status, cardId=$cardId, card=$card, paid=$paid, ]';
  }

  SavingPlans.fromJson(Map<String, dynamic>? json) {
    if (json == null) return;
    id = json['id'];
    dateCreated = json['dateCreated'] == null ? null : DateTime.parse(json['dateCreated']);
    dateModified = json['dateModified'] == null ? null : DateTime.parse(json['dateModified']);
    name = json['name'];
    description = json['description'];
    savingPlanTypeId = json['savingPlanTypeId'];
    savingPlanType = new SavingPlanType.fromJson(json['savingPlanType']);
    durationInDays = json['durationInDays'];
    amount = json['amount'];
    interestRate = json['interestRate'];
    monthlyPayment = json['monthlyPayment'];
    maturityDate = json['maturityDate'] == null ? null : DateTime.parse(json['maturityDate']);
    paymentMethod = json['paymentMethod'];
    targetAmount = json['targetAmount'];
    targetDate = json['targetDate'];
    debitFrequencyInDays = json['debitFrequencyInDays'];
    preferredRecurringPaymentDate = json['preferredRecurringPaymentDate'] == null ? null : DateTime.parse(json['preferredRecurringPaymentDate']);
    startDate = json['startDate'] == null ? null : DateTime.parse(json['startDate']);
    userId = json['userId'];
    user = new User.fromJson(json['user']);
    statusId = json['statusId'];
    status = new Status.fromJson(json['status']);
    cardId = json['cardId'];
    card = new Card.fromJson(json['card']);
    paid = json['paid'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'dateCreated': dateCreated == null ? '' : dateCreated!.toUtc().toIso8601String(),
      'dateModified': dateModified == null ? '' : dateModified!.toUtc().toIso8601String(),
      'name': name,
      'description': description,
      'savingPlanTypeId': savingPlanTypeId,
      'savingPlanType': savingPlanType,
      'durationInDays': durationInDays,
      'amount': amount,
      'interestRate': interestRate,
      'monthlyPayment': monthlyPayment,
      'maturityDate': maturityDate == null ? '' : maturityDate!.toUtc().toIso8601String(),
      'paymentMethod': paymentMethod,
      'targetAmount': targetAmount,
      'targetDate': targetDate,
      'debitFrequencyInDays': debitFrequencyInDays,
      'preferredRecurringPaymentDate': preferredRecurringPaymentDate == null ? '' : preferredRecurringPaymentDate!.toUtc().toIso8601String(),
      'startDate': startDate == null ? '' : startDate!.toUtc().toIso8601String(),
      'userId': userId,
      'user': user,
      'statusId': statusId,
      'status': status,
      'cardId': cardId,
      'card': card,
      'paid': paid
     };
  }

  static List<SavingPlans> listFromJson(List<dynamic>? json) {
    return json == null ? [] : json.map((value) => new SavingPlans.fromJson(value)).toList();
  }

  static Map<String, SavingPlans> mapFromJson(Map<String, Map<String, dynamic>>? json) {
    var map = new Map<String, SavingPlans>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new SavingPlans.fromJson(value));
    }
    return map;
  }
}
