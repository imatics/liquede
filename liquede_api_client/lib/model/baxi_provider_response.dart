part of swagger.api;

class BaxiProviderResponse {

  String? serviceType = null;

  String? shortname = null;

  String? name = null;

  List<String> plans = [];

  BaxiProviderResponse();

  @override
  String toString() {
    return 'BaxiProviderResponse[serviceType=$serviceType, shortname=$shortname, name=$name, plans=$plans, ]';
  }

  BaxiProviderResponse.fromJson(Map<String, dynamic>? json) {
    if (json == null) return;
    serviceType = json['serviceType'];
    shortname = json['shortname'];
    name = json['name'];
    plans = (json['plans'] as List).map((item) => item as String).toList();
  }

  Map<String, dynamic> toJson() {
    return {
      'serviceType': serviceType,
      'shortname': shortname,
      'name': name,
      'plans': plans
     };
  }

  static List<BaxiProviderResponse> listFromJson(List<dynamic>? json) {
    return json == null ? [] : json.map((value) => new BaxiProviderResponse.fromJson(value)).toList();
  }

  static Map<String, BaxiProviderResponse> mapFromJson(Map<String, Map<String, dynamic>>? json) {
    var map = new Map<String, BaxiProviderResponse>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new BaxiProviderResponse.fromJson(value));
    }
    return map;
  }
}
