part of swagger.api;

class UserMetricsView {
  
  int pendingComplaints = null;

  int resolvedComplaints = null;

  int declinedComplaints = null;

  UserMetricsView();

  @override
  String toString() {
    return 'UserMetricsView[pendingComplaints=$pendingComplaints, resolvedComplaints=$resolvedComplaints, declinedComplaints=$declinedComplaints, ]';
  }

  UserMetricsView.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    pendingComplaints = json['pendingComplaints'];
    resolvedComplaints = json['resolvedComplaints'];
    declinedComplaints = json['declinedComplaints'];
  }

  Map<String, dynamic> toJson() {
    return {
      'pendingComplaints': pendingComplaints,
      'resolvedComplaints': resolvedComplaints,
      'declinedComplaints': declinedComplaints
     };
  }

  static List<UserMetricsView> listFromJson(List<dynamic> json) {
    return json == null ? new List<UserMetricsView>() : json.map((value) => new UserMetricsView.fromJson(value)).toList();
  }

  static Map<String, UserMetricsView> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, UserMetricsView>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new UserMetricsView.fromJson(value));
    }
    return map;
  }
}
