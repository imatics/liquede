
import 'package:liquede/commons/utils.dart';
import 'constants.dart';

extension StringExtension2 on String{

  bool get empty{
    if(this == null)
      return true;
    if(this.trim().length == 0)
      return true;
    return false;
  }

  bool get notEmpty => !this.empty;


  String get png => "$image_path/${this}.png";

  String get jpg => "$image_path/${this}.jpg";


}

extension FuctionExtension on Function{

 doAfter(Duration duration){
   Future.delayed(duration, this());
 }

 whenDone(Function function){
   this();
   function();
 }

}


extension FunctionExtensions2 on List<Function>{
  Function get chain {
    return ()=> (){
      forEach((element) {
        element();
      });
    };
  }

}


extension IntExtension2 on int{

  int min(int v){
    return this>v?this:v;
  }

  int max(int v){
    return this<v?this:v;
  }

  String get toNairaFormat => formatMoney(toDouble());

}

extension DoubleExtension2 on double{

  double min(double v){
    return this>v?this:v;
  }

  double max(double v){
    return this<v?this:v;
  }

  double percentOf(double value){
    return (this * 100)/value;
  }

  double percent(){
    return (this / 100);
  }

  String get toNairaFormat{
    return formatMoney(this);
}

String toCurrencyFormat(String symbol){
    return formatMoney(this, symbol: symbol);
}
}


// extension WidgetExtension on Widget{
//
//   Widget when(bool when){
//     return when?this:SizedBox();
//   }
//
//   AppBar get strip{
//     if(this is AppBar){
//      return AppBar(
//        elevation: 0,
//        backgroundColor: Colors.white,
//      );
//     }
//     return null;
//   }
//
// }






extension ListExtension2 on List{

  bool get isEmptyOrNull{
    return this == null || this.isEmpty;
  }
}


