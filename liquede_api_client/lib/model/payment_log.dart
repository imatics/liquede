part of swagger.api;

class PaymentLog {
  
  int id = null;

  DateTime dateCreated = null;

  DateTime dateModified = null;

  int flutterWavePaymentId = null;

  String transactionReference = null;

  String flutterWaveReference = null;

  String deviceFingerPrint = null;

  String amount = null;

  String currency = null;

  String chargedAmount = null;

  String appFee = null;

  String merchantFee = null;

  String processorResponse = null;

  String authModel = null;

  String ip = null;

  String narration = null;

  String status = null;

  String paymentType = null;

  int accountId = null;

  int amountSettled = null;

  DateTime createdAt = null;

  int cardId = null;

  Card card = null;

  PaymentLog();

  @override
  String toString() {
    return 'PaymentLog[id=$id, dateCreated=$dateCreated, dateModified=$dateModified, flutterWavePaymentId=$flutterWavePaymentId, transactionReference=$transactionReference, flutterWaveReference=$flutterWaveReference, deviceFingerPrint=$deviceFingerPrint, amount=$amount, currency=$currency, chargedAmount=$chargedAmount, appFee=$appFee, merchantFee=$merchantFee, processorResponse=$processorResponse, authModel=$authModel, ip=$ip, narration=$narration, status=$status, paymentType=$paymentType, accountId=$accountId, amountSettled=$amountSettled, createdAt=$createdAt, cardId=$cardId, card=$card, ]';
  }

  PaymentLog.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id = json['id'];
    dateCreated = json['dateCreated'] == null ? null : DateTime.parse(json['dateCreated']);
    dateModified = json['dateModified'] == null ? null : DateTime.parse(json['dateModified']);
    flutterWavePaymentId = json['flutterWavePaymentId'];
    transactionReference = json['transactionReference'];
    flutterWaveReference = json['flutterWaveReference'];
    deviceFingerPrint = json['deviceFingerPrint'];
    amount = json['amount'];
    currency = json['currency'];
    chargedAmount = json['chargedAmount'];
    appFee = json['appFee'];
    merchantFee = json['merchantFee'];
    processorResponse = json['processorResponse'];
    authModel = json['authModel'];
    ip = json['ip'];
    narration = json['narration'];
    status = json['status'];
    paymentType = json['paymentType'];
    accountId = json['accountId'];
    amountSettled = json['amountSettled'];
    createdAt = json['createdAt'] == null ? null : DateTime.parse(json['createdAt']);
    cardId = json['cardId'];
    card = new Card.fromJson(json['card']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'dateCreated': dateCreated == null ? '' : dateCreated.toUtc().toIso8601String(),
      'dateModified': dateModified == null ? '' : dateModified.toUtc().toIso8601String(),
      'flutterWavePaymentId': flutterWavePaymentId,
      'transactionReference': transactionReference,
      'flutterWaveReference': flutterWaveReference,
      'deviceFingerPrint': deviceFingerPrint,
      'amount': amount,
      'currency': currency,
      'chargedAmount': chargedAmount,
      'appFee': appFee,
      'merchantFee': merchantFee,
      'processorResponse': processorResponse,
      'authModel': authModel,
      'ip': ip,
      'narration': narration,
      'status': status,
      'paymentType': paymentType,
      'accountId': accountId,
      'amountSettled': amountSettled,
      'createdAt': createdAt == null ? '' : createdAt.toUtc().toIso8601String(),
      'cardId': cardId,
      'card': card
     };
  }

  static List<PaymentLog> listFromJson(List<dynamic> json) {
    return json == null ? new List<PaymentLog>() : json.map((value) => new PaymentLog.fromJson(value)).toList();
  }

  static Map<String, PaymentLog> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, PaymentLog>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new PaymentLog.fromJson(value));
    }
    return map;
  }
}
