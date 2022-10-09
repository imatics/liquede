import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:liquede/commons/constants.dart';
import 'package:liquede/commons/reusables.dart';
import 'package:liquede/commons/style.dart';
import 'package:liquede/commons/utils.dart';
import 'package:liquede/extensions/widget.dart';
import 'package:liquede/services/api/saving_service.dart';
import 'package:swagger/api.dart';
import 'package:liquede/services/api/base_service.dart';
import 'package:liquede/extensions/string.dart';

class CreateLiquedeSealPlan extends StatefulWidget {
  const CreateLiquedeSealPlan({Key? key}) : super(key: key);

  @override
  State<CreateLiquedeSealPlan> createState() => _CreateLiquedeSealPlanState();
}

class _CreateLiquedeSealPlanState extends State<CreateLiquedeSealPlan> {
  List<String> options = [
    // "Set duration by days",
    "Set duration by months",
  ];

  final _key = GlobalKey<FormState>();

  String? selected;
  int valueEntered = 0;
  bool termsChecked = false;
  Duration _d = const Duration();

  late TextEditingController _controller;
  late KInputFieldProps prop;
  late KInputFieldProps amountProp;
  late KInputFieldProps titleProps;

  @override
  void initState() {
    selected = options.first;
    super.initState();
    _controller = TextEditingController(text: "$valueEntered");
    prop = KInputFieldProps(
        textEditingController: _controller,
        textAlign: TextAlign.center,
        maxLength: 2,
        maxLines: 1,
        fillColor: transparent,
        inputType: TextInputType.number,
        inputDecoration: getDecoration(
            counter: const SizedBox(),
            borderColor: black,
            radius: 5,
            borderWidth: 1),
        style: KTextStyle(color: black, a: TextAlign.center).build);
    titleProps = KInputFieldProps(
      context: context,
      hint: "Enter title for LiquedeSeal",
      textEditingController: TextEditingController(),
    );
    amountProp = KInputFieldProps(
      context: context,
      hint: "Enter Amount",
      onChange: (e){setState(() {});},
      style: KTextStyle(weight: FontWeight.bold).build,
      inputType: TextInputType.number,
      inputFormatter: [
        CurrencyTextInputFormatter(decimalDigits: 0, symbol: nairaSymbol)
      ],
      textEditingController: TextEditingController(),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (selected == options.first) {
      _d = Duration(days: valueEntered);
    } else {
      _d = Duration(days: valueEntered * 30);
    }
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            EditTextField(amountProp),
            addSpace(y: 20),
            Container(
              decoration: BoxDecoration(
                  color: Colors.grey[100],
                  border:
                  const Border(bottom: BorderSide(width: 1, color: black))),
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: DropdownButton<String>(
                  isExpanded: true,
                  underline: const SizedBox(),
                  itemHeight: 90,
                  hint: const Text("Set duration"),
                  onChanged: (e) {},
                  value: selected,
                  items: options
                      .map((e) =>
                      DropdownMenuItem(
                        child: Text(e),
                        value: e,
                        onTap: () {
                          setState(() {
                            selected = e;
                          });
                        },
                      ))
                      .toList())
                  .stretchSize(h: 50),
            ),
            addSpace(y: 10),
            Container(
              height: 170,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: const Color(0xFFFBFBFB),
                  boxShadow: [boxShadow(elevation: 0.3)]),
              child: Column(
                children: [
                  const Spacer(),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.remove_circle,
                            size: 55,
                          ).onclickWithRipple(() {
                            if (valueEntered > 0) {
                              _controller.text = "${valueEntered--}";
                              setState(() {});
                            }
                          }).stretchSize(h: 60, w: 60),
                          addSpace(x: 10),
                          EditTextField(prop).stretchSize(h: 70, w: 80),
                          addSpace(x: 10),
                          const Icon(
                            Icons.add_circle,
                            size: 55,
                          ).onclickWithRipple(() {
                            if (valueEntered < 30) {
                              _controller.text = "${valueEntered++}";
                              setState(() {});
                            }
                          }).stretchSize(h: 60, w: 60),
                        ],
                      ),
                      kText(
                          (selected == null) ? "" : selected!.split(" ").last),
                    ],
                  ),
                  Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          kText("Or set a target date", fontSize: 13)
                              .paddingMerge(r: 15, b: 15)
                              .right
                              .onclick(() {}),
                        ],
                      ))
                ],
              ),
            ),
            addSpace(y: 10),
            previewCard(),
            addSpace(y: 20),
            EditTextField(titleProps),
            addSpace(y: 20),
            Container(
              decoration: BoxDecoration(
                  color: Colors.grey[100],
                  border:
                  const Border(bottom: BorderSide(width: 1, color: black))),
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  kText("Pick a payment source",
                      weight: FontWeight.normal, color: grey),
                  const Icon(Icons.arrow_drop_down)
                ],
              )
                  .stretchSize(h: 50)
                  .onclickWithRipple(selectPaymentSource)
                  .hideIf(true),
            ),
            addSpace(y: 20),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Checkbox(
                  value: termsChecked,
                  onChanged: (v) {
                    setState(() {
                      termsChecked = v == true;
                    });
                  },
                ),
                kText(authText, a: TextAlign.justify, fontSize: 13)
                    .paddingY(15)
                    .stretch,
              ],
            ),
            MaterialButton(
              onPressed: termsChecked ? createSeal : null,
              color: black,
              child: kText("Create LiquedeSeal", color: white),
            ).stretchSize(h: 45),
            addSpace(y: 30),
          ],
        ).withForm(_key),
      ),
    );
  }

  void selectPaymentSource() {
    showBottomSheetOption(context, "Choose a payment option", [
      OptionsAction("Use LiquedeFlex", () {}, iconData: Icons.add),
      OptionsAction("Use a new card", () {}, iconData: Icons.credit_card),
      OptionsAction("Pay from bank account", () {}, iconData: Icons.apartment),
    ]);
  }

  String authText =
  """I authorize Lquede to to seal {amount} and return it in full along with the accrued interest on {date} to my liquedeFlex. I also acknowledge that this LiquedeSeal saving cannot be a broken once it is created.
  """;

  void createSeal() {
    SavingsService.I(context)
        .createLiquedeSeal(LiquedeSealInput()
      ..amount = amountProp.textEditingController?.text.cleanMoneyValue
      ..durationInDays = _d.inDays
      ..cardId = 0
      ..name = titleProps.textEditingController?.text)
        .handleStateAndPerformOnSuccess(context, (p0) {
      showSuccessPopUp(context, "Liquede Seal successfully created", onClose: () {
        goBack(context);
      });
    });
  }


  Widget previewCard() {
    KTextStyle label = KTextStyle(
        fontSize: 14, color: Colors.grey[600], weight: FontWeight.w500);
    KTextStyle value =
    KTextStyle(fontSize: 16, color: Colors.black, weight: FontWeight.bold);
    return Material(
      color: const Color(0xFFe3e0c8),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            kText("Preview"),
            addSpace(y: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    kText("Amount to Seal", defaultStyle: label.build!),
                    addSpace(y: 5),
                    kText(amountProp.textEditingController?.text, defaultStyle: value.build!),
                  ],
                ),
                const Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    kText("Interest to earn", defaultStyle: label.build!),
                    addSpace(y: 5),
                    kRichText([
                      ManyText(
                          text: "0.6332% ",
                          style: KTextStyle(color: Colors.green, fontSize: 14)),
                      ManyText(
                        text: "/${formatMoney(0)}",
                        style: KTextStyle(style: value.build!),
                      )
                    ],
                        style: KTextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            weight: FontWeight.bold)),
                  ],
                ),
              ],
            ),
            addSpace(y: 20),
            kText("Maturity Date", defaultStyle: label.build!),
            kRichText([
              ManyText(
                  text: format1.format(DateTime.now().add(_d)),
                  style: KTextStyle(style: value.build!)),
              ManyText(
                  text: "/${_d.inDays} Days",
                  style: KTextStyle(style: value.build!, fontSize: 12))
            ], style: value),
          ],
        ).paddingAll(20),
      ),
    );
  }
}
