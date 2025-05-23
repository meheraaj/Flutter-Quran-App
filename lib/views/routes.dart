import 'package:al_quran/views/setting.dart';
import 'package:flutter/material.dart';


import 'listofsurah.dart';
import 'onlinehadith.dart';

class Routesgg extends StatefulWidget {
  const Routesgg({Key? key}) : super(key: key);

  @override
  _RoutesggState createState() => _RoutesggState();
}

class _RoutesggState extends State<Routesgg> {
  int _currentIndex = 0;

  List _pages = [ListOfSurah(), OnlineHadith(), Setting()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.auto_stories), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.mosque_rounded), label: 'Hadith'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings_suggest_rounded), label: 'Setting'),
        ],
      ),
      body: _pages[_currentIndex],
    );
  }
}
