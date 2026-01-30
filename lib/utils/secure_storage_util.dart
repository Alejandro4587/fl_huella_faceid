import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageUtil {
  
  static const FlutterSecureStorage _storage = FlutterSecureStorage();

  Future<String?> getValue(String key) async {
    return await _storage.read(key: key);
  }

  Future<void> setValue(String key, String value) async {
    return _storage.write(key: key, value: value);
  }

  Future<void> deleteValue(String key) async {
    return _storage.delete(key: key);
  }
}
