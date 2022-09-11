part of swagger.api;

class ProviderBouquetResponse {

  List<AvailablePricingOptionResponse> availablePricingOptions = [];

  String? code = null;
  String? name = null;
  String? description = null;

  ProviderBouquetResponse();

  @override
  String toString() {
    return 'ProviderBouquetResponse[availablePricingOptions=$availablePricingOptions, code=$code, name=$name, description=$description, ]';
  }

  ProviderBouquetResponse.fromJson(Map<String, dynamic>? json) {
    if (json == null) return;
    availablePricingOptions = AvailablePricingOptionResponse.listFromJson(json['availablePricingOptions']);
    code = json['code'];
    name = json['name'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    return {
      'availablePricingOptions': availablePricingOptions,
      'code': code,
      'name': name,
      'description': description
     };
  }

  static List<ProviderBouquetResponse> listFromJson(List<dynamic>? json) {
    return json == null ? [] : json.map((value) => new ProviderBouquetResponse.fromJson(value)).toList();
  }

  static Map<String, ProviderBouquetResponse> mapFromJson(Map<String, Map<String, dynamic>>? json) {
    var map = new Map<String, ProviderBouquetResponse>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new ProviderBouquetResponse.fromJson(value));
    }
    return map;
  }
}
