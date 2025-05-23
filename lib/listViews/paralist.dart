import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../components/star.dart';
import '../views/readsurahbypara.dart';


Widget paraList(BuildContext context, List catName) {
  var size = MediaQuery.of(context).size;
  return ListView.builder(
      physics: BouncingScrollPhysics(),
      itemCount: catName.length,
      itemBuilder: (context, index) {
        return InkWell(
          highlightColor: Colors.black12,
          onTap: () {
            Get.to(() => ReadSurahByPara(
                  id: catName[index].id,
                  bname: catName[index].bname,
                  ename: catName[index].ename,
                ));
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
                          child: star(catName[index].id.toString()),
                        ),
                        Container(
                          width: size.width / 3,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(catName[index].bname,
                                  style: TextStyle(
                                      fontFamily: 'Noto Serif',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      color: Theme.of(context).primaryColor)),
                            ],
                          ),
                        ),
                        SizedBox(),
                        SizedBox(),
                        Container(
                          width: size.width / 4,
                          child: Text(
                            catName[index].ename,
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
