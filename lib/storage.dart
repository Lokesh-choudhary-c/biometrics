import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  final _storage = const FlutterSecureStorage();

  Future<void> saveToken(String token) async {
    await _storage.write(key: 'auth_token', value: token);
  }

  Future<String?> readToken() async {
    return await _storage.read(key: 'auth_token');
  }

  Future<void> deleteToken() async {
    await _storage.delete(key: 'auth_token');
  }

  Future<void> savePassword(String password) async {
    await _storage.write(key: 'user_password', value: password);
  }

  Future<String?> readPassword() async {
    return await _storage.read(key: 'user_password');
  }

  Future<void> deletePassword() async {
    await _storage.delete(key: 'user_password');
  }
}




