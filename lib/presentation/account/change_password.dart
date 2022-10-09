import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:liquede/commons/base_scaffold.dart';
import 'package:liquede/commons/reusables.dart';
import 'package:liquede/commons/size_config.dart';
import 'package:liquede/commons/utils.dart';
import 'package:liquede/extensions/widget.dart';
import 'package:liquede/services/api/base_service.dart';
import 'package:liquede/services/api/user_service.dart';
import 'package:swagger/api.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key, required this.type}) : super(key: key);

  final ChangePasswordType type;

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final _key = GlobalKey<FormState>();

  late KInputFieldProps oldPassProps;
  late KInputFieldProps newPassProp;
  late KInputFieldProps confirmPassProp;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    oldPassProps = KInputFieldProps(
        hint: "Enter old ${widget.type.name}",
        textEditingController: TextEditingController(),
        validators: getValidator(),
        isPassword: true,
        inputFormatter: getFormatter(),
        inputType: getInputType());
    newPassProp = KInputFieldProps(
      hint: "Enter new ${widget.type.name}",
      textEditingController: TextEditingController(),
      validators: getValidator(),
      inputFormatter: getFormatter(),
      inputType: getInputType(),
      isPassword: true,
    );
    confirmPassProp = KInputFieldProps(
      inputFormatter: getFormatter(),
        hint: "Enter new ${widget.type.name} again",
        validators: [
          (e) => newPassProp.textEditingController?.text == e
              ? null
              : "${widget.type.name} mismatch"
        ],
        textEditingController: TextEditingController(),
        inputType: getInputType(),
        isPassword: true);
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      context: context,
      title: "Change ${widget.type.name}",
      baseBody: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            addSpace(y: 55),
            kText("Current ${widget.type.name}", fontSize: 12).paddingAll(5),
            EditTextField(oldPassProps),
            addSpace(y: 25),
            kText("New ${widget.type.name}", fontSize: 12).paddingAll(5),
            EditTextField(newPassProp),
            addSpace(y: 25),
            kText("Confirm ${widget.type.name}", fontSize: 12).paddingAll(5),
            EditTextField(confirmPassProp),
            addSpace(y: 25),
            const Spacer(),
            appBtn("Change ${widget.type.name}", widget.type == ChangePasswordType.password ? updatePassword: updatePin).stretchSize(h: 45),
            addSpace(y: 30),
            addSpace(y: 40),
          ],
        ).withForm(_key).paddingX(20).stretchSize(h: getPercentageHeight(90)),
      ),
    );
  }

  void updatePassword() {
    if(_key.currentState?.validate() == true){
      UserService.I(context)
          .changePassword(PasswordResetModel()
            ..existingPassword = oldPassProps.textEditingController?.text
            ..newPassword = newPassProp.textEditingController?.text)
          .listen((event) {
        event.handleStateAndPerformOnSuccess(context, (p0) {
          showSuccessPopUp(context, event.message,
              onClose: () => goBack(context));
        }, message: "updating info");
      });
    }
  }

  void updatePin() {
    if(_key.currentState?.validate() == true){
      // WalletService.I(context).(WalletPinModel()
      //       .. = oldPassProps.textEditingController?.text
      //       ..newPassword = newPassProp.textEditingController?.text)
      //     .listen((event) {
      //   event.handleStateAndPerformOnSuccess(context, (p0) {
      //     showSuccessPopUp(context, event.message, onClose: () => goBack(context));
      //   }, message: "updating info");
      // });
      }
  }



  List<FormFieldValidator<String>> getValidator(){
    if(widget.type == ChangePasswordType.pin){
      return  [(e){
        if(e?.length != 4){
          return "Please enter 4 digit pin";
        }
      }];
    }

      return [validatePassword];
  }



  List<TextInputFormatter> getFormatter(){
    if(widget.type == ChangePasswordType.pin){
      return  [LengthLimitingTextInputFormatter(4), FilteringTextInputFormatter.digitsOnly];
    }
      return [];
  }

  TextInputType getInputType(){
    if(widget.type == ChangePasswordType.pin){
      return  TextInputType.number;
    }
      return TextInputType.text;
  }
}


enum ChangePasswordType{
  pin,
  password,
}
