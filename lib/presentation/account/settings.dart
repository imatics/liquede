import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:liquede/commons/base_scaffold.dart';
import 'package:liquede/commons/reusables.dart';
import 'package:liquede/commons/utils.dart';
import 'package:liquede/extensions/widget.dart';
import 'package:liquede/presentation/account/profile.dart';
import 'package:liquede/presentation/account/security.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(context: context,
    baseAppBar: AppBar(title: const Text("Settings"),centerTitle: true,),
    baseBody: Column(
      children: [
        addSpace(y: 10),
        listItem(Icons.person, "Personal Details", const Icon(Icons.arrow_forward_ios_rounded, size: 14,)).onclickWithRipple(() => goto(context, const ProfilePage())),
        listItem(Icons.settings, "Preferences", const Icon(Icons.arrow_forward_ios_rounded, size: 14,)),
        listItem(Icons.security, "Security & Privacy", const Icon(Icons.arrow_forward_ios_rounded, size: 14,)).onclickWithRipple(() => goto(context, const Security())),
        listItem(Icons.info, "Terms & Conditions", const Icon(Icons.arrow_forward_ios_rounded, size: 14,)),
      ],
    ).paddingX(30),
    );
  }



  Widget listItem(IconData icon, String label , Widget action){
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Icon(icon),
          addSpace(x: 20),
          kText(label),
          const Spacer(),
          action
        ],
      ),
      decoration:  BoxDecoration(
          border: Border(bottom: BorderSide(width: 1, color: Colors.grey[400]!))
      ),
    );
  }

}
