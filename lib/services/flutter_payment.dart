import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutterwave_standard/flutterwave.dart';
import 'package:liquede/extensions/String.dart';
import 'package:liquede/services/api/base_service.dart';
import 'package:liquede/services/api/wallet_service.dart';
import 'package:swagger/api.dart';

import '../commons/constants.dart';
import '../commons/reusables.dart';
import '../commons/utils.dart';
import '../extensions/widget.dart';
import '../presentation/commons/bottom_sheet.dart';
import 'api/user_service.dart';

void requestPayment(
    BuildContext context, String transactionID, String amount) async {
  String ref = generateRef(transactionID);
  final style = FlutterwaveStyle(
      appBarText: "Proceed with payment",
      buttonColor: Colors.black,
      appBarIcon: const Icon(Icons.wallet, color: Colors.black),
      buttonTextStyle: const TextStyle(
          color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
      appBarColor: Colors.white,
      mainTextStyle: KTextStyle(fontSize: 14, color: Colors.grey[900]).build,
      dialogCancelTextStyle:
          const TextStyle(color: Colors.redAccent, fontSize: 14),
      dialogContinueTextStyle:
          const TextStyle(color: Colors.black, fontSize: 14));
  UserView u = UserService.I(context).userView!;
  final Customer customer =
      Customer(name: u.fullName!, phoneNumber: u.phoneNumber!, email: u.email!);
  final Flutterwave flutterwave = Flutterwave(
      context: context,
      style: style,
      publicKey: "FLWPUBK_TEST-e2f6d135867e65cf59f0a4e1dbe71c47-X",
      currency: "NGN",
      txRef: transactionID,
      amount: amount,
      customer: customer,
      paymentOptions: "ussd, card, barter, payattitude",
      customization: Customization(title: "Fund Liquede Flex"),
      // isDebug: true,
      isTestMode: true);
  final ChargeResponse response = await flutterwave.charge();
  if (response.success == true) {
    print(response.toJson());
    if (response.success == true) {
      _verifyPayment(context, transactionID, response.transactionId??"");
    } else {
      showErrorPopUp(context, response.status ?? "Transaction failed");
    }
  } else {
    // User cancelled
  }
}

void _verifyPayment(BuildContext context, String ref, String id) {
  WalletService.I(context)
      .validatePayment(id, ref)
      .handleStateAndPerformOnSuccess(context, (p0) {
    WalletService.I(context).getWalletBalance(UserService.I(context).userView?.id
    ??-1).handleStateAndPerformOnSuccess(context, (p0) {
      showSuccessPopUp(context, "Wallet Funding Successful");
    });
  });
}

String generateRef(String id) {
  String now = DateTime.now().millisecondsSinceEpoch.toString();
  return "$id--$now";
}

void showFunWalletModal(BuildContext context, Function(String) onFundWallet) {
  TextEditingController controller = TextEditingController();
  launchBottomSheetFull(
      context,
      Column(
        children: [
          addSpace(y: 20),
          kText("", weight: FontWeight.w900, fontSize: 24).paddingX(40),
          addSpace(y: 50),
          EditTextField(KInputFieldProps(
              textEditingController: controller,
              fillColor: Colors.grey[200],
              textAlign: TextAlign.center,
              hint: "Enter Amount",
              inputType: TextInputType.number,
              validators: [validateField],
              inputFormatter: [
                CurrencyTextInputFormatter(
                    symbol: nairaSymbol, decimalDigits: 0)
              ],
              style: KTextStyle(
                      weight: FontWeight.bold,
                      fontSize: 18,
                      style: const TextStyle(letterSpacing: 3))
                  .build)),
          addSpace(y: 20),
          Spacer(),
          MaterialButton(
            onPressed: () => onFundWallet("${controller.text.cleanMoneyValue}"),
            child: kText("Fund Wallet", color: white, weight: FontWeight.bold),
            color: black,
          ).stretchSize(h: 45),
          addSpace(y: 50),
        ],
      ),
      hFactor: 0.6);
}
