import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:html_unescape/html_unescape.dart';
import 'package:http/http.dart' as http;

import '../models/hadithModel.dart';

class FetchHadith extends ChangeNotifier {
  List _hadithData = [];
  bool _hasData = false;
  bool _isErrorInt = false;
  bool _isErrorServ = false;

  bool get hasData => _hasData;
  List get hadithData => _hadithData;
  bool get isErrorServ => _isErrorServ;
  bool get isErrorInt => _isErrorInt;

  splitString(String text) {
    var unescape = HtmlUnescape();
    String unescaped = unescape.convert(text);
    if (unescaped.contains('/\ ')) {
      return unescaped.split('/\ ')[1];
    } else if (unescaped.contains("/ ")) {
      return unescaped.split("/ ")[0];
    } else if (unescaped.contains("<br />")) {
      return unescaped.replaceAll('<br />', '\n');
    } else {
      return unescaped;
    }
  }

  fetchMedia(String bookkey, bookChapter) async {
    _hasData = false;
    _hadithData = [];
    try {
      final value = await http.get(Uri.parse(
          'https://alquranbd.com/api/hadith/' +
              bookkey +
              '/' +
              bookChapter.toString()));

      if (value.statusCode == 200) {
        var parsedValue = json.decode(utf8.decode(value.bodyBytes));

        for (var i = 0; i < parsedValue.length; i++) {
          HadithModel hadithModel = HadithModel(
            id: parsedValue[i]['id'] ?? '',
            hadithEnglish: splitString(parsedValue[i]['hadithEnglish']) ?? '',
            hadithBengali: splitString(parsedValue[i]['hadithBengali']) ?? '',
            isActive: parsedValue[i]['isActive'] ?? '',
            hadithArabic: splitString(parsedValue[i]['hadithArabic']) ?? '',
            bookId: parsedValue[i]['bookId'] ?? '',
            rabiNameBn: parsedValue[i]['rabiNameBn'] ?? '',
            rabiNameEn: parsedValue[i]['rabiNameEn'] ?? '',
            statusId: parsedValue[i]['statusId'] ?? '',
            topicName: splitString(parsedValue[i]['topicName']) ?? '',
            chapterId: parsedValue[i]['chapterId'] ?? '',
            checkStatus: parsedValue[i]['checkStatus'] ?? '',
            hadithNo: parsedValue[i]['hadithNo'] ?? '',
            publisherId: parsedValue[i]['publisherId'] ?? '',
            sectionId: parsedValue[i]['sectionId'] ?? '',
            thesequence: parsedValue[i]['thesequence'] ?? '',
          );

          hadithData.add(hadithModel);
        }

        hadithData.length > 1 ? _hasData = true : _hasData = false;

        notifyListeners();
      } else {
        print('something went wrong');
        _hasData = false;
        _isErrorServ = true;
      }
    } catch (e) {
      print(e);
      _hasData = false;
      _isErrorInt = true;
    }
  }
}
