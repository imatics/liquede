import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:liquede/commons/base_scaffold.dart';
import 'package:liquede/commons/constants.dart';
import 'package:liquede/commons/reusables.dart';
import 'package:liquede/commons/size_config.dart';
import 'package:liquede/commons/utils.dart';
import 'package:liquede/extensions/widget.dart';
import 'package:liquede/extensions/string.dart';
import 'package:liquede/presentation/dashboard/home.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    super.initState();
    email = KInputFieldProps(
        hint: "Email or mobile number",
        textEditingController: TextEditingController(),
        label: "Email or mobile number",
        inputType: TextInputType.emailAddress);
    password = KInputFieldProps(
        hint: "Password",
        textEditingController: TextEditingController(),
        label: "Password",
        isPassword: true);
  }

  late KInputFieldProps email;
  late KInputFieldProps password;
  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      context: context,
      baseAppBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      baseBody: LayoutBuilder(
        builder: (context, constraints) => SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              addSpace(y: 15),
              kText("Hello!", weight: FontWeight.bold),
              addSpace(y: 15),
              kText("Glad you're \nback!",
                  weight: FontWeight.w900, fontSize: 35),
              addSpace(y: 15),
              Image.asset("padlock".imagePng).center.paddingY(35).stretch,
              addSpace(y: 15),
              Row(
                children: [
                  EditTextField(email).stretch,
                  Image.asset("biometric".imagePng)
                      .paddingXY(y: 5, x: 20)
                      .onclickWithRipple(doBiometricLogin)
                ],
              ).stretchSize(h: 50),
              addSpace(y: 10),
              EditTextField(password).stretchSize(h: 45),
              addSpace(y: 20),
              MaterialButton(
                onPressed: login,
                color: black,
                child: kText("Login", color: white),
              ).stretchSize(h: 45),
              addSpace(y: 30),
              kText("I forgot my password").center,
              addSpace(y: 40),
            ],
          ).paddingX(20).stretchSize(h: getPercentageHeight(90)),
        ),
      ),
    );
  }

  void login() {
    goto(context, const Home());
  }
}

void doBiometricLogin() {}
