part of swagger.api;
class BeneficiaryModel {
  String? name;
  String? accountNumber;
  String? bankName;
  String? bankCode;

  BeneficiaryModel(
      {this.name, this.accountNumber, this.bankName, this.bankCode});

  BeneficiaryModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    accountNumber = json['accountNumber'];
    bankName = json['bankName'];
    bankCode = json['bankCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['accountNumber'] = this.accountNumber;
    data['bankName'] = this.bankName;
    data['bankCode'] = this.bankCode;
    return data;
  }



  static List<BeneficiaryModel> listFromJson(List<dynamic>? json) {
    return json == null ?  [] : json.map((value) => new BeneficiaryModel.fromJson(value)).toList();
  }

  static Map<String, BeneficiaryModel> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, BeneficiaryModel>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new BeneficiaryModel.fromJson(value));
    }
    return map;
  }
}
