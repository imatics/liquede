part of swagger.api;

class Card {

  int? id = null;

  DateTime? dateCreated = null;

  DateTime? dateModified = null;

  int? userId = null;

  User? user = null;

  String? first6Digits = null;

  String? last4Digits = null;

  String? issuer = null;

  String? country = null;

  String? type = null;

  String? token = null;

  String? expiry = null;

  Card();

  @override
  String toString() {
    return 'Card[id=$id, dateCreated=$dateCreated, dateModified=$dateModified, userId=$userId, user=$user, first6Digits=$first6Digits, last4Digits=$last4Digits, issuer=$issuer, country=$country, type=$type, token=$token, expiry=$expiry, ]';
  }

  Card.fromJson(Map<String, dynamic>? json) {
    if (json == null) return;
    id = json['id'];
    dateCreated = json['dateCreated'] == null ? null : DateTime.parse(json['dateCreated']);
    dateModified = json['dateModified'] == null ? null : DateTime.parse(json['dateModified']);
    userId = json['userId'];
    user = new User.fromJson(json['user']);
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
      'id': id,
      'dateCreated': dateCreated == null ? '' : dateCreated!.toUtc().toIso8601String(),
      'dateModified': dateModified == null ? '' : dateModified!.toUtc().toIso8601String(),
      'userId': userId,
      'user': user,
      'first6Digits': first6Digits,
      'last4Digits': last4Digits,
      'issuer': issuer,
      'country': country,
      'type': type,
      'token': token,
      'expiry': expiry
     };
  }

  static List<Card> listFromJson(List<dynamic>? json) {
    return json == null ? [] : json.map((value) => new Card.fromJson(value)).toList();
  }

  static Map<String, Card> mapFromJson(Map<String, Map<String, dynamic>>? json) {
    var map = new Map<String, Card>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new Card.fromJson(value));
    }
    return map;
  }
}
