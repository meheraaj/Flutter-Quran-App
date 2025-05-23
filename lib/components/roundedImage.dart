import 'package:flutter/material.dart';

Widget roundedImage(Size size) {
  return Container(
    width: size.width / 2,
    height: size.height / 4,
    alignment: Alignment.center,
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(100)),
    child: Image.asset('assets/img.png'),
  );
}
