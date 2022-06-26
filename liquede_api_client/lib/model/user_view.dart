part of swagger.api;

class UserView {

  int? id = null;
  String? email = null;
  String? fullName = null;
  String? firstName = null;
  String? lastName = null;
  String? token = null;
  String? phoneNumber = null;
  UserMetricsView? metrics = null;

  UserView();

  @override
  String toString() {
    return 'UserView[id=$id, email=$email, fullName=$fullName, firstName=$firstName, lastName=$lastName, token=$token, phoneNumber=$phoneNumber, metrics=$metrics, ]';
  }

  UserView.fromJson(Map<String, dynamic>? json) {
    if (json == null) return;
    id = json['id'];
    email = json['email'];
    fullName = json['fullName'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    token = json['token'];
    phoneNumber = json['phoneNumber'];
    metrics = new UserMetricsView.fromJson(json['metrics']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'fullName': fullName,
      'firstName': firstName,
      'lastName': lastName,
      'token': token,
      'phoneNumber': phoneNumber,
      'metrics': metrics
     };
  }

  static List<UserView> listFromJson(List<dynamic>? json) {
    return json == null ? [] : json.map((value) => new UserView.fromJson(value)).toList();
  }

  static Map<String, UserView> mapFromJson(Map<String, Map<String, dynamic>>? json) {
    var map = new Map<String, UserView>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new UserView.fromJson(value));
    }
    return map;
  }
}
