import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';

class BiometricAuthManager{
  static final LocalAuthentication _auth = LocalAuthentication();
  _SupportState _supportState = _SupportState.unknown;
  bool? _canCheckBiometrics;
  List<BiometricType>? _availableBiometrics;
  String _authorized = 'Not Authorized';
  bool _isAuthenticating = false;


  static Future<bool> biometricAvailable(){
   return _auth.isDeviceSupported();
  }


  // Future<void> _checkBiometrics() async {
  //   late bool canCheckBiometrics;
  //   try {
  //     canCheckBiometrics = await auth.canCheckBiometrics;
  //   } on PlatformException catch (e) {
  //     canCheckBiometrics = false;
  //     print(e);
  //   }
  //   if (!mounted) {
  //     return;
  //   }
  //
  //   setState(() {
  //     _canCheckBiometrics = canCheckBiometrics;
  //   });
  // }


  static Future<List<BiometricType>> getAvailableBiometrics() async {
    try {
      return await _auth.getAvailableBiometrics();
    } on PlatformException catch (e) {
      print(e);
    }
    return [];
  }

  // Future<void> _authenticate() async {
  //   bool authenticated = false;
  //   try {
  //     setState(() {
  //       _isAuthenticating = true;
  //       _authorized = 'Authenticating';
  //     });
  //     authenticated = await auth.authenticate(
  //       localizedReason: 'Let OS determine authentication method',
  //       options: const AuthenticationOptions(
  //         stickyAuth: true,
  //       ),
  //     );
  //     setState(() {
  //       _isAuthenticating = false;
  //     });
  //   } on PlatformException catch (e) {
  //     print(e);
  //     setState(() {
  //       _isAuthenticating = false;
  //       _authorized = 'Error - ${e.message}';
  //     });
  //     return;
  //   }
  //   if (!mounted) {
  //     return;
  //   }
  //
  //   setState(
  //           () => _authorized = authenticated ? 'Authorized' : 'Not Authorized');
  // }

  static Future<bool> authenticateWithBiometrics() async {
    bool authenticated = false;
    try {
      authenticated = await _auth.authenticate(
        localizedReason:
        'Scan your to authenticate',
        options: const AuthenticationOptions(
          stickyAuth: false,
          biometricOnly: true,
          useErrorDialogs: true,
        ),
      );
    } on PlatformException catch (e) {
      print(e);
      return false;
    }
    // if (!mounted) {
    //   return;
    // }


   return authenticated;
  }

  // Future<void> _cancelAuthentication() async {
  //   await auth.stopAuthentication();
  //   setState(() => _isAuthenticating = false);
  // }

}

enum _SupportState {
  unknown,
  supported,
  unsupported,
}