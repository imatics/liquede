part of swagger.api;

class Wallet {

  int? id = null;
  DateTime? dateCreated = null;
  DateTime? dateModified = null;
  String? zebrraId = null;
  int? userId = null;
  User? user = null;
  String? balance = null;
  String? transferBalanceWitheld = null;
  String? currency = null;
  int? walletTypeId = null;
  int? statusId = null;
  int? pin = null;
  Status? status = null;

  Wallet();

  @override
  String toString() {
    return 'Wallet[id=$id, dateCreated=$dateCreated, dateModified=$dateModified, zebrraId=$zebrraId, userId=$userId, user=$user, balance=$balance, transferBalanceWitheld=$transferBalanceWitheld, currency=$currency, walletTypeId=$walletTypeId, statusId=$statusId, pin=$pin, status=$status, ]';
  }

  Wallet.fromJson(Map<String, dynamic>? json) {
    if (json == null) return;
    id = json['id'];
    dateCreated = json['dateCreated'] == null ? null : DateTime.parse(json['dateCreated']);
    dateModified = json['dateModified'] == null ? null : DateTime.parse(json['dateModified']);
    zebrraId = json['zebrraId'];
    userId = json['userId'];
    user = new User.fromJson(json['user']);
    balance = json['balance'];
    transferBalanceWitheld = json['transferBalanceWitheld'];
    currency = json['currency'];
    walletTypeId = json['walletTypeId'];
    statusId = json['statusId'];
    pin = json['pin'];
    status = new Status.fromJson(json['status']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'dateCreated': dateCreated == null ? '' : dateCreated!.toUtc().toIso8601String(),
      'dateModified': dateModified == null ? '' : dateModified!.toUtc().toIso8601String(),
      'zebrraId': zebrraId,
      'userId': userId,
      'user': user,
      'balance': balance,
      'transferBalanceWitheld': transferBalanceWitheld,
      'currency': currency,
      'walletTypeId': walletTypeId,
      'statusId': statusId,
      'pin': pin,
      'status': status
     };
  }

  static List<Wallet> listFromJson(List<dynamic>? json) {
    return json == null ? [] : json.map((value) => new Wallet.fromJson(value)).toList();
  }

  static Map<String, Wallet> mapFromJson(Map<String, Map<String, dynamic>>? json) {
    var map = new Map<String, Wallet>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new Wallet.fromJson(value));
    }
    return map;
  }
}
