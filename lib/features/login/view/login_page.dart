import 'package:fl_huella_faceid/features/login/widgets/login_body.dart';
import 'package:fl_huella_faceid/utils/biometric_auth_util.dart';
import 'package:flutter/material.dart';
import '../provider/provider.dart';

class LoginPage extends StatelessWidget {

  const LoginPage({super.key});


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

class LoginView extends StatelessWidget {

  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return const LoginBody();
  }
}
