import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:liquede/commons/base_scaffold.dart';
import 'package:liquede/commons/constants.dart';
import 'package:liquede/extensions/string.dart';
import 'package:liquede/extensions/widget.dart';
import 'package:liquede/presentation/dashboard/loan.dart';
import 'package:liquede/presentation/dashboard/savings.dart';
import 'package:liquede/presentation/model/notification.dart';
import 'package:liquede/presentation/payment/payment_home.dart';

import 'dashboard.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

List<BottomNavigationBarItem> bottomBarItem = [
   BottomNavigationBarItem(icon: ImageIcon(AssetImage("home_icon".imagePng)).paddingY(8), label: "Home"),
   BottomNavigationBarItem(icon: ImageIcon(AssetImage("pay_icon".imagePng)).paddingY(8), label: "Pay"),
   // BottomNavigationBarItem(icon: ImageIcon(AssetImage("invest_icon".imagePng)).paddingY(8), label: "Invest"),
   BottomNavigationBarItem(icon: ImageIcon(AssetImage("savings_icon".imagePng)).paddingY(8), label: "saving"),
   BottomNavigationBarItem(icon: ImageIcon(AssetImage("loan_icon".imagePng)).paddingY(8), label: "Loans"),
];

class _HomeState extends State<Home> {


  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      removeAppbar: true,
      context: context,
      baseBody: NotificationListener<WidgetNotification>(
        onNotification: handleNotification,
          child: SafeArea(child: pages[_currentIndex])),
      bottomBar: SizedBox(
        height: 65,
        child: BottomAppBar(
          child: BottomNavigationBar(
            items: bottomBarItem,
            type: BottomNavigationBarType.fixed,
            unselectedFontSize: 10,
            selectedFontSize: 10,
            elevation: 4,
            iconSize: 20,
            backgroundColor: white,
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.grey[500],
            onTap: updateSelected,
            currentIndex: _currentIndex,
          ),
        ),
      ),
    );
  }

  void updateSelected(int position) {
    _currentIndex = position;
    setState(() {});
  }

  bool handleNotification(WidgetNotification notification){
    updateSelected(notification.index);
return true;
  }

  List<Widget> pages = [
     DashBoard(),
     PaymentHome(),
    // const DashBoard(),
     Savings(),
     LoanScreen(),
  ];

}
