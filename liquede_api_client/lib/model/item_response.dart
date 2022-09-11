part of swagger.api;

class ItemResponse {

  String? code = null;

  int? price = null;

  String? name = null;

  String? description = null;

  ItemResponse();

  @override
  String toString() {
    return 'ItemResponse[code=$code, price=$price, name=$name, description=$description, ]';
  }

  ItemResponse.fromJson(Map<String, dynamic>? json) {
    if (json == null) return;
    code = json['code'];
    price = json['price'];
    name = json['name'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'price': price,
      'name': name,
      'description': description
     };
  }

  static List<ItemResponse> listFromJson(List<dynamic>? json) {
    return json == null ? [] : json.map((value) => new ItemResponse.fromJson(value)).toList();
  }

  static Map<String, ItemResponse> mapFromJson(Map<String, Map<String, dynamic>>? json) {
    var map = new Map<String, ItemResponse>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new ItemResponse.fromJson(value));
    }
    return map;
  }
}
