import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../components/surainfo_card.dart';
import '../controller/getbypara.dart';
import '../listViews/readSuraList.dart';


class ReadSurahByPara extends StatelessWidget {
  final int id;
  final String bname;
  final String ename;
  const ReadSurahByPara(
      {Key? key, required this.id, required this.bname, required this.ename})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GetSurahByParaController surahByParaController =
        Get.put(GetSurahByParaController(id: id));
    final ScrollController scrollController = ScrollController();
    final size = MediaQuery.of(context).size;

    return Scaffold(
        appBar: AppBar(
          title: Text(bname),
        ),
        body: SafeArea(
          child: Container(
              margin: EdgeInsets.symmetric(horizontal: size.width / 30),
              child: Obx(
                () => surahByParaController.surahData.length > 1
                    ? Scrollbar(
                        thickness:
                            surahByParaController.surahData[0].length > 20
                                ? 5
                                : 0,
                        radius: Radius.circular(20),
                        interactive: true,

                        child: ListView(
                          children: [
                            SizedBox(
                              height: size.height / 50,
                            ),
                            Container(
                              height: 300,
                              child: surainfoCard(size, bname, ename, 0,
                                  surahByParaController.surahData[0].length, 0),
                            ),
                            SizedBox(
                              height: size.height / 50,
                            ),
                            Flex(
                              direction: Axis.horizontal,
                              children: [
                                Expanded(
                                    child: Container(
                                        child: readSuraList(
                                  context,
                                  size,
                                  surahByParaController.surahData[0],
                                  surahByParaController.surahData[1],
                                  scrollController,
                                ))),
                              ],
                            )
                          ],
                        ),
                      )
                    : Center(
                        child: CircularProgressIndicator(
                          semanticsLabel: 'Loading',
                        ),
                      ),
              )),
        ));
  }
}
