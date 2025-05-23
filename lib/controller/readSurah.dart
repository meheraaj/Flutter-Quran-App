import 'dart:io';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';

import 'package:sqflite/sqflite.dart';

import '../models/arabicModel.dart';
import '../models/banglaModel.dart';



class ReadSurahController extends GetxController {
  final int surahN;
  ReadSurahController({
    required this.surahN,
  });

  RxList surahData = [].obs;

  late Database db;

  Future initDb(int surahNo) async {
    var databasesPath = await getDatabasesPath();
    var path = join(databasesPath, "data.db");

// delete existing if any
    await deleteDatabase(path);

// Make sure the parent directory exists
    try {
      await Directory(dirname(path)).create(recursive: true);
    } catch (_) {}

// Copy from asset
    ByteData data = await rootBundle.load(join("assets", "data.db"));
    List<int> bytes =
    data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
    await new File(path).writeAsBytes(bytes, flush: true);

// open the database
    db = await openDatabase(path, readOnly: true);
    getSurahByNo(surahNo);
  }

  Future getSurahByNo(int surahNo) async {
    var bangla = await db
        .rawQuery('SELECT * FROM "bn_bengali" WHERE "sura" = "$surahNo"');
    var arabic = await db
        .rawQuery('SELECT * FROM "quranar" WHERE "SuraIDAr" = "$surahNo"');
    var audio =
    await db.rawQuery('SELECT * FROM "audio" WHERE "sura_no" = "$surahNo"');
    var pdf =
    await db.rawQuery('SELECT * FROM "pdf" WHERE "sura_no" = "$surahNo"');

    print(audio[0]['audio']);

    var bndata = [];
    var ardata = [];
    for (var i = 0; i < bangla.length; i++) {
      bndata.add(BanglaModel(
          text: bangla[i]['text'].toString(),
          aya: int.parse(bangla[i]['aya'].toString()),
          sura: int.parse(bangla[i]['sura'].toString())));
      ardata.add(ArabicModel(
          ayahTextAr: arabic[i]['AyahTextAr'].toString(),
          suraIDAr: int.parse(arabic[i]['SuraIDAr'].toString()),
          verseIDAr: int.parse(arabic[i]['VerseIDAr'].toString())));
    }
    bndata.sort((a, b) => a.aya.compareTo(b.aya));
    ardata.sort((a, b) => a.verseIDAr.compareTo(b.verseIDAr));

    surahData.add(bndata);
    surahData.add(ardata);
    surahData.add(audio);
    surahData.add(pdf);
  }

  @override
  void onInit() {
    super.onInit();
    initDb(surahN);
  }

  @override
  void dispose() {
    surahData.value = [];
    db.close();
    super.dispose();
  }
}
