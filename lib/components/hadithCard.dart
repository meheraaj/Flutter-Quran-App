import 'package:al_quran/components/star.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../controller/settingController.dart';

Widget hadithCard(Size size, surabn, suraAr, sura, rabeyi, topicName, context) {
  return Container(
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Get.isDarkMode
            ? Color.fromARGB(255, 11, 15, 88).withOpacity(0.5)
            : Color.fromARGB(255, 248, 243, 243).withOpacity(0.5)),
    padding: EdgeInsets.symmetric(vertical: size.height / 70),
    margin: EdgeInsets.symmetric(vertical: size.height / 70),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.symmetric(
              horizontal: size.width / 50, vertical: size.height / 100),
          decoration: BoxDecoration(
              color: Color(0x98D9D9F3), borderRadius: BorderRadius.circular(5)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: size.width / 12,
                height: size.width < 600 ? null : size.width / 30,
                child: star(sura.toString()),
              ),
            ],
          ),
        ),
        Container(
            padding: EdgeInsets.symmetric(
                vertical: size.height / 80, horizontal: size.width / 60),
            alignment: Alignment.centerRight,
            child: Text(
              suraAr,
              style: TextStyle(
                  fontFamily:
                      Provider.of<SettingController>(context, listen: true)
                                  .afont ==
                              0
                          ? 'ScheherazadeNew'
                          : 'Amiri',
                  fontSize:
                      Provider.of<SettingController>(context, listen: true)
                          .asize
                          .toDouble()),
              textDirection: TextDirection.rtl,
              textAlign: TextAlign.center,
            )),
        SizedBox(
          height: size.height / 80,
        ),
        Container(
          alignment: Alignment.centerLeft,
          child: Text(
            surabn,
            style: TextStyle(
                fontSize: Provider.of<SettingController>(context, listen: true)
                    .bsize
                    .toDouble(),
                fontFamily:
                    Provider.of<SettingController>(context, listen: true)
                                .bfont ==
                            0
                        ? 'HindSiliguri'
                        : 'Noto Serif'),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(
          height: size.height / 80,
        ),
        Container(
          alignment: Alignment.center,
          child: Text(
            rabeyi == ''
                ? "বর্ণনাকারীঃ " + 'পাওয়া যায়নি'
                : "বর্ণনাকারীঃ " + rabeyi,
            style: TextStyle(
                fontSize: Provider.of<SettingController>(context, listen: true)
                    .bsize
                    .toDouble(),
                fontWeight: FontWeight.bold,
                fontFamily:
                    Provider.of<SettingController>(context, listen: true)
                                .bfont ==
                            0
                        ? 'HindSiliguri'
                        : 'Noto Serif'),
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          alignment: Alignment.center,
          child: Text(
            "পরিচ্ছেদঃ " + topicName == '' ? 'পাওয়া যায়নি' : topicName,
            style: TextStyle(
              fontSize: Provider.of<SettingController>(context, listen: true)
                  .bsize
                  .toDouble(),
              fontFamily:
                  Provider.of<SettingController>(context, listen: true).bfont ==
                          0
                      ? 'HindSiliguri'
                      : 'Noto Serif',
            ),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(
          height: size.height / 80,
        ),
        Container(
          width: size.width / 1.89,
          child: Divider(
            thickness: size.height / 150,
          ),
        ),
      ],
    ),
  );
}
