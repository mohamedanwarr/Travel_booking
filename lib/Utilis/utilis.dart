import 'package:flutter/material.dart';



class Utilis {
  static final messageKey = GlobalKey<ScaffoldMessengerState>();

  static void showStyledSnackBar(String? text, {bool isSuccess = false}) {
    if (text == null) return;

    final snackBar = SnackBar(
      elevation: 8.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      behavior: SnackBarBehavior.floating,
      padding: const EdgeInsets.all(10),
      backgroundColor: isSuccess ? Colors.green.shade200 : Colors.black54,
      content: Text(
        text,
        style: const TextStyle(color: Colors.white),
      ),
      duration: const Duration(milliseconds: 4000) ,
      action: !isSuccess ? SnackBarAction(label: 'Close',textColor: Colors.white, onPressed: () {messageKey.currentState!.hideCurrentSnackBar();},
      )
          : SnackBarAction(label: 'Close',textColor: Colors.white, onPressed: () {messageKey.currentState!.hideCurrentSnackBar();},
    ));

    messageKey.currentState!..removeCurrentSnackBar()..showSnackBar(snackBar);
  }
}
