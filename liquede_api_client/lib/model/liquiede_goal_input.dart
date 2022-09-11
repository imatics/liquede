part of swagger.api;

class LiquiedeGoalInput {

  String? name = null;
  String? description = null;
  int? savingPlanTypeId = null;
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
  int? cardId = null;
  bool? paid = null;

  LiquiedeGoalInput();

  @override
  String toString() {
    return 'LiquiedeGoalInput[name=$name, description=$description, savingPlanTypeId=$savingPlanTypeId, durationInDays=$durationInDays, amount=$amount, interestRate=$interestRate, monthlyPayment=$monthlyPayment, maturityDate=$maturityDate, paymentMethod=$paymentMethod, targetAmount=$targetAmount, targetDate=$targetDate, debitFrequencyInDays=$debitFrequencyInDays, preferredRecurringPaymentDate=$preferredRecurringPaymentDate, startDate=$startDate, cardId=$cardId, paid=$paid, ]';
  }

  LiquiedeGoalInput.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    name = json['name'];
    description = json['description'];
    savingPlanTypeId = json['savingPlanTypeId'];
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
    cardId = json['cardId'];
    paid = json['paid'];
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'savingPlanTypeId': savingPlanTypeId,
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
      'cardId': cardId,
      'paid': paid
     };
  }

  static List<LiquiedeGoalInput> listFromJson(List<dynamic>? json) {
    return json == null ? [] : json.map((value) => new LiquiedeGoalInput.fromJson(value)).toList();
  }

  static Map<String, LiquiedeGoalInput> mapFromJson(Map<String, Map<String, dynamic>>? json) {
    var map = new Map<String, LiquiedeGoalInput>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new LiquiedeGoalInput.fromJson(value));
    }
    return map;
  }
}
