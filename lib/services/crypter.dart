import 'package:encrypt/encrypt.dart';

class Crypter {
  String encrypt(String text, String password) {
    final gen = _generateKey(password);
    final key = Key.fromUtf8(gen);
    final encrypter = Encrypter(AES(key, mode: AESMode.ecb));

    final encrypted = encrypter.encrypt(text);
    return encrypted.base64;
  }

  String decrypt(String data, String password) {
    final gen = _generateKey(password);
    final key = Key.fromUtf8(gen);
    final encrypter = Encrypter(AES(key, mode: AESMode.ecb));
    return encrypter.decrypt64(data);
  }

  String _generateKey(String password) {
    var key = password.replaceAll(' ', '_').trim();
    while (key.length <= 32) {
      key += password;
    }
    if (key.length > 32) {
      key = key.substring(0, 32);
    }
    return key;
  }
}