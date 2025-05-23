import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:html_unescape/html_unescape.dart';

import 'package:http/http.dart' as http;

import '../models/bookchapterModel.dart';

class FetchBookChapter extends ChangeNotifier {
  List _booklistModel = [];
  bool _hasData = false;
  bool _isErrorInt = false;
  bool _isErrorServ = false;
  bool get hasData => _hasData;
  List get booklistModel => _booklistModel;
  bool get isErrorServ => _isErrorServ;
  bool get isErrorInt => _isErrorInt;
  splitString(String text) {
    var unescape = HtmlUnescape();
    String unescaped = unescape.convert(text);
    if (unescaped.contains('/\ ')) {
      return unescaped.split('/\ ')[1];
    } else if (unescaped.contains("/ ")) {
      return unescaped.split("/ ")[0];
    } else {
      return unescaped;
    }
  }

  fetchMedia(String bookkey) async {
    _hasData = false;
    _booklistModel = [];
    try {
      final value = await http
          .get(Uri.parse('https://alquranbd.com/api/hadith/' + bookkey));

      if (value.statusCode == 200) {
        var parsedValue = json.decode(utf8.decode(value.bodyBytes));

        for (var i = 0; i < parsedValue.length; i++) {
          BookchapterModel booklistModelss = BookchapterModel(
              id: parsedValue[i]['id'] ?? '',
              nameEnglish: splitString(parsedValue[i]['nameEnglish']) ?? '',
              nameBengali: splitString(parsedValue[i]['nameBengali']) ?? '',
              isActive: parsedValue[i]['isActive'] ?? '',
              hadithNumber: parsedValue[i]['hadith_number'] ?? '',
              lastUpdate: parsedValue[i]['lastUpdate'] ?? '',
              bookId: parsedValue[i]['bookId'] ?? '',
              rangeStart: parsedValue[i]['range_start'] ?? '',
              bookInitial: parsedValue[i]['bookInitial'] ?? '',
              chSerial: parsedValue[i]['chSerial'] ?? '',
              rangeEnd: parsedValue[i]['range_end'] ?? '');

          booklistModel.add(booklistModelss);
        }

        booklistModel.length > 1 ? _hasData = true : _hasData = false;

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
