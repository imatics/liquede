part of swagger.api;

class Status {
  
  int id = null;

  DateTime dateCreated = null;

  DateTime dateModified = null;

  String name = null;

  Status();

  @override
  String toString() {
    return 'Status[id=$id, dateCreated=$dateCreated, dateModified=$dateModified, name=$name, ]';
  }

  Status.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id = json['id'];
    dateCreated = json['dateCreated'] == null ? null : DateTime.parse(json['dateCreated']);
    dateModified = json['dateModified'] == null ? null : DateTime.parse(json['dateModified']);
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'dateCreated': dateCreated == null ? '' : dateCreated.toUtc().toIso8601String(),
      'dateModified': dateModified == null ? '' : dateModified.toUtc().toIso8601String(),
      'name': name
     };
  }

  static List<Status> listFromJson(List<dynamic> json) {
    return json == null ? new List<Status>() : json.map((value) => new Status.fromJson(value)).toList();
  }

  static Map<String, Status> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, Status>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new Status.fromJson(value));
    }
    return map;
  }
}
