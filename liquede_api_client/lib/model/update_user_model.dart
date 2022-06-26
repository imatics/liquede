part of swagger.api;

class UpdateUserModel {

  int? id = null;
  String? phoneNumber = null;
  MediaModel? profilePicture = null;

  UpdateUserModel();

  @override
  String toString() {
    return 'UpdateUserModel[id=$id, phoneNumber=$phoneNumber, profilePicture=$profilePicture, ]';
  }

  UpdateUserModel.fromJson(Map<String, dynamic>? json) {
    if (json == null) return;
    id = json['id'];
    phoneNumber = json['phoneNumber'];
    profilePicture = new MediaModel.fromJson(json['profilePicture']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'phoneNumber': phoneNumber,
      'profilePicture': profilePicture
     };
  }

  static List<UpdateUserModel> listFromJson(List<dynamic>? json) {
    return json == null ? [] : json.map((value) => new UpdateUserModel.fromJson(value)).toList();
  }

  static Map<String, UpdateUserModel> mapFromJson(Map<String, Map<String, dynamic>>? json) {
    var map = new Map<String, UpdateUserModel>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new UpdateUserModel.fromJson(value));
    }
    return map;
  }
}
