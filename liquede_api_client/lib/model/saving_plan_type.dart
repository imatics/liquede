part of swagger.api;

class SavingPlanType {

  int? id = null;
  DateTime? dateCreated = null;
  DateTime? dateModified = null;
  String? name = null;
  String? description = null;

  SavingPlanType();

  @override
  String toString() {
    return 'SavingPlanType[id=$id, dateCreated=$dateCreated, dateModified=$dateModified, name=$name, description=$description, ]';
  }

  SavingPlanType.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id = json['id'];
    dateCreated = json['dateCreated'] == null ? null : DateTime.parse(json['dateCreated']);
    dateModified = json['dateModified'] == null ? null : DateTime.parse(json['dateModified']);
    name = json['name'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'dateCreated': dateCreated == null ? '' : dateCreated!.toUtc().toIso8601String(),
      'dateModified': dateModified == null ? '' : dateModified!.toUtc().toIso8601String(),
      'name': name,
      'description': description
     };
  }

  static List<SavingPlanType> listFromJson(List<dynamic>? json) {
    return json == null ? [] : json.map((value) => new SavingPlanType.fromJson(value)).toList();
  }

  static Map<String, SavingPlanType> mapFromJson(Map<String, Map<String, dynamic>>? json) {
    var map = new Map<String, SavingPlanType>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new SavingPlanType.fromJson(value));
    }
    return map;
  }
}
