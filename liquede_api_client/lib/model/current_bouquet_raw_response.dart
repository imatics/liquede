part of swagger.api;

class CurrentBouquetRawResponse {

  int? amount = null;

  List<ItemResponse> items = [];

  CurrentBouquetRawResponse();

  @override
  String toString() {
    return 'CurrentBouquetRawResponse[amount=$amount, items=$items, ]';
  }

  CurrentBouquetRawResponse.fromJson(Map<String, dynamic>? json) {
    if (json == null) return;
    amount = json['amount'];
    items = ItemResponse.listFromJson(json['items']);
  }

  Map<String, dynamic> toJson() {
    return {
      'amount': amount,
      'items': items
     };
  }

  static List<CurrentBouquetRawResponse> listFromJson(List<dynamic>? json) {
    return json == null ? [] : json.map((value) => new CurrentBouquetRawResponse.fromJson(value)).toList();
  }

  static Map<String, CurrentBouquetRawResponse> mapFromJson(Map<String, Map<String, dynamic>>? json) {
    var map = new Map<String, CurrentBouquetRawResponse>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new CurrentBouquetRawResponse.fromJson(value));
    }
    return map;
  }
}
