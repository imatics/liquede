part of swagger.api;

class DataProviderResponse {

  List<ProviderResponse> providers = [];

  DataProviderResponse();

  @override
  String toString() {
    return 'DataProviderResponse[providers=$providers, ]';
  }

  DataProviderResponse.fromJson(Map<String, dynamic>? json) {
    if (json == null) return;
    providers = ProviderResponse.listFromJson(json['providers']);
  }

  Map<String, dynamic> toJson() {
    return {
      'providers': providers
     };
  }

  static List<DataProviderResponse> listFromJson(List<dynamic>? json) {
    return json == null ? [] : json.map((value) => new DataProviderResponse.fromJson(value)).toList();
  }

  static Map<String, DataProviderResponse> mapFromJson(Map<String, Map<String, dynamic>>? json) {
    var map = new Map<String, DataProviderResponse>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new DataProviderResponse.fromJson(value));
    }
    return map;
  }
}
