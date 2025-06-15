import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void toastMsg({required String msg}) {
  Fluttertoast.showToast(
    fontSize: 16.0,
    msg: msg,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    backgroundColor: Colors.grey[600],
    textColor: Colors.white,
  );
}
