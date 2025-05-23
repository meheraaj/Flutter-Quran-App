import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget surahCard(
    Size size, String status, String name, int totalAya, int surahNo) {
  return Stack(
    children: [
      Container(
        height: size.height > 600 ? size.height / 6 : size.height / 4,
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: size.width / 30),
        decoration: BoxDecoration(
            color: Color(0xFFc27dfc), borderRadius: BorderRadius.circular(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.only(top: size.height / 100),
              child: Row(
                children: [
                  Icon(
                    CupertinoIcons.book_fill,
                    size: 13,
                    color: Colors.white,
                  ),
                  Text(
                    status,
                    style: TextStyle(fontSize: 12, color: Colors.white),
                  )
                ],
              ),
            ),
            SizedBox(),
            Container(
              padding: EdgeInsets.only(
                  top: size.height / 80, bottom: size.height / 100),
              child: Text(
                name,
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontFamily: 'HindSiliguri'),
              ),
            ),
            Container(
              padding: EdgeInsets.only(bottom: size.height / 100),
              child: Text(
                'Total Ayah : $totalAya',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            )
          ],
        ),
      ),
      Positioned(
          bottom: -40,
          right: -30,
          child: Image.asset(
            'assets/img.png',
            width: size.width > 600 ? size.width / 5 : size.width / 1.9,
          ))
    ],
  );
}
