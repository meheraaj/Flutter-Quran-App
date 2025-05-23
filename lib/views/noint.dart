import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class NoInternet extends StatelessWidget {
  const NoInternet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            child: Lottie.asset('assets/nowifi.json', width: size.width / 1.1)),
        Container(
          alignment: Alignment.center,
          child: Text(
            'Whoops!',
            style: TextStyle(
                fontSize: size.width / 10, fontFamily: 'HindSiliguri'),
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: size.width / 14),
          alignment: Alignment.center,
          child: Text(
            'ইন্টারনেট কানেকশন নেই \n ইন্টারনেট কানেকশন চালু করুন',
            style:
                TextStyle(fontSize: size.width / 18, fontFamily: 'Noto Serif'),
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: size.width / 14),
          alignment: Alignment.center,
          child: Text(
            'হাদিস পড়ার জন্য ইন্টারনেট কানেকশন থাকা লাগবে ',
            style:
                TextStyle(fontSize: size.width / 22, fontFamily: 'Noto Serif'),
            textAlign: TextAlign.center,
          ),
        ),
        Container(
            margin: EdgeInsets.symmetric(vertical: size.width / 14),
            alignment: Alignment.center,
            child: MaterialButton(
              child: Text(
                'ফিরে জান',
                style: TextStyle(fontFamily: 'HindSiliguri'),
              ),
              onPressed: () {},
              textColor: Colors.white,
              elevation: 10,
              minWidth: size.width / 4,
              height: size.height / 20,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              color: Color.fromARGB(255, 235, 16, 64),
            )),
      ],
    ));
  }
}
