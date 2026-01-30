import 'local_auth_util.dart';
import 'secure_storage_util.dart';

class BiometricAuthUtil {
  final LocalAuthUtil _localAuthService = LocalAuthUtil();
  final SecureStorageUtil _secureStorageService = SecureStorageUtil();
  final String passwordKey = 'password', usernameKey = 'username';

  Future<bool> isBiometricSupported() async {
    final availableBiometrics = await _localAuthService
        .getAvailableBiometrics();

    return await _localAuthService.deviceSupportBiometric() &&
        await _localAuthService.canCheckBiometrics() &&
        availableBiometrics.isNotEmpty;
  }

  Future<bool> hasEnabledBiometricAuth() async {
    final String savedUsername =
        await getValueFromSecureStorage(usernameKey) ?? '';
    final String savedPassword =
        await getValueFromSecureStorage(passwordKey) ?? '';

    final bool isEnableBiometric =
        savedUsername.isNotEmpty && savedPassword.isNotEmpty;
    return isEnableBiometric;
  }

  Future<bool> biometricAuthenticate() async {
    if (await isBiometricSupported()) {
      return await _localAuthService.authenticate();
    } else {
      return false;
    }
  }

  Future<void> enableBiometricAuth(String username, String pwd) async {
    try {
      await _secureStorageService.setValue(usernameKey, username);
      await _secureStorageService.setValue(passwordKey, pwd);
    } catch (e) {
      print(e);
    }
  }

  Future<void> disableBiometricAuth() async {
    try {
      await _secureStorageService.deleteValue(usernameKey);
      await _secureStorageService.deleteValue(passwordKey);
    } catch (e) {
      print(e);
    }
  }


  Future<void> handleUpdateBiometricData(
    String currentUsername,
    String password,
  ) async {
    if (await hasEnabledBiometricAuth() == true) {
      String savedUsername = await getValueFromSecureStorage(usernameKey) ?? '';

      if (currentUsername == savedUsername) {
        String savedPwd = await getValueFromSecureStorage(passwordKey) ?? '';
        if (savedPwd != password) await _updateBiometricData(password);
      }
    }
  }

  /// Actualiza la contraseña del almacenamiento seguro
  Future<void> _updateBiometricData(String pwd) async {
    try {
      await _secureStorageService.setValue(passwordKey, pwd);
    } catch (e) {
      print(e);
    }
  }

  /// Obtiene un valor del almacenamiento seguro a partir de una clave
  Future<String?> getValueFromSecureStorage(String key) async {
    return await _secureStorageService.getValue(key);
  }
}
