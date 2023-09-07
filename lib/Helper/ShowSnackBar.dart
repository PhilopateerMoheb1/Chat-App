import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void ShowSnackBarMsg(BuildContext context, String msg) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(msg),
    ),
  );
}
