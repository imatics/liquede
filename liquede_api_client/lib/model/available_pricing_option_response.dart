part of swagger.api;

class AvailablePricingOptionResponse {

  int? monthsPaidFor = null;

  int? price = null;

  int? invoicePeriod = null;

  AvailablePricingOptionResponse();

  @override
  String toString() {
    return 'AvailablePricingOptionResponse[monthsPaidFor=$monthsPaidFor, price=$price, invoicePeriod=$invoicePeriod, ]';
  }

  AvailablePricingOptionResponse.fromJson(Map<String, dynamic>? json) {
    if (json == null) return;
    monthsPaidFor = json['monthsPaidFor'];
    price = json['price'];
    invoicePeriod = json['invoicePeriod'];
  }

  Map<String, dynamic> toJson() {
    return {
      'monthsPaidFor': monthsPaidFor,
      'price': price,
      'invoicePeriod': invoicePeriod
     };
  }

  static List<AvailablePricingOptionResponse> listFromJson(List<dynamic>? json) {
    return json == null ? [] : json.map((value) => new AvailablePricingOptionResponse.fromJson(value)).toList();
  }

  static Map<String, AvailablePricingOptionResponse> mapFromJson(Map<String, Map<String, dynamic>>? json) {
    var map = new Map<String, AvailablePricingOptionResponse>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new AvailablePricingOptionResponse.fromJson(value));
    }
    return map;
  }
}
