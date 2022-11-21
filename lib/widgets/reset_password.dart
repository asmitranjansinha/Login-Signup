// ignore_for_file: file_names, must_be_immutable, use_key_in_widget_constructors

import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_signup/widgets/input_field.dart';

class ResetPassword extends StatelessWidget {
  final _emailController = TextEditingController();

  Future forgotPassword() async {
    await FirebaseAuth.instance
        .sendPasswordResetEmail(email: _emailController.text.trim());
    log("reset password email sent");
    Get.back();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color(0xFF804FB3),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.grey,
            ),
          ),
          Text(
            "Reset Password",
            style: TextStyle(
                color: Colors.white70,
                fontFamily: GoogleFonts.montserrat().fontFamily),
          ),
        ],
      ),
      content: InputField(
        icon: Icons.mail_lock_outlined,
        hintxt: "Email",
        obscureText: false,
        fieldcontroller: _emailController,
      ),
      actions: [
        Center(
          child: GestureDetector(
            onTap: forgotPassword,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2),
                color: Colors.white54,
              ),
              height: 45,
              width: 160,
              child: Center(
                child: Text(
                  "Send Request",
                  style: TextStyle(
                      fontSize: 14.5,
                      color: Colors.black54,
                      fontFamily: GoogleFonts.montserrat().fontFamily,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        )
      ],
    );
  }
}
