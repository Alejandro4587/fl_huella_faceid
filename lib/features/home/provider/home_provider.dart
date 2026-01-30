import 'package:fl_huella_faceid/features/home/home.dart';
import 'package:fl_huella_faceid/global/session_provider.dart';
import 'package:fl_huella_faceid/utils/biometric_auth_util.dart';
import 'package:flutter/material.dart';
import '../../login/view/login_page.dart';

class HomeNotifier with ChangeNotifier {
  late BiometricAuthUtil _biometricAuthUtil;
  late SessionNotifier _sessionNotifier;

  bool supportBiometric = false;
  bool hasBiometricEnable = false;

  HomeNotifier(
    BuildContext context, {
    required BiometricAuthUtil biometricAuthUtil,
  }) {
    _sessionNotifier = context.read<SessionNotifier>();
    _biometricAuthUtil = biometricAuthUtil;

    _biometricAuthUtil.isBiometricSupported().then((value) {
      supportBiometric = value;
      notifyListeners();
    });
    _biometricAuthUtil.hasEnabledBiometricAuth().then((value) {
      hasBiometricEnable = value;
      notifyListeners();
    });
  }

  void handleBiometricAuth() {
    if (hasBiometricEnable) {
      _biometricAuthUtil.disableBiometricAuth();
      hasBiometricEnable = false;
    } else {
      String username = _sessionNotifier.username;
      String password = _sessionNotifier.password;

      if (username.isNotEmpty && password.isNotEmpty) {
        _biometricAuthUtil.enableBiometricAuth(username, password);
        hasBiometricEnable = true;
      }
    }
    notifyListeners();
  }

  void logOutAction(BuildContext context) {
    _sessionNotifier.updateCredentials('', '');
    Navigator.pushReplacement(context, LoginPage.route());
  }
}
