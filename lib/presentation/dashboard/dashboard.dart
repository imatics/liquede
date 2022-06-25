import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:liquede/commons/base_scaffold.dart';
import 'package:liquede/commons/constants.dart';
import 'package:liquede/commons/reusables.dart';
import 'package:liquede/commons/extenstions.dart';
import 'package:liquede/extensions/string.dart';
import 'package:liquede/commons/utils.dart';
import 'package:liquede/extensions/widget.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:liquede/presentation/history.dart';
import 'package:liquede/presentation/model/notification.dart';
import 'package:liquede/presentation/settings.dart';
import 'package:liquede/presentation/slipcard.dart';


class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {


  List<String> balanceTypes = ["Net Worth", "LiquedeFlex", "Savings", "Investments"];
  int _selectedBalanceType = 0;



  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      context: context,
      networkSateAware: false,
      drawer: buildDrawer(),
      // removeAppbar: true,
      baseAppBar: AppBar(actions: [ kText("Hi Pade", weight: FontWeight.bold, fontSize: 13).paddingRight(20).center],),
      baseBody: Container(
        color: Colors.grey[200],
        child: Column(
          children: [
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     IconButton(onPressed: () {  }, icon: const Icon(Icons.menu),),
            //     kText("Hi Pade", weight: FontWeight.bold, fontSize: 13).paddingRight(20)
            //   ],
            // ),
            Expanded(child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  balanceCard(),
                  addSpace(y: 30),
                  chartCard(),
                  addSpace(y: 30),
                  kText("Frequent Transactions", weight: FontWeight.bold, fontSize: 20).left.paddingMerge(l:20, b: 10),
                  frequentTransaction(),
                  addSpace(y: 30),
                  getLoanCard(),
                  addSpace(y: 30),
                  startSavingCard(),
                  addSpace(y: 30),
                  getLiquidCard(),
                  addSpace(y: 30),

                ],
              ),
            ))
          ],
        ),
      ),
    );
  }


  Widget getLoanCard(){
    return Material(
      elevation: 1,
      borderRadius: BorderRadius.circular(12),
      child:Row(
        children: [
          Expanded(
            flex: 8,
              child:Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              kText("Get an Instant Loan", fontSize: 23, weight: FontWeight.bold).paddingBottom(5),
              kText("You deserve to be liquid. Get up to ${nairaSymbol}50,000 in 5 minutes", fontSize: 15, spacing: 0.5, height: 1.4),
              addSpace(y: 10),
              MaterialButton(onPressed: () => switchToLoan(context), child: kText("Get Loan", color: white),color: black,).stretchWith(Axis.horizontal).paddingRight(30)
            ],
          ),),
          const Spacer(flex: 5,)
        ],
      ).paddingAll(20),
    );
  }


  Widget startSavingCard(){
    return Material(
      elevation: 1,
      borderRadius: BorderRadius.circular(12),
      child:Row(
        children: [
          Expanded(flex: 3, child: Image.asset("target".imagePng).paddingLeft(20),),
          Expanded(
            flex: 7,
              child:Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              kText("Smash Your Goals", fontSize: 23, weight: FontWeight.bold).paddingBottom(5),
              kText("Liquede can help you save towards targets. Try it out now", fontSize: 15, spacing: 0.5, height: 1.4, a: TextAlign.right),
              addSpace(y: 10),
              MaterialButton(onPressed: switchToSavings, child: kText("Start Saving", color: white),color: black,).stretchWith(Axis.horizontal).paddingLeft(40)
            ],
          ),),
        ],
      ).paddingAll(20),
    );
  }


  Widget getLiquidCard(){
    return Material(
      elevation: 1,
      borderRadius: BorderRadius.circular(12),
      child:Row(
        children: [
          Expanded(
            flex: 7,
            child:Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                kText("A Card that does more", fontSize: 23, weight: FontWeight.bold).paddingBottom(5),
                kText("You deserve to be liquid. Get up to ${nairaSymbol}50,000 in 5 minutes", fontSize: 15, spacing: 0.5, height: 1.4),
                addSpace(y: 10),
                MaterialButton(onPressed: () => switchToLoan(context), child: kText("Get Loan", color: white),color: black,).stretchWith(Axis.horizontal).paddingRight(30)
              ],
            ),),
           Expanded(flex: 3, child: Image.asset("card".imagePng).paddingLeft(20),),
        ],
      ).paddingAll(20),
    );
  }


  Widget balanceCard(){
    return Material(
      borderRadius: BorderRadius.circular(12),
      elevation: 1,
      color: black,
      child: Column(
        children: [
          Expanded(child: kText(200000.toNairaFormat, color: white, fontSize: 32, weight: FontWeight.bold).center),
          SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            scrollDirection: Axis.horizontal,
            child: hOption(balanceTypes, black, kAppYellow, Colors.grey[600]!, transparent, (index){
              _selectedBalanceType = index;
              setState(() {});
            }, _selectedBalanceType),
          ).paddingBottom(20)
        ],
      ),
    ).stretchSize(h: 130);
  }


  Widget frequentTransaction(){
    return Material(
      borderRadius: BorderRadius.circular(12),
      elevation: 1,
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 10),
          scrollDirection: Axis.horizontal,
          child: Row(
        children: [
          freTransactionItem("BO", "Transfer"),
          freTransactionItem("MTN", "Airtime"),
          freTransactionItem("DSTV", "Cable Tv"),
          freTransactionItem("KO", "Transfer"),
          freTransactionItem("MJ", "Transfer"),
        ],
      )).paddingXY(y: 15, x: 5),
    ).stretchSize(h: 120);
  }

  Widget freTransactionItem(String initials, String type){
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          height: 70,
          width: 50,
          decoration: const BoxDecoration(
            color: black,
            shape: BoxShape.circle
          ),
          child: kText(initials, color: white),
        ),
        kText(type, fontSize: 12)
      ],
    ).paddingX(8);
  }




  List<String> filter = ["All-time", "Today", "1M", "6M", "YTD"];
  int _selectedFilter = 0;

  Widget chartCard(){
    return Material(
      elevation: 1,
      borderRadius: BorderRadius.circular(12),
      color: white,
      child: Column(
        children: [
        charts.TimeSeriesChart(
        _createSampleData(),
        animate: true,
        dateTimeFactory: const charts.LocalDateTimeFactory(),
      ).stretch,
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: hOption(filter, white, black, black, white, (index){
              _selectedFilter = index;
              setState(() {});
            }, _selectedFilter, w: 80),
          ).paddingY(5)
        ],
      ).stretchSize(h: 240).paddingAll(10),
    );
  }


  Drawer buildDrawer(){
    return Drawer(
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              addSpace(y: 40),
              const Icon(Icons.person, size: 50,).left.paddingY(30),
              kText("Emmanuel Otueme", weight: FontWeight.bold, fontSize: 16),
              addSpace(y: 10),
              kText("090123940", fontSize: 13),
            ],
          ).paddingLeft(30),
          addSpace(y: 30),
          drawerItem(Icons.credit_card, "SLIPCARD").onclickWithRipple((){goto(context, SlipCard());}),
          drawerItem(Icons.settings, "Settings").onclickWithRipple(() => goto(context, const Settings()) ),
          drawerItem(Icons.history, "History").onclickWithRipple(() => goto(context, const HistoryScreen())),
          drawerItem(Icons.help, "Help").onclickWithRipple((){}),
          drawerItem(Icons.info, "FAQs").onclickWithRipple((){}),
          drawerItem(Icons.logout, "Logout").onclickWithRipple((){}),

        ],
      ),
    );
  }


  Widget drawerItem(IconData image, String title){
    return Row(
      children: [
        Icon(image, size: 19, color: Colors.grey[700],),
        addSpace(x: 20),
        kText(title, fontSize: 14, weight: FontWeight.normal),
      ],
    ).paddingMerge(l: 30, t: 10, b: 10 );
  }


  static List<charts.Series<TimeSeriesSales, DateTime>> _createSampleData() {
    final data = [
       TimeSeriesSales( DateTime(2017, 9, 19), 5),
       TimeSeriesSales( DateTime(2017, 9, 26), 25),
       TimeSeriesSales( DateTime(2017, 10, 3), 100),
       TimeSeriesSales( DateTime(2017, 10, 10), 75),
    ];

    return [
      charts.Series<TimeSeriesSales, DateTime>(
        id: 'Sales',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (TimeSeriesSales sales, _) => sales.time,
        measureFn: (TimeSeriesSales sales, _) => sales.sales,
        data: data,
      )
    ];
  }


  switchToLoan(BuildContext context){
  const WidgetNotification(4).dispatch(context);
  }

  switchToSavings(){
    const WidgetNotification(3).dispatch(context);
  }


}

/// Sample time series data type.
class TimeSeriesSales {
  final DateTime time;
  final int sales;

  TimeSeriesSales(this.time, this.sales);
}



Widget hOption(List<String> options, Color selectedTextColor, Color selectedItemColor, Color textColor, Color itemColor, Function(int) onItemSelected, int selectedIndex,
    {double? w}){
  return Row(
    children: options.map((e){
      int index = options.indexOf(e);
      return AnimatedContainer(
        width: w,
        duration: defaultAnimationDuration,
        margin: const EdgeInsets.symmetric(horizontal: 7),
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: selectedIndex == index ? selectedItemColor: itemColor,
        ),
        child: kText(e, color:selectedIndex == index ? selectedTextColor: textColor, fontSize: 13, a: TextAlign.center),
      ).onclickWithRipple(() => onItemSelected(index));
    }).toList(),
  );
}


