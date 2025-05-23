import 'package:flutter/material.dart';

Widget settingButton(Size size, IconData icon, String text) {
  return Container(
    padding: EdgeInsets.symmetric(
      vertical: size.height > 600 ? size.height / 70 : size.height / 90,
    ),
    decoration: BoxDecoration(
        color: Color(0xFF6969AA),
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
              blurRadius: 15,
              spreadRadius: 1,
              color: Colors.red.withOpacity(0.3))
        ]),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          margin: EdgeInsets.only(left: size.width / 50),
          child: Icon(
            icon,
            size: size.height > 600 ? 30 : 20,
            color: Colors.white,
          ),
        ),
        Container(
            child: Text(text,
                style: TextStyle(
                  fontFamily: 'HindSiliguri',
                    fontSize: size.height > 600 ? 20 : 15,
                    color: Colors.white))),
        Container(
          margin: EdgeInsets.only(right: size.width / 50),
          child: Container(
              margin: EdgeInsets.all(size.width / 100),
              padding: EdgeInsets.all(size.width / 100),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        blurRadius: 1,
                        spreadRadius: 1)
                  ]),
              child: Icon(
                Icons.arrow_forward_ios_sharp,
                color: Colors.white,
                size: size.height > 600 ? 30 : 20,
              )),
        ),
      ],
    ),
  );
}
