class APIResponse<T> {
  APIResponse(
      {this.payload,
        this.totalCount,
        this.responseCode,
        this.code,
        this.description,
        this.hasErrors = false,
        this.statusCode,
        this.raw,
        this.errors = _d});

  T? payload;
  int? totalCount;
  int? responseCode;
  int? code;
  String? description;
  bool hasErrors;
  int? statusCode;
  String? raw;
  List<String> errors;

  Map toJson() {
    Map json = Map();
    json['hasError'] = hasErrors;
    json['totalCount'] = totalCount;
    json['code'] = code;
    json['description'] = description;
    json['payload'] = (T as BaseModel).toJSON();
    json['statusCode'] = statusCode;
    json['raw'] = raw;
    json['error'] = errors;
    return json;
  }

  @override
  String toString() {
    return toJson().toString();
  }
}

abstract class BaseModel<T> {
  const BaseModel();

  T fromJSON(Map json);

  Map toJSON();
}


const _d = <String>[];
