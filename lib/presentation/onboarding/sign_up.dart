import 'package:flutter/material.dart';
import 'package:liquede/commons/base_scaffold.dart';
import 'package:liquede/commons/constants.dart';
import 'package:liquede/commons/reusables.dart';
import 'package:liquede/commons/utils.dart';
import 'package:liquede/extensions/widget.dart';
import 'package:liquede/presentation/commons/bottom_sheet.dart';
import 'package:liquede/presentation/onboarding/login.dart';
import 'package:liquede/presentation/onboarding/terms_and_condition.dart';
import 'package:liquede/presentation/onboarding/welcome_screen.dart';
import 'package:liquede/services/api/base_service.dart';
import 'package:liquede/services/api/user_service.dart';
import 'package:swagger/api.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  late KInputFieldProps firstNameProp;
  late KInputFieldProps lastNameProp;
  late KInputFieldProps emailProp;
  late KInputFieldProps phoneNumberProps;
  late KInputFieldProps passwordProps;

  late FocusNode firstNameFN;
  late FocusNode lastNameFN;
  late FocusNode emailFN;
  late FocusNode phoneNumberFN;
  late FocusNode passwordFN;

  List<KInputFieldProps> props = [];

  @override
  void initState() {
    super.initState();


    firstNameFN = FocusNode();
    lastNameFN = FocusNode();
    emailFN = FocusNode();
    phoneNumberFN = FocusNode();
    passwordFN = FocusNode();

    firstNameProp = KInputFieldProps(
        textEditingController: TextEditingController(),
        validators: [validateField],
        label: "First Name",
        hint: "John",
        focusNode: firstNameFN,
        nextFocusNode: lastNameFN,
        fillColor: Colors.grey[100]);
    lastNameProp = KInputFieldProps.copyFrom(firstNameProp)
      ..validators = [validateField]
      ..textEditingController = TextEditingController()
      ..label = "Surname"
      ..focusNode = lastNameFN
      ..nextFocusNode = emailFN
    ..hint = "Doe";
    emailProp = KInputFieldProps.copyFrom(firstNameProp)
      ..validators = [validateEmail]
      ..inputType = TextInputType.emailAddress
      ..textEditingController = TextEditingController()
      ..focusNode = emailFN
      ..nextFocusNode = phoneNumberFN
      ..hint = "johndoe@mail.com"
      ..label = "Email";
    phoneNumberProps = KInputFieldProps.copyFrom(firstNameProp)
      ..validators = [validateField]
      ..inputType = TextInputType.phone
      ..textEditingController = TextEditingController(text: "+22350097951")
      ..focusNode = phoneNumberFN
      ..nextFocusNode = passwordFN
      ..hint = "080XXXXXXXXX"
      ..label = "Mobile Number";
    passwordProps = KInputFieldProps.copyFrom(firstNameProp)
      ..validators = [validatePassword]
      ..isPassword = true
      ..inputType = TextInputType.visiblePassword
      ..textEditingController = TextEditingController()
      ..focusNode = passwordFN
      ..hint = "Enter password"
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
    return BaseScaffold(
      context: context,
      baseAppBar: AppBar(toolbarHeight: 0,),
      baseBody: Builder(builder: (context) {
        return SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              addSpace(y: 50),
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
                        onTap: () => goto(context, const TermsAndConditionScreen()))
                  ], style: KTextStyle(color: black)),
                ],
              ),
              // addSpace(y: 10),
              kText("Or Sign up via").paddingMerge(b: 20, t: 10).center,
              addSpace(y: 10),
              kText("I already have an account. Sign In").onclickWithRipple(() => gotoAndClear(context, const LoginScreen())).center,
              addSpace(y: 10),
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
      Register model = Register()
      ..firstName = firstNameProp.textEditingController?.text
      ..middleName = ""
      ..lastName = lastNameProp.textEditingController?.text
      ..password = passwordProps.textEditingController?.text
      ..email = emailProp.textEditingController?.text
      ..phoneNumber = phoneNumberProps.textEditingController?.text;
      UserService.I(context).register(model).listen((event) {
        event.handleState(context);
        event.performOnSuccess((p0) {
          showVerify(context, validateOTP);
        });
      });

    }
  }


  void validateOTP(String otp){
    if(_key.currentState!.validate()){
      UserService.I(context).verifyUser(otp).listen((event) {
        print("$event");
        event.handleState(context);
        event.performOnSuccess((p0) {
           goto(context, const WelcomeScreen());
        });
      }).onError((obj, trace){
        debugPrint(obj);
        debugPrint(trace);
        debugPrint("an error occurred");
      });

    }
  }

}
void showVerify(BuildContext context, Function(String) onVerify) {
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
            onPressed: () => onVerify(controller.text),
            child: kText("Submit", color: white, weight: FontWeight.bold),
            color: black,
          ).stretchSize(h: 45),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              kText("Change number", fontSize: 12, weight: FontWeight.bold).onclickWithRipple(() => goBack(context)),
              kText("Resend Code", fontSize: 12, weight: FontWeight.bold).onclickWithRipple(() => resendOTP(context)),
            ],
          ).paddingY(20),
        ],
      ),
      hFactor: 0.6);
}


void resendOTP(BuildContext context){
  UserService.I(context).requestOTP().listen((event) {
    event.handleStateAndPerformOnSuccess(context, (data){
     showSuccessPopUp(context, "OTP sent!");
    });

  });
}
