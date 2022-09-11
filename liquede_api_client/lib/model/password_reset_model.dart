part of swagger.api;

class PasswordResetModel {

  String? existingPassword = null;
  String? newPassword = null;

  PasswordResetModel();

  @override
  String toString() {
    return 'PasswordResetModel[existingPassword=$existingPassword, newPassword=$newPassword, ]';
  }

  PasswordResetModel.fromJson(Map<String, dynamic>? json) {
    if (json == null) return;
    existingPassword = json['existingPassword'];
    newPassword = json['newPassword'];
  }

  Map<String, dynamic> toJson() {
    return {
      'existingPassword': existingPassword,
      'newPassword': newPassword
     };
  }

  static List<PasswordResetModel> listFromJson(List<dynamic>? json) {
    return json == null ? [] : json.map((value) => new PasswordResetModel.fromJson(value)).toList();
  }

  static Map<String, PasswordResetModel> mapFromJson(Map<String, Map<String, dynamic>>? json) {
    var map = new Map<String, PasswordResetModel>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new PasswordResetModel.fromJson(value));
    }
    return map;
  }
}
