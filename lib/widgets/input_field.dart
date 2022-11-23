// ignore_for_file: prefer_typing_uninitialized_variables, must_be_immutable

import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  String icon;
  final String hintxt;
  final fieldcontroller;
  final type;

  InputField({
    super.key,
    required this.icon,
    required this.hintxt,
    required this.fieldcontroller,
    required this.type,
  });

  bool obscureText = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: const Color(0xFF9969C7)),
            borderRadius: BorderRadius.circular(6)),
        child: TextFormField(
          keyboardType: type,
          controller: fieldcontroller,
          obscureText: obscureText,
          decoration: InputDecoration(
              prefixIcon: Image.asset(
                icon,
                scale: 20,
                color: Colors.black45,
              ),
              border: const OutlineInputBorder(borderSide: BorderSide.none),
              filled: true,
              fillColor: Colors.white54,
              hintText: hintxt,
              prefixIconColor: Colors.purple,
              hintStyle: const TextStyle(
                  color: Colors.black54, fontFamily: 'koliko', fontSize: 16.5)),
        ),
      ),
    );
  }
}

class Inputfield4Password extends StatefulWidget {
  String icon;
  final String hintxt;
  final fieldcontroller;
  final type;

  Inputfield4Password(
      {super.key,
      required this.hintxt,
      this.fieldcontroller,
      this.type,
      required this.icon});

  @override
  State<Inputfield4Password> createState() => _Inputfield4PasswordState();
}

class _Inputfield4PasswordState extends State<Inputfield4Password> {
  bool obscuretextcheck = true;
  bool showEye = false;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: const Color(0xFF9969C7)),
            borderRadius: BorderRadius.circular(6)),
        child: TextFormField(
          onChanged: (value) {
            if (value.isNotEmpty) {
              setState(() {
                showEye = true;
              });
            } else {
              setState(() {
                showEye = false;
              });
            }
          },
          keyboardType: widget.type,
          controller: widget.fieldcontroller,
          obscureText: obscuretextcheck,
          decoration: InputDecoration(
              prefixIcon: Image.asset(
                widget.icon,
                scale: 20,
                color: Colors.black45,
              ),
              suffixIcon: showEye
                  ? IconButton(
                      onPressed: (() {
                        setState(() {
                          if (obscuretextcheck) {
                            obscuretextcheck = false;
                          } else {
                            obscuretextcheck = true;
                          }
                        });
                      }),
                      icon: Image.asset(
                        obscuretextcheck
                            ? "assets/icons/show.png"
                            : "assets/icons/eye.png",
                        scale: 27,
                      ))
                  : null,
              border: const OutlineInputBorder(borderSide: BorderSide.none),
              filled: true,
              fillColor: Colors.white54,
              hintText: widget.hintxt,
              prefixIconColor: Colors.purple,
              hintStyle: const TextStyle(
                  color: Colors.black54, fontFamily: 'koliko', fontSize: 16.5)),
        ),
      ),
    );
  }
}
