import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

Widget loadingg(int number) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
          child: number == 1
              ? SpinKitSpinningLines(
                  color: Get.isDarkMode
                      ? Colors.white
                      : Color.fromARGB(255, 12, 33, 51))
              : SpinKitDoubleBounce(
                  color: Get.isDarkMode
                      ? Colors.white
                      : Color.fromARGB(255, 12, 33, 51))),
      Container(
        child: Text('Fetching ...',
            style: TextStyle(fontSize: 25, color: Colors.blue[400])),
      )
    ],
  );
}
