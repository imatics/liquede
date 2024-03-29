import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:liquede/commons/base_scaffold.dart';
import 'package:liquede/commons/biometric_auth.dart';
import 'package:liquede/commons/constants.dart';
import 'package:liquede/commons/reusables.dart';
import 'package:liquede/commons/size_config.dart';
import 'package:liquede/commons/utils.dart';
import 'package:liquede/extensions/widget.dart';
import 'package:liquede/extensions/string.dart';
import 'package:liquede/presentation/commons/bottom_sheet.dart';
import 'package:liquede/presentation/dashboard/home.dart';
import 'package:liquede/presentation/onboarding/forgot_password.dart';
import 'package:liquede/presentation/onboarding/sign_up.dart';
import 'package:liquede/services/api/base_service.dart';
import 'package:liquede/services/api/user_service.dart';
import 'package:liquede/services/app_preference.dart';
import 'package:swagger/api.dart';



class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {




  final _key = GlobalKey<FormState>();





  @override
  void initState() {
    super.initState();

    AppPreference.I(context).seenAppTour = true;

    email = KInputFieldProps(
        hint: "Email or mobile number",
        // textEditingController: TextEditingController(text: "otuemeemmanuel@gmail.com"),
        textEditingController: TextEditingController(),
        label: "Email",
        validators: [validateEmail],
        inputType: TextInputType.emailAddress);
    password = KInputFieldProps(
        hint: "Enter Password",
        validators: [validatePassword],
        // textEditingController: TextEditingController(text: "123456"),
        textEditingController: TextEditingController(),
        label: "Password",
        isPassword: true);
  }

  late KInputFieldProps email;
  late KInputFieldProps password;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: BaseScaffold(
        context: context,
        baseAppBar: AppBar(
          toolbarHeight: 0,
          automaticallyImplyLeading: false,
        ),
        baseBody: LayoutBuilder(
          builder: (context, constraints) => SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                addSpace(y: 65),
                kText("Hello!", weight: FontWeight.bold),
                addSpace(y: 15),
                kText("Glad you're \nback!",
                    weight: FontWeight.w900, fontSize: 35),
                addSpace(y: 15),
                Image.asset("padlock".imagePng).center.paddingY(35).stretch,
                addSpace(y: 20),
                Row(
                  children: [
                    EditTextField(email).stretch,
                    Row(
                      children: [
                        addSpace(x: 5),
                        Image.asset("biometric".imagePng, height: 30,)
                            .paddingXY(y: 5, x: 5)
                            .onclickWithRipple(loginSilent),
                      ],
                    ).hideIf(!AppPreference.I(context).biometricEnabled)
                  ],
                ),
                addSpace(y: 20),
                EditTextField(password).stretchSize(h: 50),
                addSpace(y: 20),
                MaterialButton(
                  onPressed: login,
                  color: black,
                  child: kText("Login", color: white),
                ).stretchSize(h: 45),
                addSpace(y: 30),
                kText("I forgot my password", fontSize: 13).onclickWithRipple(() => doForgotPassword(context)).center,
                addSpace(y: 10),
                kText("I don't have an account. Sign Up", fontSize: 13).onclickWithRipple(() => gotoAndClear(context, const SignUp())).center,
                addSpace(y: 40),
              ],
            ).withForm(_key).paddingX(20).stretchSize(h: getPercentageHeight(90)),
          ),
        ),
      ),
    );
  }

  void login() {
    if(_key.currentState?.validate() == true){
      LoginModel model = LoginModel()
        ..email = email.textEditingController?.value.text
        ..password = password.textEditingController?.value.text;
    UserService.I(context).login(model).listen((event) {
      event.handleState(context);
      event.performOnSuccess((userData) {
      AppPreference.I(context).token = userData?.token??"";
      AppPreference.I(context).hasLoggedIn = true;
      AppPreference.I(context).username = model.email!;
      AppPreference.I(context).password = model.password!;
      goto(context, const Home());
      });
    });
  }
  }


  void loginSilent() async {
    if(await BiometricAuthManager.authenticateWithBiometrics()){
      LoginModel model = LoginModel()
        ..email = AppPreference.I(context).username
        ..password = AppPreference.I(context).password;
    UserService.I(context).login(model).listen((event) {
      event.handleState(context);
      event.performOnSuccess((userData) {
      AppPreference.I(context).token = userData?.token??"";
      AppPreference.I(context).hasLoggedIn = true;
      goto(context, const Home());
      });
    });
  }
  }


}


void showForgotPasswordModal(BuildContext context, Function(String) onVerify) {
  TextEditingController controller = TextEditingController();
  launchBottomSheetFull(
      context,
      Column(
        children: [
          kText("Lets reset your \npassword",
              weight: FontWeight.w900, fontSize: 24)
              .paddingX(40),
          addSpace(y: 20),
          kText("Enter your email"),
          addSpace(y: 30),
          EditTextField(KInputFieldProps(
              textEditingController: controller,
              fillColor: Colors.grey[200],
              textAlign: TextAlign.center,
              inputType: TextInputType.emailAddress,
              validators: [validateEmail],
              style:
              KTextStyle(weight: FontWeight.bold, fontSize: 24, style: const TextStyle(letterSpacing: 3)).build)),
          addSpace(y: 20),
          MaterialButton(
            onPressed: () => onVerify(controller.text),
            child: kText("Submit", color: white, weight: FontWeight.bold),
            color: black,
          ).stretchSize(h: 45),
        ],
      ),
      hFactor: 0.6);
}

void doForgotPassword(BuildContext context){
  goto(context, const ForgotPassword());
  return;


}

