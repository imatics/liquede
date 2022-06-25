part of swagger.api;

class WalletPinModel {
  
  int userId = null;

  int pin = null;

  WalletPinModel();

  @override
  String toString() {
    return 'WalletPinModel[userId=$userId, pin=$pin, ]';
  }

  WalletPinModel.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    userId = json['userId'];
    pin = json['pin'];
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'pin': pin
     };
  }

  static List<WalletPinModel> listFromJson(List<dynamic> json) {
    return json == null ? new List<WalletPinModel>() : json.map((value) => new WalletPinModel.fromJson(value)).toList();
  }

  static Map<String, WalletPinModel> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, WalletPinModel>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new WalletPinModel.fromJson(value));
    }
    return map;
  }
}
