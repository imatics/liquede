import 'package:flutter/material.dart';
import 'package:liquede/commons/constants.dart';
import 'package:liquede/commons/reusables.dart';
import 'package:liquede/commons/size_config.dart';
import 'package:liquede/commons/utils.dart';
import 'package:liquede/extensions/widget.dart';
import 'package:liquede/presentation/commons/bottom_sheet.dart';
import 'package:liquede/presentation/onboarding/terms_and_condition.dart';
import 'package:liquede/extensions/others.dart';
import 'package:liquede/presentation/onboarding/onboarding.dart';
import 'package:liquede/presentation/onboarding/welcome_screen.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  late KInputFieldProps
      firstNameProp; // = KInputFieldProps(hint: "First Name", textEditingController: TextEditingController(), validators: [validateName]);
  late KInputFieldProps lastNameProp; // = KInputFieldProps.copyFrom(props);
  late KInputFieldProps emailProp; // = KInputFieldProps();
  late KInputFieldProps phoneNumberProps; // = KInputFieldProps();
  late KInputFieldProps passwordProps; // = KInputFieldProps();

  List<KInputFieldProps> props = [];

  @override
  void initState() {
    super.initState();

    firstNameProp = KInputFieldProps(
        textEditingController: TextEditingController(),
        validators: [validateField],
        label: "First Name",
        fillColor: Colors.grey[100]);
    lastNameProp = KInputFieldProps.copyFrom(firstNameProp)
      ..validators = [validateField]
      ..textEditingController = TextEditingController()
      ..label = "Surname";
    emailProp = KInputFieldProps.copyFrom(firstNameProp)
      ..validators = [validateEmail]
      ..inputType = TextInputType.emailAddress
      ..textEditingController = TextEditingController()
      ..label = "Email";
    phoneNumberProps = KInputFieldProps.copyFrom(firstNameProp)
      ..validators = [validatePhone]
      ..inputType = TextInputType.phone
      ..textEditingController = TextEditingController()
      ..label = "Mobile Number";
    passwordProps = KInputFieldProps.copyFrom(firstNameProp)
      ..validators = [validatePassword]
      ..isPassword = true
      ..inputType = TextInputType.visiblePassword
      ..textEditingController = TextEditingController()
      ..label = "Password";
    props.add(firstNameProp);
    props.add(lastNameProp);
    props.add(emailProp);
    props.add(phoneNumberProps);
    props.add(passwordProps);
  }

  bool _checkboxState = false;
  final _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar,
      body: Builder(builder: (context) {
        return SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              kText("Hey there!", weight: FontWeight.bold),
              addSpace(y: 20),
              kText("Let's get \nliquede",
                  weight: FontWeight.w900, fontSize: 35),
              addSpace(y: 30),
              ...props.map((e) => EditTextField(e)
                  .paddingY(10)),
              addSpace(y: 20),
              MaterialButton(
                onPressed: () => attemptSignUp(context),
                child: kText("Sign Up", color: white, weight: FontWeight.bold),
                color: black,
              ).stretchSize(h: 55),
              addSpace(y: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Checkbox(
                      value: _checkboxState,
                      onChanged: (e) {
                        setState(() {
                          _checkboxState = !_checkboxState;
                        });
                      }),
                  kRichText([
                    ManyText(text: "I agree to Liduede's"),
                    ManyText(
                        text: " terms and conditions ",
                        style: KTextStyle(color: kAppYellow),
                        onTap: () => goto(context, TermsAndConditionScreen()))
                  ], style: KTextStyle(color: black)),
                ],
              ),
              // addSpace(y: 10),
              kText("Or Sign up via").paddingMerge(b: 20, t: 10).center,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  icons(Icons.facebook),
                  icons(Icons.facebook),
                  icons(Icons.facebook),
                ],
              )
            ],
          ).withForm(_key).paddingX(20),
        );
      }),
    );
  }

  Widget icons(IconData data) {
    return Container(
      height: 45,
      width: 45,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: IconButton(
        icon: Icon(data),
        onPressed: () {},
      ),
      decoration: BoxDecoration(
          shape: BoxShape.circle, border: Border.all(width: 1, color: black)),
    );
  }

  void attemptSignUp(BuildContext context){
    if(_key.currentState!.validate()){
      showVerify(context, ()=> goto(context, const WelcomeScreen()));
    }
  }

}
void showVerify(BuildContext context, Function() onVerify) {
  TextEditingController controller = TextEditingController();
  launchBottomSheetFull(
      context,
      Column(
        children: [
          kText("Lets verify your \nmobile number",
              weight: FontWeight.w900, fontSize: 24)
              .paddingX(40),
          addSpace(y: 20),
          kText("Enter the code you just received"),
          addSpace(y: 30),
          EditTextField(KInputFieldProps(
              textEditingController: controller,
              fillColor: Colors.grey[200],
              textAlign: TextAlign.center,
              isPassword: true,
              style:
              KTextStyle(weight: FontWeight.bold, fontSize: 24, style: const TextStyle(letterSpacing: 3)).build)),
          addSpace(y: 20),
          MaterialButton(
            onPressed: onVerify,
            child: kText("Submit", color: white, weight: FontWeight.bold),
            color: black,
          ).stretchSize(h: 45),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              kText("Change number", fontSize: 14, weight: FontWeight.bold),
              kText("Resend Code", fontSize: 14, weight: FontWeight.bold),
            ],
          ).paddingY(20),
        ],
      ),
      hFactor: 0.8);
}
