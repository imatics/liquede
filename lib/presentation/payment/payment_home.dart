import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:liquede/commons/base_scaffold.dart';
import 'package:liquede/commons/constants.dart';
import 'package:liquede/commons/reusables.dart';
import 'package:liquede/commons/utils.dart';
import 'package:liquede/extensions/widget.dart';
import 'package:liquede/extensions/string.dart';
import 'package:liquede/presentation/commons/bottom_sheet.dart';
import 'package:liquede/presentation/payment/beneficiaries.dart';
import 'package:liquede/presentation/payment/bill_purchase.dart';
import 'package:liquede/services/api/base_service.dart';
import 'package:liquede/services/api/bills_service.dart';
import 'package:swagger/api.dart';

import 'list_item_selection.dart';

class PaymentHome extends StatefulWidget {
  const PaymentHome({Key? key}) : super(key: key);

  @override
  State<PaymentHome> createState() => _PaymentHomeState();
}

class _PaymentHomeState extends State<PaymentHome> {
  int indexSelected = 0;

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      context: context,
      title: "Payments",
      implyLeading: false,
      baseBody: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          addSpace(y: 20),
          kText("What kind of payment do you want to make?",
              fontSize: 14, weight: FontWeight.bold),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              paymentItem(
                  "send_money".imagePng, "Send Money", indexSelected == 0, () {
                setState(() {
                  indexSelected = 0;
                });
              }),
              addSpace(x: 20),
              paymentItem("pay_bills".imagePng, "Pay Bills", indexSelected == 1,
                  () {
                setState(() {
                  indexSelected = 1;
                });
              })
            ],
          ).paddingAll(30),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MaterialButton(
                    onPressed: () {},
                    child: kText("New"),
                  ),
                  addSpace(x: 20),
                  MaterialButton(
                    onPressed: () => gotoBeneficiaries(context),
                    child: kText("Beneficiaries"),
                  ),
                ],
              ),
              addSpace(y: 50),
              AnimatedCrossFade(
                duration: Duration(milliseconds: 300),
                firstChild: paymentGroup(),
                secondChild: billsItem(),
                crossFadeState: indexSelected == 0
                    ? CrossFadeState.showFirst
                    : CrossFadeState.showSecond,
              )
            ],
          )
        ],
      ).paddingX(20),
    );
  }

  Widget paymentItem(
      String image, String name, bool selected, Function() onclick) {
    return Material(
      elevation: 1,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(width: 2, color: selected ? black : transparent),
          borderRadius: BorderRadius.circular(10),
        ),
        height: 100,
        width: 100,
        child: Column(
          children: [
            Image.asset(
              image,
              height: 30,
              width: 30,
              fit: BoxFit.fill,
            ),
            const Spacer(),
            kText(name, weight: FontWeight.bold, color: black, fontSize: 11)
          ],
        ).paddingAll(15),
      ).paddingAll(0).onclickWithRipple(onclick),
    );
  }

  void gotoBeneficiaries(BuildContext context) {
    launchBottomSheetFull(context, const Beneficiaries(), hFactor: 1);
  }

  Widget billsItem() {
    return Wrap(
      runSpacing: 10,
      spacing: 10,
      children: [
        paymentItem("airtime".imagePng, "Airtime", false, openAirtime),
        paymentItem("data".imagePng, "Data", false, openData),
        paymentItem("cable".imagePng, "Cable TV", false, () => null),
        paymentItem("electricity".imagePng, "Utility", false, () => null),
        // paymentItem("", "Internet", false, () => null),
        // paymentItem("", "Fees", false, () => null),
        // paymentItem("", "Others", false, () => null),
      ],
    ).paddingBottom(10);
  }

  Widget paymentGroup() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        kText("Frequent Transactions",
            color: black, fontSize: 14, weight: FontWeight.bold),
        addSpace(y: 10),
        kText(
            "You'll see your frequent transactions here once you start sending money on Liquede.",
            fontSize: 14,
            color: grey),
      ],
    );
  }

  void openAirtime() {
    goto(
        context,
        ListItemSelection<BaxiProviderResponse>(
          closeOnSelect: false,
          onItemSelected: (index, data) {},
          title: "Airtime",
          builder: (context, data) => ListTile(
            title:
                kText(data.name ?? "", weight: FontWeight.bold, fontSize: 12),
            horizontalTitleGap: 2,
            onTap: () => openBillsPurchaseAirtime(data),
            leading: Image.asset("${data.shortname}_logo".imagePng,
                height: 40, width: 40, fit: BoxFit.cover),
          ).paddingY(10),
          streamData: (e) =>
              BillsService.I(context).getAirtimeProviders().map((event) {
            return NetworkEvent<List<BaxiProviderResponse>>(
                message: event.message,
                error: event.error,
                type: event.type,
                data: event.data?.providers);
          }),
        ));
  }

  void openData() {
    goto(
        context,
        ListItemSelection<ProviderResponse>(
          closeOnSelect: false,
          onItemSelected: (index, data) {},
          title: "Data",
          builder: (context, data) => ListTile(
            title:
                kText(data.name ?? "", weight: FontWeight.bold, fontSize: 12),
            horizontalTitleGap: 2,
            onTap: () => openBillsPurchaseData(data),
            leading: Image.asset("${data.shortname}_logo".imagePng,
                height: 40, width: 40, fit: BoxFit.cover),
          ).paddingY(10),
          streamData: (e) =>
              BillsService.I(context).getDataProviders().map((event) {
            return NetworkEvent<List<ProviderResponse>>(
                message: event.message,
                error: event.error,
                type: event.type,
                data: event.data?.providers);
          }),
        ));
  }

  void openBillsPurchaseAirtime(BaxiProviderResponse airtime) {
    goto(
        context,
        BillsPurchase<String>(
            title: "${airtime.name} Airtime ",
            builder: (c, d) => kText(d),
            closeOnSelect: true,
            optionHint: "",
            onPaymentAttempt: (selectedOption, amount, customerID, pin) => purchaseAirtime(amount, customerID, pin, airtime.shortname??""),
            customerIdHint: "Phone Number",
            image: "${airtime.shortname}_logo".imagePng));
  }

  void openBillsPurchaseData(ProviderResponse data) {
    print(data);
    goto(
        context,
        BillsPurchase<ProviderBundleResponse>(
            title: "${data.name} Data ",
            builder: (c, d) => kText(d.name),
            closeOnSelect: true,
            optionHint: "Select",
            customerIdHint: "Phone Number",
            customerIdValidator: (e) => validatePhone(e),
            onPaymentAttempt: (selectedOption, amount, customerID, pin) => purchaseData(selectedOption!, amount, customerID, pin, data.serviceType??""),
            amountCallback: (index, data) =>
                formatMoney(data.price?.toDouble()),
            streamData: (e) =>
                BillsService.I(context).getProviderBundles(data.shortname!, e),
            image: "${data.shortname}_logo".imagePng));
  }

  void purchaseData(ProviderBundleResponse data, String amount, String customerID, String pin, String serviceType) {
    BillsService.I(context)
        .purchaseDataBundle(DataBundlePurchaseInput()..amount = "${data.price}" ..phoneNumber = customerID ..serviceType ..serviceType = serviceType ..dataCode = "${data.datacode}" ..pin = int.parse(pin))
        .handleStateAndPerformOnSuccess(context, (p0) {});
  }

  void purchaseAirtime(String amount, String customerID, String pin, String serviceType) {
    BillsService.I(context)
        .purchaseAirtime(AirtimePurchaseInput()..amount = amount ..phoneNumber = customerID ..serviceType ..serviceType = serviceType ..pin = int.parse(pin)).listen((event) {
      event.handleStateAndPerformOnSuccess(context, (p0) {
        showSuccessPopUp(context, event.message, onClose: (){
          goBack(context);
          goBack(context);
        });
      });
    });

  }
}
