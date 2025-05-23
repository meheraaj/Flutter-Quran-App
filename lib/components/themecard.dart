import 'package:flutter/material.dart';

Widget themeCard(Color color, String theme, Size size, Function funcc) {
  return InkWell(
    onTap: () => funcc(),
    child: Container(
      height: size.height / 4,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: size.height / 5,
            width: size.width / 3,
            decoration: BoxDecoration(color: color, boxShadow: [
              BoxShadow(
                  color: Colors.white.withOpacity(0.8),
                  blurRadius: 1,
                  spreadRadius: 1)
            ]),
          ),
          Container(
            child: Text(
              theme,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    ),
  );
}
