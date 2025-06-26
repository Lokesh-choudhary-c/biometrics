// ignore_for_file: avoid_print

import 'package:local_auth/local_auth.dart';

class AuthService {
  final LocalAuthentication _auth = LocalAuthentication();

  Future<bool> authenticate() async {
    try {
      final bool canCheck = await _auth.canCheckBiometrics;
      final bool isDeviceSupported = await _auth.isDeviceSupported();

      if (!canCheck || !isDeviceSupported) return false;

      final bool authenticated = await _auth.authenticate(
        localizedReason: 'Authenticate using biometrics',
        options: const AuthenticationOptions(
          biometricOnly: false,
          stickyAuth: true,
          useErrorDialogs: true,
        ),
      );

      return authenticated;
    } catch (e) {
      print('Authentication Error: $e');
      return false;
    }
  }
}
