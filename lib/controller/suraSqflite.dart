import 'dart:io';

import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../models/cat_nameModel.dart';
import '../models/suraModel.dart';

class SuraSqflite extends GetxController {
  RxList maindata = [].obs;
  RxList surahData = [].obs;
  RxList catName = [].obs;

  // late BanglaModel banglaModel;
  // late ArabicModel arabicModel;
  // late AudioModel audioModel;
  // late PDFModel pdfModel;
  // late SuraModel suraModel;

  // Database Related Sqflite

  late Database db;
  Future initDb() async {
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
    getSurahList();
  }

  // Future queryAll() async {
  //   var ar = await db.rawQuery(
  //       'SELECT * FROM "quranar" WHERE "SuraIDAr" = "100" ORDER BY "DatabaseIDAr"');
  //   var bn = await db.rawQuery(
  //       'SELECT * FROM "bn_bengali" WHERE "sura" = "100" ORDER BY "sura"');
  //   var name =
  //       await db.rawQuery('SELECT * FROM "sura" WHERE "sura_no" = "100"');
  // }

  List namajerchotosura = [
    1,
    100,
    101,
    102,
    103,
    104,
    105,
    106,
    107,
    108,
    109,
    110,
    111,
    112,
    113,
  ];

  Future getSurahList() async {
    var sura = await db
        .rawQuery('SELECT * FROM "sura" WHERE "sura_no" > "0" ORDER BY "para"');
    var cat = await db.rawQuery('SELECT * FROM "cat_name" ORDER BY "id"');
    for (var i = 0; i < cat.length; i++) {
      int? id = int.tryParse(cat[i]['id'].toString());
      catName.add(CatNameModel(
          bname: cat[i]['name'].toString(),
          ename: cat[i]['eng'].toString(),
          id: id ?? 0));
    }

    for (var i = 0; i < sura.length; i++) {
      maindata.add(SuraModel(
          suraname: sura[i]['sura_name'].toString(),
          surano: sura[i]['sura_no'].toString(),
          para: sura[i]['para'].toString(),
          meaning: sura[i]['meaning'].toString(),
          engname: sura[i]['eng_name'].toString(),
          totalruku: sura[i]['total_ruku'].toString(),
          totalayat: sura[i]['total_ayat'].toString()));
    }

    for (var i = 0; i < namajerchotosura.length; i++) {
      int surahNo = namajerchotosura[i];
      var suras = await db.rawQuery(
          'SELECT * FROM "sura" WHERE "sura_no" = "$surahNo" ORDER BY "para"');
      surahData.add(SuraModel(
          suraname: suras[0]['sura_name'].toString(),
          surano: suras[0]['sura_no'].toString(),
          para: suras[0]['para'].toString(),
          meaning: suras[0]['meaning'].toString(),
          engname: suras[0]['eng_name'].toString(),
          totalruku: suras[0]['total_ruku'].toString(),
          totalayat: suras[0]['total_ayat'].toString()));
    }
    catName.sort(((a, b) => a.id.compareTo(b.id)));
    maindata.sort((a, b) => int.parse(a.surano).compareTo(int.parse(b.surano)));
    // surahData
    //     .sort((a, b) => int.parse(a.surano).compareTo(int.parse(b.surano)));
  }

  // Future getSurahByNo(int surahNo) async {
  //   var bangla =
  //       await db.rawQuery('SELECT * FROM "bn_bengali" WHERE "sura" = "1"');
  //   // var arabic = await db.rawQuery(
  //   //     'SELECT * FROM "ararabic" WHERE "sura_no" = surahNo ORDER BY "para"');
  //   // var audio = await db.rawQuery(
  //   //     'SELECT * FROM "audio" WHERE "sura_no" = surahNo ORDER BY "para"');

  //   print(bangla);
  // }

  @override
  void onInit() {
    super.onInit();
    initDb();
  }

  @override
  void dispose() {
    maindata.value = [];
    super.dispose();
  }
}
