import 'package:encrypt/encrypt.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final publicKeyString = await rootBundle.loadString('assets/perms/public.perm');
  //final privateKeyString = await rootBundle.loadString('assets/private.pem');
  final publicKey = RSAKeyParser().parse(publicKeyString);
  //final privKey = RSAKeyParser().parse(privateKeyString);

  final plainText = '{"username": "igor.santana@toodoo.com.br","password": "abelha@123"}';
  final encrypter = Encrypter(RSA(publicKey: publicKey));

  final encrypted = encrypter.encrypt(plainText);
  //final decrypted = encrypter.decrypt(encrypted);

  print(encrypted.base64);
}