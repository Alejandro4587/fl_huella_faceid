import 'package:fl_huella_faceid/features/home/widgets/home_body.dart';
import 'package:fl_huella_faceid/utils/biometric_auth_util.dart';
import 'package:flutter/material.dart';
import '../provider/provider.dart';


class HomePage extends StatelessWidget {

  const HomePage({super.key});

  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const HomePage());
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeNotifier(
        context,
        biometricAuthUtil: BiometricAuthUtil(),
      ),
      child: Scaffold(
        appBar: AppBar(title: const Text('Home')),
        body: const HomeView(),
      ),
    );
  }
}

class HomeView extends StatelessWidget {

  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const HomeBody();
  }
}
