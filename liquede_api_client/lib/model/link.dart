part of swagger.api;

class Link {

  String? href = null;
  List<String> relations = [];
  String method = "GET";
  String? routeName = null;
  Object? routeValues = null;

  Link();

  @override
  String toString() {
    return 'Link[href=$href, relations=$relations, method=$method, routeName=$routeName, routeValues=$routeValues, ]';
  }

  Link.fromJson(Map<String, dynamic>? json) {
    if (json == null) return;
    href = json['href'];
    relations = (json['relations'] as List).map((item) => item as String).toList();
    method = json['method'];
    routeName = json['routeName'];
    // routeValues = new Object.fromJson(json['routeValues']);
  }

  Map<String, dynamic> toJson() {
    return {
      'href': href,
      'relations': relations,
      'method': method,
      'routeName': routeName,
      'routeValues': routeValues
     };
  }

  static List<Link> listFromJson(List<dynamic>? json) {
    return json == null ? [] : json.map((value) => new Link.fromJson(value)).toList();
  }

  static Map<String, Link> mapFromJson(Map<String, Map<String, dynamic>>? json) {
    var map = new Map<String, Link>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new Link.fromJson(value));
    }
    return map;
  }
}
