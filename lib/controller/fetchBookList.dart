import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:http/http.dart' as http;

import '../models/hadithbookModel.dart';

class FetchBookList extends ChangeNotifier {
  List _booklistModel = [];
  bool _hasData = false;
  bool _isErrorInt = false;
  bool _isErrorServ = false;

  bool get hasData => _hasData;
  List get booklistModel => _booklistModel;
  bool get isErrorServ => _isErrorServ;
  bool get isErrorInt => _isErrorInt;

  FetchBookList() {
    fetchMedia();
  }

  fetchMedia() async {
    try {
      final value =
          await http.get(Uri.parse('https://alquranbd.com/api/hadith'));

      if (value.statusCode == 200) {
        var parsedValue = json.decode(value.body);

        print(parsedValue[0]['id']);

        for (var i = 0; i < parsedValue.length; i++) {
          BooklistModel booklistModelss = BooklistModel(
              id: parsedValue[i]['id'] ?? '',
              nameEnglish: parsedValue[i]['nameEnglish'] ?? '',
              nameBengali: parsedValue[i]['nameBengali'] ?? '',
              isActive: parsedValue[i]['isActive'] ?? '',
              priority: parsedValue[i]['priority'] ?? '',
              publisherId: parsedValue[i]['publisherId'] ?? '',
              sectionNumber: parsedValue[i]['section_number'] ?? '',
              hadithNumber: parsedValue[i]['hadith_number'] ?? '',
              bookKey: parsedValue[i]['book_key'] ?? '',
              lastUpdate: parsedValue[i]['lastUpdate'] ?? '');

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
