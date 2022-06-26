part of swagger.api;

class UserViewPagedCollection {

  int? offset = null;
  int? limit = null;
  int? size = null;
  Link? first = null;
  Link? previous = null;
  Link? next = null;
  Link? last = null;
  Link? self = null;

  List<UserView> value = [];

  UserViewPagedCollection();

  @override
  String toString() {
    return 'UserViewPagedCollection[offset=$offset, limit=$limit, size=$size, first=$first, previous=$previous, next=$next, last=$last, self=$self, value=$value, ]';
  }

  UserViewPagedCollection.fromJson(Map<String, dynamic>? json) {
    if (json == null) return;
    offset = json['offset'];
    limit = json['limit'];
    size = json['size'];
    first = new Link.fromJson(json['first']);
    previous = new Link.fromJson(json['previous']);
    next = new Link.fromJson(json['next']);
    last = new Link.fromJson(json['last']);
    self = new Link.fromJson(json['self']);
    value = UserView.listFromJson(json['value']);
  }

  Map<String, dynamic> toJson() {
    return {
      'offset': offset,
      'limit': limit,
      'size': size,
      'first': first,
      'previous': previous,
      'next': next,
      'last': last,
      'self': self,
      'value': value
     };
  }

  static List<UserViewPagedCollection> listFromJson(List<dynamic>? json) {
    return json == null ? [] : json.map((value) => new UserViewPagedCollection.fromJson(value)).toList();
  }

  static Map<String, UserViewPagedCollection> mapFromJson(Map<String, Map<String, dynamic>>? json) {
    var map = new Map<String, UserViewPagedCollection>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new UserViewPagedCollection.fromJson(value));
    }
    return map;
  }
}
