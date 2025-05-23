import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../components/star.dart';
import '../views/readsurah.dart';


Widget surahList(BuildContext context, List suraList) {
  var size = MediaQuery.of(context).size;
  return ListView.builder(
      physics: BouncingScrollPhysics(),
      itemCount: suraList.length,
      itemBuilder: (context, index) {
        return InkWell(
          highlightColor: Colors.black12,
          onTap: () {
            Get.to(() => ReadSurah(
                  surano: suraList[index].surano.toString(),
                  namebn: suraList[index].suraname.toString(),
                  meaning: suraList[index].meaning.toString(),
                  totalaya: suraList[index].totalayat.toString(),
                  totalruku: suraList[index].totalruku.toString(),
                  offset: 0.0,
                ));
          },
          child: Container(
              width: size.width,
              height: 80,
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
                          child: star(suraList[index].surano),
                        ),
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(suraList[index].suraname,
                                  style: TextStyle(
                                      fontFamily: "Noto Serif",
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      color: Theme.of(context).primaryColor)),
                              Text(
                                  'Verse ${suraList[index].totalayat}   Ruku ${suraList[index].totalruku}',
                                  style: TextStyle(
                                      fontFamily: 'Roboto Condensed',
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
                            suraList[index].meaning,
                            style: TextStyle(
                                fontFamily: 'Roboto Condensed',
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
