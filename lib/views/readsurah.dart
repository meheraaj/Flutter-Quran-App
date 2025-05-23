import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../components/surainfo_card.dart';
import '../controller/audioPlay.dart';
import '../controller/checkConnection.dart';
import '../controller/readSurah.dart';
import '../controller/sharedPref.dart';
import '../controller/urlLuncher.dart';
import '../listViews/readSuraList.dart';


class ReadSurah extends StatelessWidget {
  final String namebn;
  final String surano;
  final String totalaya;
  final String totalruku;
  final String meaning;
  final double offset;
  const ReadSurah(
      {Key? key,
      required this.namebn,
      required this.surano,
      required this.totalaya,
      required this.totalruku,
      required this.meaning,
      required this.offset})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ReadSurahController readSurahController =
        Get.put(ReadSurahController(surahN: int.parse(this.surano)));
    final SetSharedPrefData setSharedPrefData = Get.put(SetSharedPrefData());

    final ScrollController scrollController =
        ScrollController(initialScrollOffset: offset);

    scrollController.addListener(() {
      setSharedPrefData.setLastReadedSurah(namebn, int.parse(surano),
          int.parse(totalaya), scrollController.offset);
    });
    final AudioPlay audioPlay = Get.put(AudioPlay());

    final size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async {
        scrollController.dispose();
        audioPlay.disposeAudio();

        return true;
      },
      child: Scaffold(
          body: SafeArea(
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: size.width / 20),
              child: NestedScrollView(
                  physics: NeverScrollableScrollPhysics(),
                  headerSliverBuilder: (context, bool isScolled) {
                    return [
                      SliverAppBar(
                          backgroundColor: Colors.transparent,
                          actions: [
                            Provider.of<CheckConnection>(context, listen: true)
                                    .hasConnection
                                ? Obx(() => IconButton(
                                    tooltip: audioPlay.playerState == 'stopped'
                                        ? "Play"
                                        : "Stop",
                                    onPressed: () {
                                      audioPlay.playerState == 'stopped'
                                          ? audioPlay.initAudio(
                                              readSurahController.surahData[2]
                                                      [0]['audio']
                                                  .toString(),
                                              namebn)
                                          : audioPlay.stopAudio();
                                    },
                                    icon: Icon(
                                      audioPlay.playerState != 'stopped'
                                          ? Icons.stop_circle_outlined
                                          : Icons.play_circle,
                                      size: size.width / 10,
                                      color: Color(0xFFE8FFEE),
                                    )))
                                : Container(),
                            Provider.of<CheckConnection>(context, listen: true)
                                    .hasConnection
                                ? IconButton(
                                    tooltip: 'Download $namebn PDF',
                                    onPressed: () {
                                      Get.defaultDialog(
                                          confirmTextColor: Colors.black,
                                          backgroundColor: Get.isDarkMode
                                              ? Color(0xFF362A2A)
                                              : Color(0xFFBFBFBF),
                                          title: "Do You Want to Open Browser?",
                                          content: Container(
                                            child: Text(
                                              "If you want to download '$namebn' PDF Press 'OK',It Will open Browser!!",
                                              style: TextStyle(fontSize: 15),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                          textConfirm: 'OK',
                                          onConfirm: () => lucnUrl(
                                              readSurahController.surahData[3]
                                                  [0]['pdf']),
                                          textCancel: "Cancel");
                                    },
                                    icon: Icon(
                                      Icons.download_for_offline,
                                      color: Color(0xFFE8FFEE),
                                      size: size.width / 10,
                                    ))
                                : Container()
                          ],
                          elevation: 0,
                          expandedHeight: 300,
                          leading: IconButton(
                            icon: Icon(
                              Icons.arrow_back,
                              color: Color(0xFFE8FFEE),
                            ),
                            onPressed: () {
                              scrollController.dispose();
                              audioPlay.disposeAudio();
                              Get.back();
                            },
                          ),
                          floating: false,
                          pinned: false,
                          flexibleSpace: FlexibleSpaceBar(
                            background: Container(
                              padding: EdgeInsets.only(top: size.height / 100),
                              child: surainfoCard(size, namebn, meaning, surano,
                                  totalaya, totalruku),
                            ),
                          )),
                      SliverPadding(
                        padding: EdgeInsets.only(bottom: size.height / 50),
                      )
                    ];
                  },
                  body: Obx(() => readSurahController.surahData.length > 0
                      ? Flex(
                          direction: Axis.horizontal,
                          children: [
                            Expanded(
                                child: Container(
                                    child: Scrollbar(
                              interactive: true,
                              controller: scrollController,
                              thickness:
                                  readSurahController.surahData[1].length > 20
                                      ? 5
                                      : 0,
                              radius: Radius.circular(20),
                              child: readSuraList(
                                  context,
                                  size,
                                  readSurahController.surahData[0],
                                  readSurahController.surahData[1],
                                  scrollController),
                            ))),
                          ],
                        )
                      : Container())),
            ),
            Obx(() => audioPlay.playerState != 'stopped'
                ? Positioned(
                    left: 0.0,
                    right: 0.0,
                    bottom: 0.0,
                    child: Container(
                      padding: EdgeInsets.zero,
                      decoration: BoxDecoration(
                          color:
                              Get.isDarkMode ? Color(0xFF1B1029) : Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.blue.withOpacity(0.9),
                                blurRadius: 2,
                                spreadRadius: 1)
                          ]),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: size.width / 15),
                              child: ProgressBar(
                                progress: Duration(
                                    milliseconds:
                                        audioPlay.positionInInt.toInt()),
                                total: Duration(
                                    milliseconds:
                                        audioPlay.durationInInt.toInt()),
                                buffered: Duration(
                                    milliseconds:
                                        audioPlay.bufferedDuration.toInt()),
                                progressBarColor: Theme.of(context)
                                    .sliderTheme
                                    .activeTrackColor,
                                baseBarColor: Theme.of(context).primaryColor,
                                bufferedBarColor: Colors.red,
                                thumbColor: Theme.of(context).primaryColor,
                                barHeight: 3.0,
                                timeLabelLocation: TimeLabelLocation.sides,
                                thumbRadius: 5.0,
                                onSeek: (duration) {
                                  audioPlay.seekTo(duration);
                                },
                              )),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(
                                  highlightColor: Colors.black,
                                  onTap: () {
                                    audioPlay.volume < 1
                                        ? audioPlay.muteAudio(1.0)
                                        : audioPlay.muteAudio(0.0);
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    padding: EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                        color: Color(0xFF18163D),
                                        borderRadius: BorderRadius.circular(50),
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.blue,
                                              spreadRadius: 1,
                                              blurRadius: 5)
                                        ]),
                                    child: Icon(
                                      audioPlay.volume < 1
                                          ? Icons.volume_off_rounded
                                          : Icons.volume_down,
                                      size: 30,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                SizedBox(width: size.width / 50),
                                InkWell(
                                  highlightColor: Colors.black,
                                  onTap: () {
                                    audioPlay.playerState == 'playing'
                                        ? audioPlay.pauseAudio()
                                        : audioPlay.resumeAudio();
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    padding: EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                        color: Color(0xFF18163D),
                                        borderRadius: BorderRadius.circular(50),
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.blue,
                                              spreadRadius: 1,
                                              blurRadius: 5)
                                        ]),
                                    child: Icon(
                                      audioPlay.playerState == "playing"
                                          ? Icons.pause
                                          : Icons.play_arrow,
                                      size: 40,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                SizedBox(width: size.width / 50),
                                InkWell(
                                  highlightColor: Colors.black,
                                  onTap: () {
                                    audioPlay.stopAudio();
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    padding: EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                        color: Color(0xFF18163D),
                                        borderRadius: BorderRadius.circular(50),
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.blue,
                                              spreadRadius: 1,
                                              blurRadius: 5)
                                        ]),
                                    child: Icon(
                                      Icons.stop,
                                      size: 30,
                                      color: Colors.white,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(height: size.height / 100),
                        ],
                      ),
                    ))
                : Container())
          ],
        ),
      )),
    );
  }
}
