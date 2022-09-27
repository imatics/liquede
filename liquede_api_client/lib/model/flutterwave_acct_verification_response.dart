part of swagger.api;

class BankAccountInfo {

  String? accountNumber = null;
  String? accountName = null;

  BankAccountInfo();

  @override
  String toString() {
    return 'BankAccountInfo[accountName=$accountName, accountNumber=$accountNumber, ]';
  }

  BankAccountInfo.fromJson(Map<String, dynamic>? json) {
    if (json == null) return;
    accountName = json['account_name'];
    accountNumber = json['account_number'];
  }


  Map<String, dynamic> toJson() {
    return {
      'accountName': accountName,
      'accountNumber': accountNumber
    };
  }

  static List<BankAccountInfo> listFromJson(List<dynamic>? json) {
    return json == null ? [] : json.map((value) => new BankAccountInfo.fromJson(value)).toList();
  }

  static Map<String, BankAccountInfo> mapFromJson(Map<String, Map<String, dynamic>>? json) {
    var map = new Map<String, BankAccountInfo>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new BankAccountInfo.fromJson(value));
    }
    return map;
  }
}
