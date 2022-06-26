part of swagger.api;

class LoginModel {

  String? email = null;
  String? password = null;

  LoginModel();

  @override
  String toString() {
    return 'LoginModel[email=$email, password=$password, ]';
  }

  LoginModel.fromJson(Map<String, dynamic>? json) {
    if (json == null) return;
    email = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password
     };
  }

  static List<LoginModel> listFromJson(List<dynamic>? json) {
    return json == null ? [] : json.map((value) => new LoginModel.fromJson(value)).toList();
  }

  static Map<String, LoginModel> mapFromJson(Map<String, Map<String, dynamic>>? json) {
    var map = new Map<String, LoginModel>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new LoginModel.fromJson(value));
    }
    return map;
  }
}
