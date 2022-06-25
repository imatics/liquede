import 'package:encrypt/encrypt.dart';

final key = Key.fromUtf8('12345678909876543210qwertyuiopas');
final iv = IV.fromLength(16);
final encrypter = Encrypter(AES(key));

String encryptText(String plainText) {
  final encrypted = encrypter.encrypt(plainText, iv: iv);
  return encrypted.base64;
}


String decryptText(String encrypted) {
  final decrypted = encrypter.decrypt64(encrypted, iv: iv);
  return decrypted;
}
