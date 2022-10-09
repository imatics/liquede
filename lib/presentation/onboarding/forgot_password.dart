import 'package:flutter/material.dart';
import 'package:liquede/commons/base_scaffold.dart';
import 'package:liquede/commons/constants.dart';
import 'package:liquede/commons/reusables.dart';
import 'package:liquede/commons/size_config.dart';
import 'package:liquede/commons/utils.dart';
import 'package:liquede/extensions/string.dart';
import 'package:liquede/extensions/widget.dart';
import 'package:liquede/presentation/dashboard/dashboard.dart';
import 'package:liquede/presentation/dashboard/home.dart';
import 'package:liquede/presentation/onboarding/sign_up.dart';
import 'package:liquede/services/api/base_service.dart';
import 'package:liquede/services/api/user_service.dart';
import 'package:swagger/api.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final _key = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    emailProps = KInputFieldProps(
        hint: "Enter email or Phone number",
        textEditingController: TextEditingController(),
        label: "Email",
        validators: [validateEmail],
        inputType: TextInputType.emailAddress);
    newPassProp = KInputFieldProps(
      hint: "Enter new Password",
      textEditingController: TextEditingController(),
      label: "New Password",
      validators: [validateField],
      isPassword: true,
    );
    confirmPassProp = KInputFieldProps(
        hint: "Enter password again",
        validators: [
          (e) => newPassProp.textEditingController?.text == e
              ? null
              : "Password mismatch"
        ],
        textEditingController: TextEditingController(),
        label: "Confirm Password",
        isPassword: true);
  }

  late KInputFieldProps emailProps;
  late KInputFieldProps newPassProp;
  late KInputFieldProps confirmPassProp;
  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      context: context,
      baseAppBar: AppBar(),
      baseBody: LayoutBuilder(
        builder: (context, constraints) => SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              addSpace(y: 15),
              kText("Hello!", weight: FontWeight.bold),
              addSpace(y: 15),
              kText("Lets get you \nback in",
                  weight: FontWeight.w900, fontSize: 35),
              addSpace(y: 55),
              EditTextField(emailProps),
              addSpace(y: 20),
              EditTextField(newPassProp),
              addSpace(y: 20),
              EditTextField(confirmPassProp),
              addSpace(y: 20),
              Spacer(),
              MaterialButton(
                onPressed: requestOtp,
                color: black,
                child: kText("Update password", color: white),
              ).stretchSize(h: 45),
              addSpace(y: 30),
              addSpace(y: 40),
            ],
          ).withForm(_key).paddingX(20).stretchSize(h: getPercentageHeight(90)),
        ),
      ),
    );
  }

  resetPassword() {
    showVerify(context, (p0) {
      UserService.I(context)
          .resetPassword(PasswordReset()
            ..code = p0
            ..newPassword = newPassProp.textEditingController?.text)
          .handleStateAndPerformOnSuccess(context, (data) {
        showSuccessPopUp(context, "Password Reset Successful", onClose: () {
          loginUser();
        });
      });
    });
  }

  requestOtp() {
    if (_key.currentState?.validate() == true) {
      UserService.I(context)
          .requestOTP(email: emailProps.textEditingController?.text)
          .handleStateAndPerformOnSuccess(context, (data) {
        resetPassword();
      });
    }
  }

  loginUser() {
    UserService.I(context)
        .login(LoginModel()
          ..password = newPassProp.textEditingController?.text
          ..email = emailProps.textEditingController?.text)
        .handleStateAndPerformOnSuccess(context, (data) {
      gotoAndClear(context, const Home());
    }, message: "Logging you in\nJust a sec");
  }
}
