import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:liquede/commons/base_scaffold.dart';
import 'package:liquede/commons/reusables.dart';
import 'package:liquede/extensions/widget.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return BaseScaffold(context: context,
    title: "Personal Details",
    baseBody: SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Container(
            height: 80,
            width: 80,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.black, width: 1)
            ),
            child: const Icon(Icons.person, size: 50,)),
         addSpace(y: 30),
         getInput("First Name", KInputFieldProps(textEditingController: TextEditingController(text: "John"))),
         getInput("Middle Name", KInputFieldProps(textEditingController: TextEditingController(text: "Vincent"))),
         getInput("Last Name", KInputFieldProps(textEditingController: TextEditingController(text: "Doe"))),
         getInput("Email", KInputFieldProps(textEditingController: TextEditingController(text: "Johnv@gmail.com"))),
         getInput("Mobile Number", KInputFieldProps(textEditingController: TextEditingController(text: "08141791104"))),
         getInput("Birthday", KInputFieldProps(textEditingController: TextEditingController(text: "22/12/1991"))),

        ],
      ),
    ),);
  }
}



Widget getInput(String title,KInputFieldProps props){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      kText(title, weight: FontWeight.w400, fontSize: 14),
      addSpace(y: 5),
      EditTextField(props..enabled = false).stretchSize(h: 50),
      addSpace(y: 30),
    ],
  ).stretchSize(h: 105);
}
