part of swagger.api;

class LiquedeSealInput {

  String? name = null;

  String? description = null;
  String? paymentMethod = null;

  int? durationInDays = null;

  double? amount = null;

  int? cardId = null;

  LiquedeSealInput();

  @override
  String toString() {
    return 'LiquedeSealInput[name=$name, description=$description, durationInDays=$durationInDays, amount=$amount, cardId=$cardId, ]';
  }

  LiquedeSealInput.fromJson(Map<String, dynamic>? json) {
    if (json == null) return;
    name = json['name'];
    description = json['description'];
    paymentMethod = json['paymentMethod'];
    durationInDays = json['durationInDays'];
    amount = json['amount'];
    cardId = json['cardId'];
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'durationInDays': durationInDays,
      'amount': amount,
      'paymentMethod': paymentMethod,
      'cardId': cardId
     };
  }

  static List<LiquedeSealInput> listFromJson(List<dynamic>? json) {
    return json == null ? [] : json.map((value) => new LiquedeSealInput.fromJson(value)).toList();
  }

  static Map<String, LiquedeSealInput> mapFromJson(Map<String, Map<String, dynamic>>? json) {
    var map = new Map<String, LiquedeSealInput>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new LiquedeSealInput.fromJson(value));
    }
    return map;
  }
}
