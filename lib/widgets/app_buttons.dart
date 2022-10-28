// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppButton extends StatelessWidget {
  final txt;
  final Function() route;

  const AppButton({super.key, required this.txt, required this.route});

  @override
  Widget build(Object context) {
    return ElevatedButton(
      onPressed: route,
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white54,
          padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 13),
          shape: const StadiumBorder()),
      child: Text(txt,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black54,
              fontFamily: GoogleFonts.robotoSlab().fontFamily)),
    );
  }
}
