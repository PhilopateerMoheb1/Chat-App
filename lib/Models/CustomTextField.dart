import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField(
      {super.key, this.hintText, this.onChanged, this.ispassword = false});
  String? hintText;
  bool ispassword;
  Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(color: Colors.white),
      obscureText: ispassword,
      obscuringCharacter: '*',
      validator: (value) {
        if (value!.isEmpty) {
          return 'value is Empty';
        }
        return null;
      },
      onChanged: onChanged,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.white,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        label: Text(hintText ?? " "),
        labelStyle: const TextStyle(
          color: Colors.white,
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.white,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
