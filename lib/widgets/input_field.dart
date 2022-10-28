// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final icon;
  final String hintxt;
  final bool obscureText;

  const InputField({super.key, required this.icon, required this.hintxt, required this.obscureText,});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: TextFormField(
        obscureText: obscureText,
        decoration: InputDecoration(
            prefixIcon: Icon(icon, size: 25),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(3),
                borderSide: BorderSide.none),
            filled: true,
            fillColor: Colors.white54,
            hintText: hintxt,
            prefixIconColor: Colors.purple,
            hintStyle: const TextStyle(color: Colors.black54)),
      ),
    );
  }
}
