import 'package:animations/animations.dart';
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:liquede/commons/base_scaffold.dart';
import 'package:liquede/commons/constants.dart';
import 'package:liquede/commons/reusables.dart';
import 'package:liquede/commons/utils.dart';
import 'package:liquede/extensions/string.dart';
import 'package:liquede/extensions/widget.dart';
import 'package:liquede/services/api/base_service.dart';
import 'package:liquede/services/api/user_service.dart';
import 'package:liquede/services/api/wallet_service.dart';
import 'package:swagger/api.dart';

class Transfer extends StatefulWidget {
  const Transfer({Key? key}) : super(key: key);

  @override
  State<Transfer> createState() => _TransferState();
}

class _TransferState extends State<Transfer> {
  late KInputFieldProps accountNumberProps;
  late KInputFieldProps amountProps;

  final _key1 = GlobalKey<FormState>();
  final _key2 = GlobalKey<FormState>();
  bool _saveToBeneficiaries = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    accountNumberProps = KInputFieldProps(
        textEditingController: TextEditingController(),
        inputType: TextInputType.number,
        hint: "account number",
        validators: [validateField]);

    amountProps = KInputFieldProps(
      textEditingController: TextEditingController(),
      inputType: TextInputType.number,
      hint: "account number",
      inputFormatter: [
        CurrencyTextInputFormatter(symbol: nairaSymbol, decimalDigits: 0)
      ],
    );
    getBankInfo();
  }

  int _currentPage = 1;
  bool reverse = false;

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      context: context,
      baseBody: buildBody(),
    );
  }

  Widget buildBody() {
    return WillPopScope(
      onWillPop: shouldPop,
      child: PageTransitionSwitcher(
        reverse: reverse,
        duration: defaultAnimationDuration,
        transitionBuilder: (
          Widget child,
          Animation<double> animation,
          Animation<double> secondaryAnimation,
        ) {
          return SharedAxisTransition(
            animation: animation,
            fillColor: Colors.transparent,
            secondaryAnimation: secondaryAnimation,
            transitionType: SharedAxisTransitionType.horizontal,
            child: child,
          );
        },
        child: _currentPage == 2 ? buildPayTwo() : buildPayOne(),
      ).paddingMerge(l: 15, r: 15, t: 5),
    );
  }

  void next() {
    setState(() {
      _currentPage++;
      reverse = false;
    });
  }

  void back() {
    setState(() {
      _currentPage--;
      reverse = true;
    });
  }

  Widget buildPayOne() {
    return Column(
      children: [
        kText("Enter account number"),
        EditTextField(accountNumberProps),
        buildDropDown(),
        appBtn("Next", verifyAndNext)
      ],
    ).withForm(_key1);
  }

  BankInfo? _selectedItem;

  Widget buildDropDown() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(4),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
            color: Colors.grey[200],
            border:
                Border(bottom: BorderSide(width: 2, color: Colors.grey[700]!))),
        child: DropdownButton<BankInfo>(
          value: _selectedItem,
          underline: SizedBox(),
          onChanged: (v) {
            _selectedItem = v;
          },
          items: WalletService.I(context)
              .bankList
              .map((e) => DropdownMenuItem(
                    child: Text(e.name ?? ""),
                    value: e,
                    onTap: () {
                      setState(() {
                        _selectedItem = e;
                      });
                    },
                  ))
              .toList(),
          hint: kText("Select Bank"),
        ),
      ),
    );
  }

  void verifyAndNext() {
    if (_selectedItem != null) {
      WalletService.I(context)
          .getAccountDetails(_selectedItem!.code!,
              accountNumberProps.textEditingController?.text ?? "")
          .handleStateAndPerformOnSuccess(context, (p0) {
            next();
      }, onError: (s){
            accountNumberProps.textEditingController?.clear();
      });
    }
  }

  void getBankInfo() {
    WalletService.I(context)
        .getBankList()
        .handleStateAndPerformOnSuccess(context, (list) {
      setState(() {});
    }, onError: (s){
          goBack(context);
    });
  }

  Widget buildPayTwo() {
    return Column(
      children: [
        Image.asset("avatar".imagePng),
        kText("User name"),
        kText("Enter Amount"),
        EditTextField(amountProps),
        addSpace(y: 20),
        Container(
          child: Row(
            children: [
              const Icon(Icons.restart_alt),
              kText("Add to beneficiaries"),
              Checkbox(
                  value: _saveToBeneficiaries,
                  onChanged: (e) {
                    _saveToBeneficiaries = e ?? false;
                  })
            ],
          ),
        ),
        Spacer(),
        appBtn("Transfer", processTransfer)
      ],
    ).withForm(_key2);
  }

  Future<bool> shouldPop() async {
    if (_currentPage != 1) {
      _currentPage = 1;
      setState(() {});
      return false;
    }
    return true;
  }

  void processTransfer(){
    WalletService.I(context).transferToBank(NGNTransferModel()
    ..amount = amountProps.textEditingController?.text
    ..accountNumber = accountNumberProps.textEditingController?.text
    ..accountBank = _selectedItem?.code
    ..userId = UserService.I(context).userView?.id
    ..narration = "Transfer to ${_selectedItem?.name}"
    ).handleStateAndPerformOnSuccess(context, (p0) {
      showSuccessPopUp(context, "Transfer successful", onClose: (){
        goBack(context);
      });
    });
  }
}
