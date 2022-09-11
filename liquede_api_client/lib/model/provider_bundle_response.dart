part of swagger.api;

class ProviderBundleResponse {

  String? name = null;
  String? allowance = null;
  int? price = null;
  String? validity = null;
  int? datacode = null;

  ProviderBundleResponse();

  @override
  String toString() {
    return 'ProviderBundleResponse[name=$name, allowance=$allowance, price=$price, validity=$validity, datacode=$datacode, ]';
  }

  ProviderBundleResponse.fromJson(Map<String, dynamic>? json) {
    if (json == null) return;
    name = json['name'];
    allowance = json['allowance'];
    price = json['price'];
    validity = json['validity'];
    datacode = json['datacode'];
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'allowance': allowance,
      'price': price,
      'validity': validity,
      'datacode': datacode
     };
  }

  static List<ProviderBundleResponse> listFromJson(List<dynamic>? json) {
    return json == null ? [] : json.map((value) => new ProviderBundleResponse.fromJson(value)).toList();
  }

  static Map<String, ProviderBundleResponse> mapFromJson(Map<String, Map<String, dynamic>>? json) {
    var map = new Map<String, ProviderBundleResponse>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new ProviderBundleResponse.fromJson(value));
    }
    return map;
  }
}
