import 'dart:io';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';

import 'package:sqflite/sqflite.dart';

import '../models/arabicModel.dart';
import '../models/banglaModel.dart';



class GetSurahByParaController extends GetxController {
  final int id;
  GetSurahByParaController({
    required this.id,
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
    var cat = await db.rawQuery('SELECT * FROM "cat" WHERE "cat" = "$surahNo"');
    print(cat[0]);

    var bndata = [];
    var ardata = [];

    for (var i = 0; i < cat.length; i++) {
      var suraNO = cat[i]['sura'].toString();
      var ayaNO = cat[i]['aya'].toString();

      var bangla = await db.rawQuery(
          'SELECT * FROM "bn_bengali" WHERE "sura" = "$suraNO" AND "aya" = "$ayaNO"');
      var arabic = await db.rawQuery(
          'SELECT * FROM "quranar" WHERE "SuraIDAr" = "$suraNO" AND "VerseIDAr" = "$ayaNO"');

      bndata.add(BanglaModel(
          text: bangla[0]['text'].toString(),
          aya: int.parse(bangla[0]['aya'].toString()),
          sura: int.parse(bangla[0]['sura'].toString())));

      ardata.add(ArabicModel(
          ayahTextAr: arabic[0]['AyahTextAr'].toString(),
          suraIDAr: int.parse(arabic[0]['SuraIDAr'].toString()),
          verseIDAr: int.parse(arabic[0]['VerseIDAr'].toString())));
    }
    // var bangla = await db
    //     .rawQuery('SELECT * FROM "bn_bengali" WHERE "para" = "$surahNo"');
    // var arabic =
    //     await db.rawQuery('SELECT * FROM "quranar" WHERE "para" = "$surahNo"');

    // print(bangla[0]);

    //
    // for (var i = 0; i < bangla.length; i++) {
    //
    // }
    bndata.sort((a, b) => a.aya.compareTo(b.aya));
    ardata.sort((a, b) => a.verseIDAr.compareTo(b.verseIDAr));

    surahData.add(bndata);
    surahData.add(ardata);
  }

  @override
  void onInit() {
    super.onInit();
    initDb(id);
  }

  @override
  void dispose() {
    surahData.value = [];
    db.close();
    super.dispose();
  }
}
