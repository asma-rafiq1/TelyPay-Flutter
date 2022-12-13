import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

class Utils {
  static void showFlushBar(BuildContext context, String message) {
    Flushbar(
      message: message,
      forwardAnimationCurve: Curves.decelerate,
      padding: const EdgeInsets.all(15),
      backgroundColor: Colors.red,
      duration: const Duration(seconds: 3),
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      icon: const Icon(
        Icons.error,
        size: 28,
        color: Colors.white,
      ),
      positionOffset: 20.0,
      reverseAnimationCurve: Curves.easeInOut,
      flushbarPosition: FlushbarPosition.TOP,
    ).show(context);
  }

  static void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  // static void toastMessage(BuildContext context, String message) {
  //   Fluttertoast.showToast(
  //     context,
  //     msg: message,
  //     toastDuration: 1,
  //   );
  // }
}
