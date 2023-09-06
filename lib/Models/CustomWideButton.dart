import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomWideButton extends StatelessWidget {
  CustomWideButton({
    super.key,
    this.buttonText,
  });
  String? buttonText;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Colors.white,
      ),
      height: 60,
      width: double.infinity,
      child: Center(
          child: Text(
        buttonText ?? " ",
        style: const TextStyle(
          fontSize: 20,
        ),
      )),
    );
  }
}
