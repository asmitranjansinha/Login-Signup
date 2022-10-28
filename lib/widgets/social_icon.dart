import 'package:flutter/material.dart';

class SocialButtons extends StatelessWidget {
  final img;
  final ontap;

  const SocialButtons({super.key, required this.img, this.ontap});

  @override
  Widget build(Object context) {
    return GestureDetector(
      onTap: () {
        ontap;
      },
      child: Container(
        color: Colors.white54,
        width: 60,
        height: 33,
        child: Center(
          child: Image(image: AssetImage(img), width: 30),
        ),
      ),
    );
  }
}
