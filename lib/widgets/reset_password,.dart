// ignore_for_file: file_names, must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_signup/widgets/input_field.dart';

class ResetPassword extends StatelessWidget {
  String email = "";

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
        saveinput: email,
      ),
      actions: [
        Center(
          child: MaterialButton(
              color: Colors.white54,
              child: Text(
                "Send Request",
                style: TextStyle(
                    color: Colors.black54,
                    fontFamily: GoogleFonts.montserrat().fontFamily,
                    fontWeight: FontWeight.w600),
              ),
              onPressed: () {
                Navigator.pop(context);
              }),
        )
      ],
    );
  }
}
