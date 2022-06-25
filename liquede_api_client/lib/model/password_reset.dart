part of swagger.api;

class PasswordReset {
  
  String code = null;

  String newPassword = null;

  PasswordReset();

  @override
  String toString() {
    return 'PasswordReset[code=$code, newPassword=$newPassword, ]';
  }

  PasswordReset.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    code = json['code'];
    newPassword = json['newPassword'];
  }

  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'newPassword': newPassword
     };
  }

  static List<PasswordReset> listFromJson(List<dynamic> json) {
    return json == null ? new List<PasswordReset>() : json.map((value) => new PasswordReset.fromJson(value)).toList();
  }

  static Map<String, PasswordReset> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, PasswordReset>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new PasswordReset.fromJson(value));
    }
    return map;
  }
}
