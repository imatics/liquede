part of swagger.api;

class MediaModel {

  String? name = null;
  String? extention = null;
  String? base64String = null;
  int? propertyId = null;
  bool? isImage = null;
  bool? isVideo = null;
  bool? isDocument = null;

  MediaModel();

  @override
  String toString() {
    return 'MediaModel[name=$name, extention=$extention, base64String=$base64String, propertyId=$propertyId, isImage=$isImage, isVideo=$isVideo, isDocument=$isDocument, ]';
  }

  MediaModel.fromJson(Map<String, dynamic>? json) {
    if (json == null) return;
    name = json['name'];
    extention = json['extention'];
    base64String = json['base64String'];
    propertyId = json['propertyId'];
    isImage = json['isImage'];
    isVideo = json['isVideo'];
    isDocument = json['isDocument'];
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'extention': extention,
      'base64String': base64String,
      'propertyId': propertyId,
      'isImage': isImage,
      'isVideo': isVideo,
      'isDocument': isDocument
     };
  }

  static List<MediaModel> listFromJson(List<dynamic>? json) {
    return json == null ? [] : json.map((value) => new MediaModel.fromJson(value)).toList();
  }

  static Map<String, MediaModel> mapFromJson(Map<String, Map<String, dynamic>>? json) {
    var map = new Map<String, MediaModel>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new MediaModel.fromJson(value));
    }
    return map;
  }
}
