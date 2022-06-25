part of swagger.api;

class WalletTransferModel {
  
  String amount = null;

  String narration = null;

  int userId = null;

  int recipientUserId = null;

  String description = null;

  WalletTransferModel();

  @override
  String toString() {
    return 'WalletTransferModel[amount=$amount, narration=$narration, userId=$userId, recipientUserId=$recipientUserId, description=$description, ]';
  }

  WalletTransferModel.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    amount = json['amount'];
    narration = json['narration'];
    userId = json['userId'];
    recipientUserId = json['recipientUserId'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    return {
      'amount': amount,
      'narration': narration,
      'userId': userId,
      'recipientUserId': recipientUserId,
      'description': description
     };
  }

  static List<WalletTransferModel> listFromJson(List<dynamic> json) {
    return json == null ? new List<WalletTransferModel>() : json.map((value) => new WalletTransferModel.fromJson(value)).toList();
  }

  static Map<String, WalletTransferModel> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, WalletTransferModel>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new WalletTransferModel.fromJson(value));
    }
    return map;
  }
}
