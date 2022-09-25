import 'package:flutter/material.dart';
import 'package:liquede/commons/base_scaffold.dart';
import 'package:liquede/extensions/widget.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key? key, required this.url}) : super(key: key);
  final String url;

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  bool loading = true;

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
        context: context,
        baseBody: Column(
          children: [
            LinearProgressIndicator().hideIf(!loading),
            Expanded(
                child: WebView(
              initialUrl: widget.url,
              zoomEnabled: true,
              javascriptMode: JavascriptMode.unrestricted,
              onPageStarted: (e) => setLoading(true),
              onPageFinished: (e) => setLoading(false),
              onWebResourceError: (e){
                print(e);
              },
            ))
          ],
        ));
  }

  void setLoading(bool v) {
    loading = v;
    setState(() {});
  }
}
