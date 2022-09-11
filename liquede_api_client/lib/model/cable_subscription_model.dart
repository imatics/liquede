part of swagger.api;

class CableSubscriptionModel {

  String? totalAmount = null;

  String? addonMonthsPaidFor = null;

  String? addonCode = null;

  String? productMonthsPaidFor = null;

  String? productCode = null;

  String? smartcardNumber = null;

  String? agentId = null;

  String? agentReference = null;

  String? serviceType = null;

  CableSubscriptionModel();

  @override
  String toString() {
    return 'CableSubscriptionModel[totalAmount=$totalAmount, addonMonthsPaidFor=$addonMonthsPaidFor, addonCode=$addonCode, productMonthsPaidFor=$productMonthsPaidFor, productCode=$productCode, smartcardNumber=$smartcardNumber, agentId=$agentId, agentReference=$agentReference, serviceType=$serviceType, ]';
  }

  CableSubscriptionModel.fromJson(Map<String, dynamic>? json) {
    if (json == null) return;
    totalAmount = json['totalAmount'];
    addonMonthsPaidFor = json['addonMonthsPaidFor'];
    addonCode = json['addonCode'];
    productMonthsPaidFor = json['productMonthsPaidFor'];
    productCode = json['productCode'];
    smartcardNumber = json['smartcardNumber'];
    agentId = json['agentId'];
    agentReference = json['agentReference'];
    serviceType = json['serviceType'];
  }

  Map<String, dynamic> toJson() {
    return {
      'totalAmount': totalAmount,
      'addonMonthsPaidFor': addonMonthsPaidFor,
      'addonCode': addonCode,
      'productMonthsPaidFor': productMonthsPaidFor,
      'productCode': productCode,
      'smartcardNumber': smartcardNumber,
      'agentId': agentId,
      'agentReference': agentReference,
      'serviceType': serviceType
     };
  }

  static List<CableSubscriptionModel> listFromJson(List<dynamic>? json) {
    return json == null ? [] : json.map((value) => new CableSubscriptionModel.fromJson(value)).toList();
  }

  static Map<String, CableSubscriptionModel> mapFromJson(Map<String, Map<String, dynamic>>? json) {
    var map = new Map<String, CableSubscriptionModel>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new CableSubscriptionModel.fromJson(value));
    }
    return map;
  }
}
