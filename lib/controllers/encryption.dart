import 'dart:convert';
import 'dart:typed_data';
  import 'package:pointycastle/export.dart';
import 'package:pointycastle/pointycastle.dart';

class EncryptionHelper {
String pkcs7Pad(Uint8List input, int blockSize) {
  final padLength = blockSize - input.length % blockSize;
  final pads = List.filled(padLength, padLength);
  final output = Uint8List.fromList(input + pads);
  return String.fromCharCodes(output);
}

String padUtf8String(String text) {
  final utf8Bytes = utf8.encode(text);
  final blockSize = 16; // Размер блока AES (в байтах)
  final padLength = blockSize - (utf8Bytes.length % blockSize);
  final paddedBytes = List<int>.from(utf8Bytes)..addAll(List.filled(padLength, padLength));
  return utf8.decode(paddedBytes);
}

List<int> pkcs7Unpad(List<int> input) {
  if (input.isEmpty) {
    throw Exception("Неправильный формат входных данных: пустой список");
  }
  final padLength = input.last;
  if (padLength >= input.length) {
    throw Exception("Неправильный формат входных данных: padLength больше длины входных данных");
  }
  return input.sublist(0, input.length - padLength);
}
// String encryptAES(String plainText, Uint8List key, Uint8List iv) {
//   final cipher = AESFastEngine(); 
//   final params = ParametersWithIV(KeyParameter(key), iv); 
//   final encryptor = PaddedBlockCipher(CBCBlockCipher(cipher), PKCS7Padding());

//   encryptor.init(true, params); 
//   final paddedText = padUtf8String(plainText); // Дополнение входных данных до кратного размеру блока
//   final encryptedText = encryptor.process(utf8.encode(paddedText)); 
//   return base64.encode(encryptedText);
// }


String encryptAES(String plainText, Uint8List key, Uint8List iv) {
  final cipher = AESFastEngine(); 
  final params = ParametersWithIV(KeyParameter(key), iv); 
  final encryptor = CBCBlockCipher(cipher); 

  encryptor.init(true, params); 
  final encryptedText = encryptor.process(utf8.encode(plainText)); 
  return base64.encode(encryptedText);
}


String decryptAES(String encryptedText, Uint8List key, Uint8List iv) {
  final cipher = AESFastEngine(); 
  final params = ParametersWithIV(KeyParameter(key), iv); 
  final decryptor = CBCBlockCipher(cipher); 

  decryptor.init(false, params); 
  final decryptedText = decryptor.process(base64.decode(encryptedText)); 
  final unpaddedText = pkcs7Unpad(decryptedText); 
  return utf8.decode(unpaddedText);
}
}
