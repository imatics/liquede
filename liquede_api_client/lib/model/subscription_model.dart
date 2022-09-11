part of swagger.api;

class SubscriptionModel {

  bool? isBoxOffice = null;
  String? totalAmount = null;
  String? productMonthsPaidFor = null;
  String? productCode = null;
  String? smartcardNumber = null;
  String? serviceType = null;

  SubscriptionModel();

  @override
  String toString() {
    return 'SubscriptionModel[isBoxOffice=$isBoxOffice, totalAmount=$totalAmount, productMonthsPaidFor=$productMonthsPaidFor, productCode=$productCode, smartcardNumber=$smartcardNumber, serviceType=$serviceType, ]';
  }

  SubscriptionModel.fromJson(Map<String, dynamic>? json) {
    if (json == null) return;
    isBoxOffice = json['isBoxOffice'];
    totalAmount = json['totalAmount'];
    productMonthsPaidFor = json['productMonthsPaidFor'];
    productCode = json['productCode'];
    smartcardNumber = json['smartcardNumber'];
    serviceType = json['serviceType'];
  }

  Map<String, dynamic> toJson() {
    return {
      'isBoxOffice': isBoxOffice,
      'totalAmount': totalAmount,
      'productMonthsPaidFor': productMonthsPaidFor,
      'productCode': productCode,
      'smartcardNumber': smartcardNumber,
      'serviceType': serviceType
     };
  }

  static List<SubscriptionModel> listFromJson(List<dynamic>? json) {
    return json == null ? [] : json.map((value) => new SubscriptionModel.fromJson(value)).toList();
  }

  static Map<String, SubscriptionModel> mapFromJson(Map<String, Map<String, dynamic>>? json) {
    var map = new Map<String, SubscriptionModel>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new SubscriptionModel.fromJson(value));
    }
    return map;
  }
}
