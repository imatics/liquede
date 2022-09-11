part of swagger.api;

class MultichoiceUserResponse {

  String? name = null;
  String? address = null;
  Object? outstandingBalance = null;
  DateTime? dueDate = null;
  String? district = null;
  String? accountNumber = null;
  String? minimumAmount = null;
  RawOutputResponse? rawOutput = null;
  String? errorMessage = null;
  CurrentBouquetRawResponse? currentBouquetRaw = null;
  String? currentBouquet = null;

  MultichoiceUserResponse();

  @override
  String toString() {
    return 'MultichoiceUserResponse[name=$name, address=$address, outstandingBalance=$outstandingBalance, dueDate=$dueDate, district=$district, accountNumber=$accountNumber, minimumAmount=$minimumAmount, rawOutput=$rawOutput, errorMessage=$errorMessage, currentBouquetRaw=$currentBouquetRaw, currentBouquet=$currentBouquet, ]';
  }

  MultichoiceUserResponse.fromJson(Map<String, dynamic>? json) {
    if (json == null) return;
    name = json['name'];
    address = json['address'];
    // outstandingBalance = new Object.fromJson(json['outstandingBalance']);
    dueDate = DateTime.parse(json['dueDate']);
    district = json['district'];
    accountNumber = json['accountNumber'];
    minimumAmount = json['minimumAmount'];
    rawOutput = new RawOutputResponse.fromJson(json['rawOutput']);
    errorMessage = json['errorMessage'];
    currentBouquetRaw = new CurrentBouquetRawResponse.fromJson(json['currentBouquetRaw']);
    currentBouquet = json['currentBouquet'];
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'address': address,
      'outstandingBalance': outstandingBalance,
      'dueDate': dueDate,
      'district': district,
      'accountNumber': accountNumber,
      'minimumAmount': minimumAmount,
      'rawOutput': rawOutput,
      'errorMessage': errorMessage,
      'currentBouquetRaw': currentBouquetRaw,
      'currentBouquet': currentBouquet
     };
  }

  static List<MultichoiceUserResponse> listFromJson(List<dynamic>? json) {
    return json == null ? [] : json.map((value) => new MultichoiceUserResponse.fromJson(value)).toList();
  }

  static Map<String, MultichoiceUserResponse> mapFromJson(Map<String, Map<String, dynamic>>? json) {
    var map = new Map<String, MultichoiceUserResponse>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new MultichoiceUserResponse.fromJson(value));
    }
    return map;
  }
}
