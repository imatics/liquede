part of swagger.api;

class CardView {

  String? first6Digits = null;

  String? last4Digits = null;

  String? issuer = null;

  String? country = null;

  String? type = null;

  String? token = null;

  String? expiry = null;

  CardView();

  @override
  String toString() {
    return 'CardView[first6Digits=$first6Digits, last4Digits=$last4Digits, issuer=$issuer, country=$country, type=$type, token=$token, expiry=$expiry, ]';
  }

  CardView.fromJson(Map<String, dynamic>? json) {
    if (json == null) return;
    first6Digits = json['first6Digits'];
    last4Digits = json['last4Digits'];
    issuer = json['issuer'];
    country = json['country'];
    type = json['type'];
    token = json['token'];
    expiry = json['expiry'];
  }

  Map<String, dynamic> toJson() {
    return {
      'first6Digits': first6Digits,
      'last4Digits': last4Digits,
      'issuer': issuer,
      'country': country,
      'type': type,
      'token': token,
      'expiry': expiry
     };
  }

  static List<CardView> listFromJson(List<dynamic>? json) {
    return json == null ? [] : json.map((value) => new CardView.fromJson(value)).toList();
  }

  static Map<String, CardView> mapFromJson(Map<String, Map<String, dynamic>>? json) {
    var map = new Map<String, CardView>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new CardView.fromJson(value));
    }
    return map;
  }
}
