part of swagger.api;

class Code {

  int? id = null;
  DateTime? dateCreated = null;
  DateTime? dateModified = null;
  String? codeString = null;
  String? key = null;
  int? userId = null;
  User? user = null;
  DateTime? expiryDate = null;
  bool? isExpired = null;
  String? token = null;

  Code();

  @override
  String toString() {
    return 'Code[id=$id, dateCreated=$dateCreated, dateModified=$dateModified, codeString=$codeString, key=$key, userId=$userId, user=$user, expiryDate=$expiryDate, isExpired=$isExpired, token=$token, ]';
  }

  Code.fromJson(Map<String, dynamic>? json) {
    if (json == null) return;
    id = json['id'];
    dateCreated = json['dateCreated'] == null ? null : DateTime.parse(json['dateCreated']);
    dateModified = json['dateModified'] == null ? null : DateTime.parse(json['dateModified']);
    codeString = json['codeString'];
    key = json['key'];
    userId = json['userId'];
    user = new User.fromJson(json['user']);
    expiryDate = json['expiryDate'] == null ? null : DateTime.parse(json['expiryDate']);
    isExpired = json['isExpired'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'dateCreated': dateCreated == null ? '' : dateCreated!.toUtc().toIso8601String(),
      'dateModified': dateModified == null ? '' : dateModified!.toUtc().toIso8601String(),
      'codeString': codeString,
      'key': key,
      'userId': userId,
      'user': user,
      'expiryDate': expiryDate == null ? '' : expiryDate!.toUtc().toIso8601String(),
      'isExpired': isExpired,
      'token': token
     };
  }

  static List<Code> listFromJson(List<dynamic>? json) {
    return json == null ? [] : json.map((value) => new Code.fromJson(value)).toList();
  }

  static Map<String, Code> mapFromJson(Map<String, Map<String, dynamic>>? json) {
    var map = new Map<String, Code>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new Code.fromJson(value));
    }
    return map;
  }
}
