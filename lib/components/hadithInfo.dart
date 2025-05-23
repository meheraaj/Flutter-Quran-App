import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

Widget hadithInfo(Size size, sname, meaning) {
  return kIsWeb
      ? Container(
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
                child: Text(
                  sname,
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontFamily: 'HindSiliguri'),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: size.width / 25),
                child: Text(
                  meaning,
                  style: TextStyle(
                      fontFamily: 'Roboto Condensed',
                      fontSize: 25,
                      color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                width: size.width / 1.7,
                child: Divider(color: Colors.white),
              ),
              Container(
                child: Text(
                  '﷽',
                  style: TextStyle(
                      fontSize: 25, color: Colors.white, fontFamily: 'Amiri'),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        )
      : Stack(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: size.height / 50),
              width: size.width,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Color(0xFF9d61fc), Color(0xFF4B15A3)]),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    child: Text(
                      sname,
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                          fontFamily: 'HindSiliguri'),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: size.width / 25),
                    child: Text(
                      meaning,
                      style: TextStyle(
                          fontFamily: 'Roboto Condensed',
                          fontSize: 25,
                          color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    width: size.width / 1.7,
                    child: Divider(color: Colors.white),
                  ),
                  Container(
                    child: Text(
                      '﷽',
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                          fontFamily: 'Amiri'),
                      textAlign: TextAlign.center,
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
