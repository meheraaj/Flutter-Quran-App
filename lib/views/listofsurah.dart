import 'package:al_quran/views/readsurah.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../components/sura_card.dart';
import '../controller/sharedPref.dart';
import '../controller/suraSqflite.dart';
import '../controller/urlLuncher.dart';
import '../listViews/paralist.dart';
import '../listViews/suralist.dart';
import '../listViews/suralistEPH.dart';


class ListOfSurah extends StatefulWidget {
  const ListOfSurah({Key? key}) : super(key: key);

  @override
  State<ListOfSurah> createState() => _ListOfSurahState();
}

class _ListOfSurahState extends State<ListOfSurah>
    with TickerProviderStateMixin {
  late TabController tabController = TabController(length: 3, vsync: this);
  final SuraSqflite suraSqflite = Get.put(SuraSqflite());
  final SetSharedPrefData setSharedPrefData = Get.put(SetSharedPrefData());

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white10,
        centerTitle: false,
        elevation: 0,
        title: Text('কুরআন শরীফ',
            style: TextStyle(
                fontFamily: 'HindSiliguri',
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: Colors.blue[400])),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: size.width / 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: size.height / 80,
                  ),
                  Text(
                    'Assalamualaikum',
                    style: TextStyle(
                        fontSize: 20,
                        color: Theme.of(context).primaryColor.withOpacity(0.5)),
                  ),
                  SizedBox(
                    height: size.height / 150,
                  ),
                  Text('BROTHER / SISTER',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Noto Serif',
                          fontSize: 22,
                          color: Theme.of(context).primaryColor))
                ],
              ),
            ),
            SizedBox(
              height: size.height / 50,
            ),
            Obx(
              // ignore: unrelated_type_equality_checks
              () => setSharedPrefData.nameOFsurah == ''
                  ? GestureDetector(
                      onTap: () {
                        Get.to(ReadSurah(
                          namebn: suraSqflite.maindata[0].suraname,
                          surano: suraSqflite.maindata[0].surano,
                          totalaya: suraSqflite.maindata[0].totalayat,
                          totalruku: suraSqflite.maindata[0].totalruku,
                          meaning: suraSqflite.maindata[0].meaning,
                          offset: 0.0,
                        ));
                      },
                      child: surahCard(
                          size, "Start Reading", 'Surah Fatiha', 7, 1))
                  : GestureDetector(
                      onTap: () {
                        Get.to(ReadSurah(
                          namebn: suraSqflite
                              .maindata[
                                  setSharedPrefData.surahNumber.toInt() - 1]
                              .suraname,
                          surano: suraSqflite
                              .maindata[
                                  setSharedPrefData.surahNumber.toInt() - 1]
                              .surano,
                          totalaya: suraSqflite
                              .maindata[
                                  setSharedPrefData.surahNumber.toInt() - 1]
                              .totalayat,
                          totalruku: suraSqflite
                              .maindata[
                                  setSharedPrefData.surahNumber.toInt() - 1]
                              .totalruku,
                          meaning: suraSqflite
                              .maindata[
                                  setSharedPrefData.surahNumber.toInt() - 1]
                              .meaning,
                          offset: setSharedPrefData.offsetoflist.toDouble(),
                        ));
                      },
                      child: surahCard(
                          size,
                          'Last Read',
                          setSharedPrefData.nameOFsurah.toString(),
                          setSharedPrefData.surahAyah.toInt(),
                          setSharedPrefData.surahNumber.toInt()),
                    ),
            ),

            SizedBox(
              height: 50,
              child: AppBar(
                bottom: TabBar(
                  controller: tabController,
                  tabs: [
                    Tab(
                      text: 'সূরা',
                    ),
                    Tab(
                      text: 'ছোট সূরা',
                    ),
                    Tab(
                      text: 'বিষয় ভিত্তিক',
                    ),
                  ],
                ),
              ),
            ),

            // create widgets for each tab bar here
            kIsWeb
                ? Column(
                    children: [
                      Text(
                        'ওয়েব এ বর্তমানে কোরআন পড়ার সুবিধা নেই। কুরআন পড়ার জন্যে এন্ড্রোইড ভার্সন ডাউনলোড করুন। ',
                        style: TextStyle(fontSize: size.width / 40),
                        textAlign: TextAlign.center,
                      ),
                      Container(
                          margin:
                              EdgeInsets.symmetric(vertical: size.width / 28),
                          alignment: Alignment.center,
                          child: MaterialButton(
                            child: Text(
                              'ডাউনলোড করুন Android ভার্সন',
                              style: TextStyle(
                                  fontFamily: 'HindSiliguri',
                                  color: Colors.white),
                            ),
                            onPressed: () {
                              lucnUrl(
                                  'https://drive.google.com/drive/u/0/folders/1RMF8BvUG9n_u9kKBCx8l3H-Ias2p2aJz');
                            },
                            textColor: Colors.white,
                            elevation: 10,
                            minWidth: size.width / 4,
                            height: size.height / 15,
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            color: Color.fromARGB(255, 235, 16, 64),
                          )),
                    ],
                  )
                : Expanded(
                    child: TabBarView(controller: tabController, children: [
                      // first tab bar view widget
                      Obx(() => suraSqflite.maindata.length > 1
                          ? Container(
                              child: Scrollbar(
                                  thickness: 10,
                                  radius: Radius.circular(20),
                                  interactive: true,
                                  child:
                                      surahList(context, suraSqflite.maindata)))
                          : Container(
                              child: suralistEmptyPlaceholder(context, size),
                            )),

                      // second tab bar viiew widget
                      Obx(() => suraSqflite.surahData.length > 1
                          ? Container(
                              child: Scrollbar(
                                  thickness: 10,
                                  radius: Radius.circular(20),
                                  interactive: true,
                                  child: surahList(
                                      context, suraSqflite.surahData)))
                          : Container(
                              child: suralistEmptyPlaceholder(context, size),
                            )),
                      Obx((() => suraSqflite.catName.length > 0
                          ? Container(
                              child: Scrollbar(
                                  thickness: 10,
                                  radius: Radius.circular(20),
                                  interactive: true,
                                  child:
                                      paraList(context, suraSqflite.catName)),
                            )
                          : Container()))
                    ]),
                  )
          ],
        ),
      ),
    );
  }
}
