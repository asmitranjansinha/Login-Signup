import 'package:flutter/material.dart';

MaterialButton socialIcon(context, image, route,) {
  return MaterialButton(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
    highlightColor: Colors.white,
      onPressed: () {
        Navigator.pushNamed(context, route);
      },
      child: image,);
}
