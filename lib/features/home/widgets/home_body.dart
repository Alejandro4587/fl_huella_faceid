import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/provider.dart';


class HomeBody extends StatelessWidget {

  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeNotifier>(
      builder: (context, state, child) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (state.supportBiometric)
                ElevatedButton(
                  onPressed: state.handleBiometricAuth,
                  child: Text(
                    '${state.hasBiometricEnable ? 'Deshabilitar' : 'Habilitar'} autenticación biométrica',
                  ),
                ),
              ElevatedButton(
                onPressed: () => state.logOutAction(context),
                child: const Text('Cerrar sesión'),
              ),
            ],
          ),
        );
      },
    );
  }
}
