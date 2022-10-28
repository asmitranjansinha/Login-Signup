import 'package:flutter/material.dart';

class SocialButtons extends StatelessWidget {
  final img;

  const SocialButtons({super.key, required this.img});

  @override
  Widget build(Object context) {
    return Container(
      color: Colors.white54,
      width: 60,
      height: 33,
      child: Center(
        child: Image(image: AssetImage(img), width: 30),
      ),
    );
  }
}
