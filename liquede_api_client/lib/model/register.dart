part of swagger.api;

class Register {

  String? email = null;
  String? password = null;
  String? firstName = null;
  String? lastName = null;
  String? middleName = null;
  String? phoneNumber = null;

  Register();

  @override
  String toString() {
    return 'Register[email=$email, password=$password, firstName=$firstName, lastName=$lastName, middleName=$middleName, phoneNumber=$phoneNumber, ]';
  }

  Register.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    email = json['email'];
    password = json['password'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    middleName = json['middleName'];
    phoneNumber = json['phoneNumber'];
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
      'firstName': firstName,
      'lastName': lastName,
      'middleName': middleName,
      'phoneNumber': phoneNumber
     };
  }

  static List<Register> listFromJson(List<dynamic>? json) {
    return json == null ? [] : json.map((value) => new Register.fromJson(value)).toList();
  }

  static Map<String, Register> mapFromJson(Map<String, Map<String, dynamic>>? json) {
    var map = new Map<String, Register>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new Register.fromJson(value));
    }
    return map;
  }
}
