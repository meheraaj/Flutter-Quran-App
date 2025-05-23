import 'package:al_quran/components/star.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controller/settingController.dart';

Widget ayaCard(Size size, surabn, suraAr, aya, sura, context) {
  return Container(
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
                child: star(sura.toString()),
              ),
              Container(
                width: size.width / 12,
                child: star(aya.toString()),
              ),
            ],
          ),
        ),
        Container(
            padding: EdgeInsets.symmetric(
                vertical: size.height / 80, horizontal: size.width / 60),
            alignment: Alignment.centerRight,
            child: Text(
              suraAr.replaceAll('بِسْمِ اللَّهِ الرَّحْمَٰنِ الرَّحِيمِ',
                  'بِسْمِ اللَّهِ الرَّحْمَٰنِ الرَّحِيمِ\n'),
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
                          .toDouble(),
                  fontWeight: FontWeight.w600),
              textDirection: TextDirection.rtl,
            )),
        Container(
          alignment: Alignment.centerLeft,
          child: Text(surabn,
              style: TextStyle(
                  fontSize:
                      Provider.of<SettingController>(context, listen: true)
                          .bsize
                          .toDouble(),
                  fontFamily:
                      Provider.of<SettingController>(context, listen: true)
                                  .bfont ==
                              0
                          ? 'HindSiliguri'
                          : 'Noto Serif')),
        ),
        Container(
          width: size.width / 1.89,
          child: Divider(
            color: Colors.blue,
          ),
        ),
      ],
    ),
  );
}
