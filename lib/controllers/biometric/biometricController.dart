import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';

class Biometric {
  static final _auth = LocalAuthentication();
  static Future<bool> authenticate() async {
    final bool canAuthenticateWithBiometrics = await _auth.canCheckBiometrics;
    final canAuthenticate =
        canAuthenticateWithBiometrics || await _auth.isDeviceSupported();
    if (!canAuthenticate) {
      return false;
    }
    try {
      return await _auth.authenticate(
          localizedReason: 'Scan Fingerprint to Authenticate',
          options: const AuthenticationOptions(
            useErrorDialogs: true,
            stickyAuth: true,
          ));
    } on PlatformException catch (e) {
      print(e.toString());
      return false;
    }
  }
}
