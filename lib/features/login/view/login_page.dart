import 'package:fl_huella_faceid/features/login/widgets/login_body.dart';
import 'package:fl_huella_faceid/utils/biometric_auth_util.dart';
import 'package:flutter/material.dart';

import '../provider/provider.dart';


/// {@template login_page}
/// A description for LoginPage
/// {@endtemplate}
class LoginPage extends StatelessWidget {
  /// {@macro login_page}
  const LoginPage({super.key});

  /// The static route for LoginPage
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const LoginPage());
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LoginNotifier(
        context,
        biometricAuthUtil: BiometricAuthUtil(),
      ),
      child: const Scaffold(
        body: LoginView(),
      ),
    );
  }
}

/// {@template login_view}
/// Displays the Body of LoginView
/// {@endtemplate}
class LoginView extends StatelessWidget {
  /// {@macro login_view}
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return const LoginBody();
  }
}
