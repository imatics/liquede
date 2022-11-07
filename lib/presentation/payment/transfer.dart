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
import 'package:liquede/services/api/bills_service.dart';
import 'package:liquede/services/api/user_service.dart';
import 'package:liquede/services/api/wallet_service.dart';
import 'package:swagger/api.dart';

class Transfer extends StatefulWidget {
  const Transfer({Key? key, this.beneficiaryModel}) : super(key: key);

  final BeneficiaryModel? beneficiaryModel;

  @override
  State<Transfer> createState() => _TransferState();
}

class _TransferState extends State<Transfer> {
  late KInputFieldProps accountNumberProps;
  late KInputFieldProps bankProps;
  late KInputFieldProps amountProps;

  final _key1 = GlobalKey<FormState>();
  final _key2 = GlobalKey<FormState>();
  bool _saveToBeneficiaries = false;
  BankAccountInfo? info;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    accountNumberProps = KInputFieldProps(
        textEditingController: TextEditingController(),
        inputType: TextInputType.number,
        hint: "account number",
        onChange: (e) => clearInfoCache(),
        validators: [validateField]);

    bankProps = KInputFieldProps(
        textEditingController: TextEditingController(),
        inputType: TextInputType.none,
        hint: "Select Bank",
        readOnly: true,
        onclick: showSearchableBottomSheet,
        validators: [validateField]);

    amountProps = KInputFieldProps(
      textEditingController: TextEditingController(),
      inputType: TextInputType.number,
      hint: "Amount number",
      style: KTextStyle(fontSize: 14).build,
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
      title: "Pay a Liquede User",
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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        addSpace(y: 50),
        Image.asset("send_money".imagePng, width: 80).center.paddingAll(20),
        addSpace(y: 20),
        kText("Enter account number", fontSize: 11, weight: FontWeight.w600)
            .paddingAll(5),
        EditTextField(accountNumberProps),
        addSpace(y: 20),
        kText("Bank", fontSize: 11, weight: FontWeight.w600).paddingAll(5),
        // buildDropDown(),
        EditTextField(bankProps),
        const Spacer(),
        appBtn("Next", verifyAndNext),
        addSpace(y: 50),
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
          isExpanded: true,
          underline: SizedBox(),
          onChanged: (v) {
            _selectedItem = v;
            clearInfoCache();
          },
          items: WalletService.I(context)
              .bankList
              .map((e) => DropdownMenuItem(
                    child: kText("${e.name}", fontSize: 13),
                    value: e,
                    onTap: () {
                      setState(() {
                        _selectedItem = e;
                      });
                    },
                  ))
              .toList(),
          hint: kText("Select Bank", fontSize: 14),
        ),
      ),
    );
  }

  void verifyAndNext() {
    if (info != null) {
      next();
      return;
    }
    if (_selectedItem != null) {
      WalletService.I(context)
          .getAccountDetails(AccountDetailsRequestModel()
            ..account_bank = _selectedItem!.code!
            ..account_number =
                accountNumberProps.textEditingController?.text ?? "")
          .handleStateAndPerformOnSuccess(context, (p0) {
        info = p0;
        next();
      }, onError: (s) {
        // accountNumberProps.textEditingController?.clear();
      });
    }
  }

  void clearInfoCache() {
    info = null;
  }

  void getBankInfo() {
    WalletService.I(context)
        .getBankList()
        .handleStateAndPerformOnSuccess(context, (list) {
      _selectedItem =
          list.firstWhere((element) => element.code?.contains("044") == true);
      setState(() {});

      if (widget.beneficiaryModel != null) {
        accountNumberProps.textEditingController?.text =
            widget.beneficiaryModel!.accountNumber ?? "";
        _selectedItem = list.firstWhere((element) =>
            element.code?.contains(widget.beneficiaryModel!.bankCode ?? " ") ==
            true);
      }
    }, onError: (s) {
      goBack(context);
    });
  }

  Widget buildPayTwo() {
    return Column(
      children: [
        addSpace(y: 50),
        Image.asset("send_money".imagePng, width: 80).paddingAll(20),
        kText(info?.accountName ?? "Account Name",
                fontSize: 18, weight: FontWeight.bold)
            .paddingY(30),
        kText("Enter Amount", fontSize: 12).paddingMerge(l: 5, b: 5).left,
        EditTextField(amountProps),
        addSpace(y: 20),
        Container(
          padding: const EdgeInsets.all(5),
          child: Row(
            children: [
              Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[800], shape: BoxShape.circle),
                  padding: const EdgeInsets.all(5),
                  margin: const EdgeInsets.only(right: 10),
                  child: const Icon(
                    Icons.person_add_alt_1_sharp,
                    color: white,
                    size: 15,
                  )),
              Expanded(child: kText("Add to beneficiaries", fontSize: 12)),
              Checkbox(
                  activeColor: Colors.black,
                  value: _saveToBeneficiaries,
                  onChanged: (e) {
                    _saveToBeneficiaries = e ?? false;
                    setState(() {});
                  })
            ],
          ),
        ),
        Spacer(),
        appBtn("Transfer", processTransfer),
        addSpace(y: 50),
      ],
    ).withForm(_key2);
  }

  Future<bool> shouldPop() async {
    if (_currentPage != 1) {
      back();
      return false;
    }
    return true;
  }

  void processTransfer() {
    WalletService.I(context)
        .transferToBank(NGNTransferModel()
          ..amount =
              "${amountProps.textEditingController?.text.cleanMoneyValue.toInt()}"
          ..accountNumber = accountNumberProps.textEditingController?.text
          ..accountBank = _selectedItem?.code
          ..userId = UserService.I(context).userView?.id
          ..narration = "Transfer to ${_selectedItem?.name}")
        .handleStateAndPerformOnSuccess(context, (p0) {
      showSuccessPopUp(context, "Transfer successful", onClose: () {
        saveBeneficiary();
      });
    });
  }

  void saveBeneficiary() {
    if (_saveToBeneficiaries) {
      WalletService.I(context)
          .saveBeneficiary(BeneficiaryModel()
            ..name = info?.accountName
            ..bankName = _selectedItem?.name
            ..accountNumber = info?.accountNumber
            ..bankCode = _selectedItem?.code)
          .handleStateAndPerformOnSuccess(context, (p0) {
        _pop();
      });
    } else {
      _pop();
    }
  }

  void _pop() {
    goBack(context);
    if (widget.beneficiaryModel != null) {
      goBack(context);
    }
  }

  void showSearchableBottomSheet() {
    String searchText = "";
    KInputFieldProps<String> props = KInputFieldProps();
    props.textEditingController = TextEditingController();
    showBottomSheetFull(context, "Select Bank",
        StatefulBuilder(builder: (context, bState) {
      props.onChange = (e) {
        searchText = e;
        bState(() {});
      };
      List<BankInfo> banks = [];
      if (searchText.isNotEmpty) {
        banks = WalletService.I(context)
            .bankList
            .where((e) =>
                e.name
                    ?.toLowerCase()
                    .contains(searchText.toLowerCase().trim()) ==
                true)
            .toList();
      } else {
        banks = WalletService.I(context).bankList;
      }
      return Column(
        children: [
          EditTextField(props),
          ListView(
            children: banks
                .map((e) => ListTile(
                      title: kText(e.name),
                      onTap: () {
                        _selectedItem = e;
                        bankProps.textEditingController?.text =
                            _selectedItem?.name ?? "";
                        Navigator.of(context).pop();
                      },
                    ))
                .toList(),
          ).stretch,
        ],
      );
    }));
  }
}
