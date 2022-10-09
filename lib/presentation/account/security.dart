import 'package:flutter/material.dart';
import 'package:liquede/commons/base_scaffold.dart';
import 'package:liquede/commons/biometric_auth.dart';
import 'package:liquede/commons/constants.dart';
import 'package:liquede/commons/reusables.dart';
import 'package:liquede/commons/utils.dart';
import 'package:liquede/extensions/widget.dart';
import 'package:liquede/presentation/account/change_password.dart';
import 'package:liquede/services/app_preference.dart';
import 'package:local_auth/local_auth.dart';

class Security extends StatefulWidget {
  const Security({Key? key}) : super(key: key);

  @override
  State<Security> createState() => _SecurityState();
}

class _SecurityState extends State<Security> {
  late AppPreference pref;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pref = AppPreference.I(context);
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      context: context,
      title: "Security",
      baseBody: Column(
        children: [
          addSpace(y: 10),
          listItem(
              Icons.password,
              "Change Password",
              const Icon(
                Icons.arrow_forward_ios_rounded,
                size: 14,
              )).onclickWithRipple(() => goto(
              context,
              const ChangePassword(
                type: ChangePasswordType.password,
              ))),
          listItem(
              Icons.wallet,
              "Change Pin",
              const Icon(
                Icons.arrow_forward_ios_rounded,
                size: 14,
              )).onclickWithRipple(() => goto(
              context,
              const ChangePassword(
                type: ChangePasswordType.pin,
              ))),
          listItem(
              Icons.fingerprint,
              "Enable Biometric",
              Switch(
                  value: pref.biometricEnabled,
                  activeColor: black,
                  onChanged: (b) => validateBiometricAvailable(b))).onclickWithRipple(() => validateBiometricAvailable(!pref.biometricEnabled))
        ],
      ).paddingX(30),
    );
  }

  Widget listItem(IconData icon, String label, Widget action) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Icon(icon),
          addSpace(x: 20),
          kText(label),
          const Spacer(),
          action
        ],
      ),
      decoration: BoxDecoration(
          border:
              Border(bottom: BorderSide(width: 0.5, color: Colors.grey[300]!))),
    );
  }

  void validateBiometricAvailable(bool v) async {
    bool hasBiometric = await BiometricAuthManager.biometricAvailable();
    List<BiometricType> types =
        await BiometricAuthManager.getAvailableBiometrics();
    if (hasBiometric && types.isNotEmpty) {
      if (await BiometricAuthManager.authenticateWithBiometrics()) {
        pref.biometricEnabled = v;
        setState(() {});
      }
    }
  }
}
