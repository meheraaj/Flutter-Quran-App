import 'package:flutter/material.dart';

Widget star(String text) {
  return Stack(
    alignment: Alignment.center,
    children: [
      Container(
        child: Image.asset('assets/star.png'),
      ),
      Positioned(
          child: Text(
        text,
        style: TextStyle(
            fontSize: text.length > 2 ? 12 : 15,
            fontFamily: 'Roboto Condensed'),
        textAlign: TextAlign.end,
      ))
    ],
  );
}
