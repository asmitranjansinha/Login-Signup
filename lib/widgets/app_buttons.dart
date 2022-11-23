// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final txt;
  final func;

  const AppButton({super.key, required this.txt, required this.func});

  @override
  Widget build(Object context) {
    return GestureDetector(
      onTap: func,
      child: Container(
        height: 46.5,
        width: 200,
        decoration: BoxDecoration(boxShadow: const [
          BoxShadow(
              blurRadius: 18, offset: Offset(2, 10), color: Colors.black38)
        ], color: Colors.white70, borderRadius: BorderRadius.circular(100)),
        child: Center(
          child: Text(
            txt,
            style: const TextStyle(
                fontSize: 18.5,
                fontWeight: FontWeight.w600,
                color: Colors.black54,
                fontFamily: "Kanji_PA"),
          ),
        ),
      ),
    );
  }
}
