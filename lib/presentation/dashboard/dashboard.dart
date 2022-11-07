import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:liquede/commons/base_scaffold.dart';
import 'package:liquede/commons/constants.dart';
import 'package:liquede/commons/reusables.dart';
import 'package:liquede/extensions/string.dart';
import 'package:liquede/commons/utils.dart';
import 'package:liquede/extensions/widget.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:liquede/presentation/commons/bottom_sheet.dart';
import 'package:liquede/presentation/history.dart';
import 'package:liquede/presentation/model/notification.dart';
import 'package:liquede/presentation/payment/payment_screen.dart';
import 'package:liquede/presentation/account/settings.dart';
import 'package:liquede/presentation/slipcard.dart';
import 'package:liquede/services/api/base_service.dart';
import 'package:liquede/services/api/saving_service.dart';
import 'package:liquede/services/api/user_service.dart';
import 'package:liquede/services/api/wallet_service.dart';
import 'package:swagger/api.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../services/flutter_payment.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  List<String> balanceTypes = [
    "Net Worth",
    "LiquedeFlex",
    "Savings",
    // "Investments"
  ];
  int _selectedBalanceType = 0;

  late BuildContext _context;
  void showHideDrawer() {
    if (Scaffold.of(_context).isDrawerOpen) {
      Scaffold.of(_context).openDrawer();
    } else {
      Scaffold.of(_context).openDrawer();
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getWalletInfo();
    getTransactions();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      context: context,
      networkSateAware: false,
      drawer: buildDrawer(),
      baseAppBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: Builder(builder: (context) {
          _context = context;
          return AppBar(
            leading: IconButton(
              icon: const Icon(Icons.menu),
              onPressed: showHideDrawer,
            ),
            actions: [
              kText("Hi ${UserService.I(context).userView?.firstName ?? ""}",
                      weight: FontWeight.bold, fontSize: 13, color: grey)
                  .paddingRight(20)
                  .center
            ],
            elevation: 0,
            backgroundColor: Colors.grey[200],
          );
        }),
      ),
      baseBody: Container(
        color: Colors.grey[200],
        child: Column(
          children: [
            Expanded(
                child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  balanceCard(),
                  addSpace(y: 30),
                  chartCard(),
                  addSpace(y: 30),
                  Column(
                    children: [
                      kText("Frequent Transactions",
                              weight: FontWeight.bold, fontSize: 18)
                          .left


                          .paddingMerge(l: 5, b: 10),
                      frequentTransaction(),
                      addSpace(y: 30),
                    ],
                  ).hideIf(true),

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

  Widget getLoanCard() {
    return Material(
      elevation: 1,
      borderRadius: BorderRadius.circular(12),
      child: Row(
        children: [
          Expanded(
            flex: 9,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                kText("Get an Instant Loan",
                        fontSize: 23, weight: FontWeight.bold)
                    .paddingBottom(5),
                kText(
                    "You deserve to be liquid. Get up to ${nairaSymbol}50,000 in 5 minutes",
                    fontSize: 15,
                    spacing: 0.5,
                    height: 1.4),
                addSpace(y: 10),
                MaterialButton(
                  onPressed: () => switchToLoan(context),
                  child: kText("Get Loan", color: white),
                  color: black,
                ).stretchWith(Axis.horizontal).paddingRight(30)
              ],
            ),
          ),
          const Spacer(
            flex: 5,
          )
        ],
      ).paddingAll(20),
    );
  }

  Widget startSavingCard() {
    return Material(
      elevation: 1,
      borderRadius: BorderRadius.circular(12),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Image.asset("target".imagePng).paddingLeft(20),
          ),
          Expanded(
            flex: 7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                kText("Smash Your Goals", fontSize: 23, weight: FontWeight.bold)
                    .paddingBottom(5),
                kText(
                    "Liquede can help you save towards targets. Try it out now",
                    fontSize: 15,
                    spacing: 0.5,
                    height: 1.4,
                    a: TextAlign.right),
                addSpace(y: 10),
                MaterialButton(
                  onPressed: switchToSavings,
                  child: kText("Start Saving", color: white),
                  color: black,
                ).stretchWith(Axis.horizontal).paddingLeft(40)
              ],
            ),
          ),
        ],
      ).paddingAll(20),
    );
  }

  Widget getLiquidCard() {
    return Material(
      elevation: 1,
      borderRadius: BorderRadius.circular(12),
      child: Row(
        children: [
          Expanded(
            flex: 7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                kText("A Card that does more",
                        fontSize: 23, weight: FontWeight.bold)
                    .paddingBottom(5),
                kText(
                    "You deserve to be liquid. Get up to ${nairaSymbol}50,000 in 5 minutes",
                    fontSize: 15,
                    spacing: 0.5,
                    height: 1.4),
                addSpace(y: 10),
                MaterialButton(
                  onPressed: () => switchToLoan(context),
                  child: kText("Get Loan", color: white),
                  color: black,
                ).stretchWith(Axis.horizontal).paddingRight(30)
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Image.asset("card".imagePng).paddingLeft(20),
          ),
        ],
      ).paddingAll(20),
    );
  }

  String getBalance(){
    switch(_selectedBalanceType){
      case 0: return WalletService.I(context).balance;
      case 1: return WalletService.I(context).balance;
      case 2:{
         return SavingsService.I(context).getWorth();
      }
    }
    return  "Balance unavailable";
  }


  bool hideBalance = false;
  Widget balanceCard() {
    return Material(
      borderRadius: BorderRadius.circular(12),
      elevation: 1,
      color: black,
      child: Column(
        children: [
          Expanded(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              kText(hideBalance ? "##,###" : getBalance(),
                      color: white, fontSize: 22, weight: FontWeight.bold)
                  .center,
              IconButton(
                  onPressed: _hideBalance,
                  icon: Icon(
                    hideBalance ? Icons.visibility : Icons.visibility_off,
                    color: white,
                  )),
            ],
          )),
          SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            scrollDirection: Axis.horizontal,
            child: hOption(
                balanceTypes, black, kAppYellow, Colors.grey[600]!, transparent,
                (index) {
              _selectedBalanceType = index;
              setState(() {});
            }, _selectedBalanceType),
          ).paddingBottom(20)
        ],
      ),
    ).stretchSize(h: 130);
  }

  Widget frequentTransaction() {
    return Material(
      borderRadius: BorderRadius.circular(12),
      elevation: 1,
      child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 0),
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              freTransactionItem("BO", "Transfer"),
              freTransactionItem("MTN", "Airtime"),
              freTransactionItem("DSTV", "Cable Tv"),
              freTransactionItem("KO", "Transfer"),
              freTransactionItem("MJ", "Transfer"),
            ],
          )).paddingXY(y: 15),
    ).stretchSize(h: 110);
  }

  Widget freTransactionItem(String initials, String type) {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          height: 50,
          width: 50,
          decoration: const BoxDecoration(color: black, shape: BoxShape.circle),
          child: kText(initials, color: white),
        ),
        addSpace(y: 10),
        kText(type, fontSize: 12)
      ],
    ).paddingX(10);
  }

  List<String> filter = ["All-time", "Today", "1M", "6M", "YTD"];
  int _selectedFilter = 0;

  Widget chartCard() {
    List<charts.Series<TimeSeriesSales, DateTime>> data = _createSampleData(WalletService.I(context).transactions);
    return Material(
      elevation: 1,
      borderRadius: BorderRadius.circular(12),
      color: white,
      child: Column(
        children: [
          charts.TimeSeriesChart(
            data,
            animate: true,
            dateTimeFactory: const charts.LocalDateTimeFactory(),
          ).stretch,
        ],
      ).replace(Container(
        color: Colors.grey[100],
        child: kText("Chart Unavailable", color: grey).center,
      ), data.isEmpty).stretchSize(h: 240).paddingAll(10),
    );
  }

  Drawer buildDrawer() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              addSpace(y: 40),
              const Icon(
                Icons.person,
                size: 50,
              ).left.paddingY(30),
              kText(UserService.I(context).userView?.fullName, weight: FontWeight.bold, fontSize: 16),
              addSpace(y: 10),
              kText(UserService.I(context).userView?.phoneNumber, fontSize: 12, weight: FontWeight.bold),
            ],
          ).paddingLeft(30),
          addSpace(y: 30),
          // drawerItem(Icons.credit_card, "SLIPCARD").onclickWithRipple(() {
          //   goto(context, SlipCard());
          // }),
          drawerItem(Icons.settings, "Settings")
              .onclickWithRipple(() => goto(context, const Settings())),
          drawerItem(Icons.history, "History")
              .onclickWithRipple(() => goto(context, const HistoryScreen())),
          drawerItem(Icons.help, "Help").onclickWithRipple(() {}),
          drawerItem(Icons.info, "FAQs").onclickWithRipple(() {}),
          drawerItem(Icons.logout, "Logout").onclickWithRipple(() => gotoLogin(context)
          ),
        ],
      ),
    );
  }

  void getTransactions(){
    WalletService.I(context).getTransactionHistory(UserService.I(context).userView!.id!).performOnSuccess((p0) {
      setState(() {});
    });
  }


  void getWalletInfo({bool pinCreated = false}) {
    WalletService ws = WalletService.I(context);
    int id = UserService.I(context).userView?.id ?? -1;
    if (id != -1) {
      ws.getWalletBalance(id).performOnSuccess((p0) {
        if (p0.balance == "null" && !pinCreated) {
          showCreatePinBottomSheet(context, (pin) {
            ws
                .createPin(WalletPinModel()
                  ..pin = pin
                  ..userId = id)
                .performOnSuccess((p0) {
              getWalletInfo(pinCreated: true);
            });
          });
        } else {
          setState(() {});
        }
      });
      ws.getWalletPin(id).performOnSuccess((p0) { });
    }
  }

  Widget drawerItem(IconData image, String title) {
    return Row(
      children: [
        Icon(
          image,
          size: 22,
          color: Colors.grey[700],
        ),
        addSpace(x: 20),
        kText(title, fontSize: 13, weight: FontWeight.w600),
      ],
    ).paddingMerge(l: 30, t: 10, b: 10);
  }

  static List<charts.Series<TimeSeriesSales, DateTime>> _createSampleData(List<TransactionView> list) {

    List<TimeSeriesSales> data = [];

    list.sort((a, b) => a.dateCreated?.compareTo(b.dateCreated??DateTime.now())??-1);

    for(var v in list){
      if(v.dateCreated != null && v.amount != null){
        data.add(TimeSeriesSales(v.dateCreated!, v.amount.cleanMoneyValue.toInt()));
      }
    }


    return [
      charts.Series<TimeSeriesSales, DateTime>(
        id: 'Sales',
        colorFn: (_, __) => charts.MaterialPalette.black,
        domainFn: (TimeSeriesSales sales, _) => sales.time,
        measureFn: (TimeSeriesSales sales, _) => sales.sales,
        data: data,

      )
    ];
  }

  void _hideBalance() {
    setState(() {
      hideBalance = !hideBalance;
    });
  }

  switchToLoan(BuildContext context) {
    const WidgetNotification(3).dispatch(context);
  }

  switchToSavings() {
    const WidgetNotification(2).dispatch(context);
  }
}

/// Sample time series data type.
class TimeSeriesSales {
  final DateTime time;
  final int sales;

  TimeSeriesSales(this.time, this.sales);
}

Widget hOption(
    List<String> options,
    Color selectedTextColor,
    Color selectedItemColor,
    Color textColor,
    Color itemColor,
    Function(int) onItemSelected,
    int selectedIndex,
    {double? w}) {
  return Row(
    children: options.map((e) {
      int index = options.indexOf(e);
      return AnimatedContainer(
        width: w,
        duration: defaultAnimationDuration,
        margin: const EdgeInsets.symmetric(horizontal: 7),
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: selectedIndex == index ? selectedItemColor : itemColor,
        ),
        child: kText(e,
            color: selectedIndex == index ? selectedTextColor : textColor,
            fontSize: 13,
            a: TextAlign.center),
      ).onclickWithRipple(() => onItemSelected(index));
    }).toList(),
  );
}

showCreatePinBottomSheet(BuildContext context, Function(int) onCreatePin) {
  TextEditingController controller = TextEditingController();
  launchBottomSheetFull(
      context,
      Column(
        children: [
          kText("Create wallet pin", weight: FontWeight.w900, fontSize: 24)
              .paddingX(40),
          addSpace(y: 40),
          kText("Enter 4 digit pin"),
          addSpace(y: 30),
          EditTextField(KInputFieldProps(
              textEditingController: controller,
              fillColor: Colors.grey[200],
              textAlign: TextAlign.center,
              hint: "****",
              inputType: TextInputType.number,
              isPassword: true,
              style: KTextStyle(
                      weight: FontWeight.bold,
                      fontSize: 24,
                      style: const TextStyle(letterSpacing: 3))
                  .build)),
          Spacer(),
          MaterialButton(
            onPressed: () => onCreatePin(int.parse(controller.text)),
            child: kText("Create Pin", color: white, weight: FontWeight.bold),
            color: black,
          ).stretchSize(h: 45),
          addSpace(y: 40),
        ],
      ),
      hFactor: 0.6);
}

void fundWallet(BuildContext context){

}

