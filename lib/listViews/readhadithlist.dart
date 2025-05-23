import 'package:flutter/material.dart';

import '../components/hadithCard.dart';



Widget readHadithList(BuildContext context, Size size, List hadithList) {
  return ListView.builder(
      physics: ClampingScrollPhysics(),
      itemCount: hadithList.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return hadithCard(
            size,
            hadithList[index].hadithBengali,
            hadithList[index].hadithArabic,
            hadithList[index].hadithNo,
            hadithList[index].rabiNameBn,
            hadithList[index].topicName,
            context);
      });
}
