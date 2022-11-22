// ignore_for_file: prefer_typing_uninitialized_variables, prefer_const_constructors

import 'package:flutter/material.dart';

class SocialButtons extends StatelessWidget {
  final img;
  final ontap;

  const SocialButtons({super.key, required this.img, required this.ontap});

  @override
  Widget build(Object context) {
    return GestureDetector(
        onTap: ontap,
        child: Container(
            height: 40,
            width: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.purple.shade200,
              border: Border.all(color: Colors.purple.shade100, width: 3),
            ),
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: Image(
                image: AssetImage(img),
                fit: BoxFit.scaleDown,
              ),
            )));
  }
}
