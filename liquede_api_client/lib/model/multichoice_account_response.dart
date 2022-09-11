part of swagger.api;

class MultichoiceAccountResponse {

  MultichoiceUserResponse? user = null;

  MultichoiceAccountResponse();

  @override
  String toString() {
    return 'MultichoiceAccountResponse[user=$user, ]';
  }

  MultichoiceAccountResponse.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    user = new MultichoiceUserResponse.fromJson(json['user']);
  }

  Map<String, dynamic> toJson() {
    return {
      'user': user
     };
  }

  static List<MultichoiceAccountResponse> listFromJson(List<dynamic>? json) {
    return json == null ? [] : json.map((value) => new MultichoiceAccountResponse.fromJson(value)).toList();
  }

  static Map<String, MultichoiceAccountResponse> mapFromJson(Map<String, Map<String, dynamic>>? json) {
    var map = new Map<String, MultichoiceAccountResponse>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new MultichoiceAccountResponse.fromJson(value));
    }
    return map;
  }
}
