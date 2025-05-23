import 'package:flutter/material.dart';

Widget surainfoCard(Size size, sname, meaning, sno, taya, truku) {
  return Stack(
    children: [
      Container(
        padding: EdgeInsets.symmetric(vertical: size.height / 50),
        width: size.width,
        decoration: BoxDecoration(
          gradient:
              LinearGradient(colors: [Color(0xFF9d61fc), Color(0xFF4B15A3)]),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              child: Text(sname,
                  style: TextStyle(fontSize: 25, color: Colors.white)),
            ),
            Container(
              child: Text(meaning,
                  style: TextStyle(
                      fontFamily: 'Roboto Condensed',
                      fontSize: 25,
                      color: Colors.white)),
            ),
            Container(
              width: size.width / 1.7,
              child: Divider(color: Colors.white),
            ),
            Container(
              child: Text('$taya Verses    $truku Ruku'.toUpperCase(),
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.white)),
            ),
            Container(
              child: Text(
                '﷽',
                style: TextStyle(
                    fontSize: 25, color: Colors.white, fontFamily: 'Amiri'),
              ),
            ),
          ],
        ),
      ),
      Positioned(
          bottom: -(size.height / 15),
          right: -(size.width / 8),
          child: Image.asset('assets/img.png',
              width: size.width,
              color: Color.fromRGBO(255, 255, 255, 0.15),
              colorBlendMode: BlendMode.modulate))
    ],
  );
}
