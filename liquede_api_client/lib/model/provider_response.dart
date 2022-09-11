part of swagger.api;

class ProviderResponse {

  String? serviceType = null;
  String? shortname = null;
  int? billerId = null;
  int? productId = null;
  String? name = null;

  ProviderResponse();

  @override
  String toString() {
    return 'ProviderResponse[serviceType=$serviceType, shortname=$shortname, billerId=$billerId, productId=$productId, name=$name, ]';
  }

  ProviderResponse.fromJson(Map<String, dynamic>? json) {
    if (json == null) return;
    serviceType = json['serviceType'];
    shortname = json['shortname'];
    billerId = json['billerId'];
    productId = json['productId'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    return {
      'serviceType': serviceType,
      'shortname': shortname,
      'billerId': billerId,
      'productId': productId,
      'name': name
     };
  }

  static List<ProviderResponse> listFromJson(List<dynamic>? json) {
    return json == null ? [] : json.map((value) => new ProviderResponse.fromJson(value)).toList();
  }

  static Map<String, ProviderResponse> mapFromJson(Map<String, Map<String, dynamic>>? json) {
    var map = new Map<String, ProviderResponse>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new ProviderResponse.fromJson(value));
    }
    return map;
  }
}
