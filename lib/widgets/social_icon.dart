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
        child: Image(image: AssetImage(img), width: 30));
  }
}
