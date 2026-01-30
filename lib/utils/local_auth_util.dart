import 'package:local_auth/local_auth.dart';

class LocalAuthUtil {

  final LocalAuthentication auth = LocalAuthentication();

  Future<bool> deviceSupportBiometric() async {
    return await auth.isDeviceSupported();
  }

  Future<bool> canCheckBiometrics() async {
    return await auth.canCheckBiometrics;
  }

  Future<List<BiometricType>> getAvailableBiometrics() async {
    return await auth.getAvailableBiometrics();
  }

  Future<bool> authenticate() async {
    try {
      return await auth.authenticate(
        localizedReason: 'Usa tu información biométrica para iniciar sesión',
        biometricOnly: true,  
      );
    } catch (e) {
      print("Error de autenticación: $e");
      return false;
    }
  }
}
