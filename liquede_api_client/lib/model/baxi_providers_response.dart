part of swagger.api;

class BaxiProvidersResponse {

  List<BaxiProviderResponse> providers = [];

  BaxiProvidersResponse();

  @override
  String toString() {
    return 'BaxiProvidersResponse[providers=$providers, ]';
  }

  BaxiProvidersResponse.fromJson(Map<String, dynamic>? json) {
    if (json == null) return;
    providers = BaxiProviderResponse.listFromJson(json['providers']);
  }

  Map<String, dynamic> toJson() {
    return {
      'providers': providers
     };
  }

  static List<BaxiProvidersResponse> listFromJson(List<dynamic>? json) {
    return json == null ? [] : json.map((value) => new BaxiProvidersResponse.fromJson(value)).toList();
  }

  static Map<String, BaxiProvidersResponse> mapFromJson(Map<String, Map<String, dynamic>>? json) {
    var map = new Map<String, BaxiProvidersResponse>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new BaxiProvidersResponse.fromJson(value));
    }
    return map;
  }
}
