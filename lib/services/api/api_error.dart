
import 'dart:convert';

import 'package:chopper/chopper.dart';
import 'package:flutter/cupertino.dart';
import 'package:liquede/commons/overlay.dart';
import 'package:liquede/commons/utils.dart';

class APIError{

  APIError._();
  List<String> errorList = [];

  String get concatError => _join();

  String _join(){
    String error = "";
    errorList.forEach((element) {
      error += "\n$element";
    });

    if(error.contains("Network is unreachable") || error.contains("SocketException")){
      return "Unable to connect, Please check your internet connection.";
    }
    return (error.trim().length>1)?error:"Something went wrong.";
  }

  factory APIError.object([Exception? error]){
    APIError er = APIError._();
    er.errorList = [error.toString()];
return er;
  }

  factory APIError.fromResponse(Response error){
    APIError er = APIError._();
    if(error.statusCode == 503){
      er.errorList.add("Server not reachable at the moment, Please try again later");
      return er;
    }
   Map jsonData = json.decode(error.bodyString);
    er.errorList = [jsonData["developerText"]];
    return er;
  }

  factory APIError.fromString([String? error, List<String>? validationError]){
    APIError er = APIError._();
    er.errorList = [error!];
    if(validationError != null)
    er.errorList.addAll(validationError);
    return er;
  }

  factory APIError.fromList([List<String>? error]){
    APIError er = APIError._();
    er.errorList = error!;
    return er;
  }
}

extension APIErrorExt on APIError{

  Function(APIError) wrap(BuildContext context) => (error){
    hideOverlay(context);
    showErrorPopUp(context, error.concatError);
  };

}
