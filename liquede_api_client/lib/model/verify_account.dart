part of swagger.api;

class AccountDetailsRequestModel {


  String? account_number = null;

  String? account_bank = null;

  AccountDetailsRequestModel();

  @override
  String toString() {
    return 'AccountDetailsRequestModel[ account_number=$account_number, account_bank=$account_bank, ]';
  }

  AccountDetailsRequestModel.fromJson(Map<String, dynamic>? json) {
    if (json == null) return;

    account_number = json['account_number'];
    account_bank = json['account_bank'];
  }

  Map<String, dynamic> toJson() {
    return {
      'account_number': account_number,
      'account_bank': account_bank
    };
  }

  static List<AccountDetailsRequestModel> listFromJson(List<dynamic>? json) {
    return json == null ?  [] : json.map((value) => new AccountDetailsRequestModel.fromJson(value)).toList();
  }

  static Map<String, AccountDetailsRequestModel> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, AccountDetailsRequestModel>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new AccountDetailsRequestModel.fromJson(value));
    }
    return map;
  }
}
