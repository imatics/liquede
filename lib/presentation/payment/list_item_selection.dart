import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:liquede/commons/base_scaffold.dart';
import 'package:liquede/commons/reusables.dart';
import 'package:liquede/services/api/base_service.dart';

typedef PaymentWidgetItemBuilder<T> = Widget Function(
    BuildContext context, T data);
typedef PaymentWidgetStream<T> = Stream<NetworkEvent<List<T>>> Function(dynamic args);
typedef PaymentSelectionCallback<T> = Function(int index, T data);
typedef MakePayment<T> = Function( T? data, String amount, String customerID, String pin);

class ListItemSelection<T> extends StatelessWidget {
  ListItemSelection(
      {Key? key,
      this.streamData,
      this.options,
      required this.builder,
      required this.onItemSelected,
      required this.closeOnSelect,
      required this.title})
      : super(key: key);

  final PaymentWidgetStream<T>? streamData;
  final List<T>? options;
  final PaymentWidgetItemBuilder<T> builder;
  final PaymentSelectionCallback<T> onItemSelected;
  final bool closeOnSelect;
  final String title;

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      context: context,
      implyLeading: true,
      title: title,
      baseBody: _buildMainBody(context),
    );
  }

  Widget _buildMainBody(BuildContext context) {
    if(streamData != null){
      return buildStreamBody(context);
    }
    return buildBody(context, options??[]);
  }

  Widget buildStreamBody(BuildContext context) {
    return StreamBuilder<NetworkEvent<List<T>>>(
      stream: streamData!(null),
        builder: (context, snapshot) {
          if(snapshot.data?.type == NetworkEventType.processing){
            return Center(
              child: appLoadingWidget,
            );
          }
          if(snapshot.data?.type == NetworkEventType.failed){
            return Column(
              children: [
                kText(snapshot.data?.message??"An Error Occurred")
              ],
            );
          }
          if(snapshot.data?.type == NetworkEventType.completed){
            print(snapshot.data?.data);
            return buildBody(context,snapshot.data?.data??[]);
          }
          return SizedBox();
        });
  }

  Widget buildBody(BuildContext context,List<T> data) {
    return ListView(
      children: data.map((e) => builder(context, e)
      ).toList(),
    );
  }
}
