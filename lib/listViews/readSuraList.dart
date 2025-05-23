import 'package:flutter/material.dart';


import '../components/ayaCard.dart';

Widget readSuraList(BuildContext context, Size size, List suraBN, List suraAr,
    ScrollController controller) {
  return ListView.builder(
      physics: ClampingScrollPhysics(),
      itemCount: suraBN.length,
      controller: controller,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return ayaCard(size, suraBN[index].text, suraAr[index].ayahTextAr,
            suraBN[index].aya, suraBN[index].sura, context);
      });
}
