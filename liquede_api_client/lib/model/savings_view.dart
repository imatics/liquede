part of swagger.api;

class SavingsView {

  String? name = null;
  String? description = null;
  String? savingPlanType = null;
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
  UserView? user = null;
  String? status = null;

  SavingsView();

  @override
  String toString() {
    return 'SavingsView[name=$name, description=$description, savingPlanType=$savingPlanType, durationInDays=$durationInDays, amount=$amount, interestRate=$interestRate, monthlyPayment=$monthlyPayment, maturityDate=$maturityDate, paymentMethod=$paymentMethod, targetAmount=$targetAmount, targetDate=$targetDate, debitFrequencyInDays=$debitFrequencyInDays, preferredRecurringPaymentDate=$preferredRecurringPaymentDate, startDate=$startDate, user=$user, status=$status, ]';
  }

  SavingsView.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    name = json['name'];
    description = json['description'];
    savingPlanType = json['savingPlanType'];
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
    user = new UserView.fromJson(json['user']);
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
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
      'user': user,
      'status': status
     };
  }

  static List<SavingsView> listFromJson(List<dynamic>? json) {
    return json == null ? [] : json.map((value) => new SavingsView.fromJson(value)).toList();
  }

  static Map<String, SavingsView> mapFromJson(Map<String, Map<String, dynamic>>? json) {
    var map = new Map<String, SavingsView>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new SavingsView.fromJson(value));
    }
    return map;
  }
}
