extension IntExtension on int? {
  bool get isOkResponse {
      return this == 200 || this == 201;
  }


}
