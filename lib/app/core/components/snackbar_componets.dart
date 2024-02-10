import 'package:flutter/material.dart';

showSnacksBar(
    {required BuildContext context,
    required String message,
    bool isError = true}) {
  SnackBar snackBar = SnackBar(
    content: Text(message),
    backgroundColor: (isError) ? Colors.red : Colors.green,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16))),
    duration: const Duration(seconds: 3),
    showCloseIcon: true,
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
