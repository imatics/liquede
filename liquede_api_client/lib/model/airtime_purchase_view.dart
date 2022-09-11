part of swagger.api;

class AirtimePurchaseView {

  AirtimePurchaseView();

  @override
  String toString() {
    return 'AirtimePurchaseView[]';
  }

  AirtimePurchaseView.fromJson(Map<String, dynamic>? json) {
    if (json == null) return;
  }

  Map<String, dynamic> toJson() {
    return {
     };
  }

  static List<AirtimePurchaseView> listFromJson(List<dynamic>? json) {
    return json == null ?  [] : json.map((value) => new AirtimePurchaseView.fromJson(value)).toList();
  }

  static Map<String, AirtimePurchaseView> mapFromJson(Map<String, Map<String, dynamic>>? json) {
    var map = new Map<String, AirtimePurchaseView>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new AirtimePurchaseView.fromJson(value));
    }
    return map;
  }
}
