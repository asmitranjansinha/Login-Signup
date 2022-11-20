// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final icon;
  final String hintxt;
  final bool obscureText;
  var saveinput;
  final fieldcontroller;

  InputField(
      {super.key,
      required this.icon,
      required this.hintxt,
      required this.obscureText,
      required this.saveinput,
      required this.fieldcontroller});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Color(0xFF9969C7)),
            borderRadius: BorderRadius.circular(6)),
        child: TextFormField(
          controller: fieldcontroller,
          obscureText: obscureText,
          decoration: InputDecoration(
              prefixIcon: Icon(icon, size: 25, color: Colors.black54),
              border: const OutlineInputBorder(borderSide: BorderSide.none),
              filled: true,
              fillColor: Colors.white54,
              hintText: hintxt,
              prefixIconColor: Colors.purple,
              hintStyle: const TextStyle(color: Colors.black54)),
          onChanged: (value) {
            saveinput = value;
          },
          validator: (value) {
            if (value!.isEmpty) {
              return "$hintxt cannot be empty";
            }
            return null;
          },
        ),
      ),
    );
  }
}
