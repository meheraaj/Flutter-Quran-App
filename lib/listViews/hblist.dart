import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../components/star.dart';
import '../views/bookchapter.dart';
import '../views/viewhadith.dart';


Widget hadithBList(BuildContext context, List catName, int whichss) {
  var size = MediaQuery.of(context).size;
  return ListView.builder(
      physics: BouncingScrollPhysics(),
      itemCount: catName.length,
      itemBuilder: (context, index) {
        return InkWell(
          highlightColor: Colors.black12,
          onTap: () {
            if (whichss == 1) {
              if (catName[index].bookKey != '') {
                Get.to(() => BookChapter(
                      bookkey: catName[index].bookKey,
                      bookName: catName[index].nameBengali,
                    ));
              } else {}
            } else if (whichss == 2) {
              Get.to(() => ViewHadith(
                  id: catName[index].chSerial,
                  bname: catName[index].nameBengali,
                  ename: catName[index].nameEnglish,
                  bookkey: catName[index].bookInitial));
            }
          },
          child: Container(
              width: size.width,
              margin: EdgeInsets.only(top: size.height / 50, bottom: 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: size.width / 10,
                          height: size.width < 600 ? null : size.width / 30,
                          child: star((index + 1).toString()),
                        ),
                        Container(
                          width: size.width / 3,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(catName[index].nameBengali,
                                  style: TextStyle(
                                      fontFamily: 'Noto Serif',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18,
                                      color: Theme.of(context).primaryColor)),
                              Text(
                                  whichss == 1
                                      ? 'Total Hadith : ' +
                                          catName[index].hadithNumber.toString()
                                      : catName[index].bookInitial.toString(),
                                  style: TextStyle(
                                      fontFamily: 'Roboto Condensed',
                                      fontWeight: FontWeight.normal,
                                      fontSize: 15,
                                      color: Theme.of(context).primaryColor))
                            ],
                          ),
                        ),
                        SizedBox(),
                        SizedBox(),
                        Container(
                          width: size.width / 4,
                          child: Text(
                            catName[index].nameEnglish,
                            style: TextStyle(
                                fontFamily: "Roboto Condensed",
                                fontWeight: FontWeight.normal,
                                fontSize: 15,
                                color: Theme.of(context).primaryColor),
                            maxLines: 2,
                            textAlign: TextAlign.center,
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    transform: Matrix4.translationValues(0.0, 7.0, 0),
                    width: size.width / 1.2,
                    child: Divider(),
                  )
                ],
              )),
        );
      });
}
