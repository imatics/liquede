part of swagger.api;

class BankInfo {

String? id = null;
String? code = null;
String? name = null;

BankInfo();

@override
String toString() {
return 'BankInfo[id=$id, code=$code, name=$name,]';
}

BankInfo.fromJson(Map<String, dynamic>? json) {
if (json == null) return;
id = json['id'];
code = json['code'];
name = json['name'];
}


Map<String, dynamic> toJson() {
return {
'id': id,
'code': code,
'name': name
};
}

static List<BankInfo> listFromJson(List<dynamic>? json) {
return json == null ? [] : json.map((value) => new BankInfo.fromJson(value)).toList();
}

static Map<String, BankInfo> mapFromJson(Map<String, Map<String, dynamic>>? json) {
var map = new Map<String, BankInfo>();
if (json != null && json.length > 0) {
json.forEach((String key, Map<String, dynamic> value) => map[key] = new BankInfo.fromJson(value));
}
return map;
}
}
