import 'package:encrypt/encrypt.dart' as Encrypt;
import 'package:encrypt/encrypt.dart';

class AesUtil {
  static const String _key = 'rings511115sgnir';
  static const String _iv = '511ringssgnir115';

  ///aes加密函数
  static String aesEncode(String content) {
    //加密文案
    String data =
        '{"OperatorID":"757915977", "OperatorSecret":"91b27d564852a1b"}';
    //加密key
    final key = Encrypt.Key.fromUtf8(_key);
    //偏移量
    final iv = Encrypt.IV.fromUtf8(_iv);

    //设置cbc模式
    final encrypter = Encrypt.Encrypter(
        Encrypt.AES(key, mode: Encrypt.AESMode.cbc, padding: 'PKCS7'));
    //加密
    final encrypted = encrypter.encrypt(content, iv: iv);
    //解密
    final decrypted = encrypter.decrypt(encrypted, iv: iv);

    print(decrypted);
    print(encrypted.base64);

    return encrypted.base64;
  }

  /// 解密函数
  static String aesDecrypted(String data) {
    //加密key
    final key = Encrypt.Key.fromUtf8(_key);
    //偏移量
    final iv = Encrypt.IV.fromUtf8(_iv);

    //设置cbc模式
    final encrypter = Encrypt.Encrypter(
        Encrypt.AES(key, mode: Encrypt.AESMode.cbc, padding: 'PKCS7'));
    //解密
    print("解密后的结果:" + encrypter.decrypt(Encrypted.fromBase64(data), iv: iv));
    return encrypter.decrypt(Encrypted.fromBase64(data), iv: iv);
  }
}
