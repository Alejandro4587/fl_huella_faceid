import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fl_huella_faceid/global/session_provider.dart';
import 'package:fl_huella_faceid/features/login/view/login_page.dart';

void main() => runApp(
  MultiProvider(
    providers: [ChangeNotifierProvider(create: (_) => SessionNotifier())],
    child: const MyApp(),
  ),
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Biometric Auth',
      home: const LoginPage(),
    );
  }
}
