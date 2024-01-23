import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

enum ToastTypes{SUCCESS,ERROR,WARNING}

Color chooseToastColor(ToastTypes type){
  Color color;
  switch(type){
    case ToastTypes.SUCCESS:
      color= Colors.green;
      break;
    case ToastTypes.ERROR:
      color= Colors.red;
      break;
    case ToastTypes.WARNING:
      color= Colors.amber;
      break;
  }
  return color;
}
void showToast({required String text,required ToastTypes type}){
  Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 5,
      backgroundColor: chooseToastColor(type),
      textColor: Colors.white,
      fontSize: 19.0
  );
}
