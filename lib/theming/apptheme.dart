import 'package:flutter/material.dart';

class Themes {
  final lightTheme = ThemeData(
      useMaterial3: true,
      primarySwatch: Colors.grey,
      primaryColor: Color(0xFF403D79),
      brightness: Brightness.light,
      // Bottom Navigation theme

      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        elevation: 6,
        selectedItemColor: Color.fromARGB(255, 2, 136, 18),
        unselectedItemColor: Color(0xFF403D79),
      ),

      //
      tooltipTheme: TooltipThemeData(
          showDuration: Duration(seconds: 10),
          decoration: BoxDecoration(
              color: Color(0xFF0038A7), borderRadius: BorderRadius.circular(5)),
          textStyle: TextStyle(color: Colors.white)),
      dividerColor: Color(0xFF81F7FF),
      appBarTheme: AppBarTheme(
          centerTitle: true,
          titleTextStyle: TextStyle(
              fontFamily: "HindSiliguri",
              fontWeight: FontWeight.bold,
              color: Colors.blue[400]),
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black)),

      // slider Theme
      sliderTheme: SliderThemeData(
        activeTrackColor: Colors.red,
        inactiveTrackColor: Colors.blue,
        trackHeight: 3.0,
        thumbColor: Colors.yellow,
        thumbShape: RoundSliderThumbShape(enabledThumbRadius: 5.0),
        overlayColor: Colors.purple.withAlpha(32),
        overlayShape: RoundSliderOverlayShape(overlayRadius: 14.0),
      ),
      dividerTheme: DividerThemeData(
        color: Color(0xFF7049A3),
      ),
      fontFamily: 'Roboto Condensed',
      // tabBarTheme: TabBarTheme(
      //     labelColor: Colors.black,
      //     unselectedLabelStyle: TextStyle(fontFamily: "Noto Serif"),
      //     labelStyle: TextStyle(fontFamily: 'HindSiliguri'))
      );

  final darkTheme = ThemeData(
      useMaterial3: true,
      primaryColor: Colors.white,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: Color(0xff101031),
      fontFamily: 'Roboto Condensed',

      // Bottom Navigation theme

      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Color(0xFF1B1029),
        elevation: 6,
        selectedItemColor: Colors.yellow,
        unselectedIconTheme: IconThemeData(color: Colors.white),
      ),

      //
      tooltipTheme: TooltipThemeData(
          showDuration: Duration(seconds: 10),
          decoration: BoxDecoration(
              color: Color(0xFF0038A7), borderRadius: BorderRadius.circular(5)),
          textStyle: TextStyle(color: Colors.white)),
      dividerColor: Color(0xFF81F7FF),
      appBarTheme: AppBarTheme(
        centerTitle: true,
        titleTextStyle: TextStyle(
            fontFamily: "HindSiliguri",
            fontWeight: FontWeight.bold,
            color: Colors.blue[400]),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
      ),

      // slider Theme
      sliderTheme: SliderThemeData(
        activeTrackColor: Colors.red,
        inactiveTrackColor: Colors.blue,
        trackHeight: 3.0,
        thumbColor: Colors.yellow,
        thumbShape: RoundSliderThumbShape(enabledThumbRadius: 8.0),
        overlayColor: Colors.purple.withAlpha(32),
        overlayShape: RoundSliderOverlayShape(overlayRadius: 14.0),
      ),
      dividerTheme: DividerThemeData(
        color: Color(0xFFF1FFFE),
      ),
      // tabBarTheme: TabBarTheme(
      //     labelColor: Color.fromARGB(255, 248, 244, 244),
      //     unselectedLabelStyle: TextStyle(fontFamily: "Noto Serif"),
      //     labelStyle: TextStyle(fontFamily: 'HindSiliguri'),
      //     unselectedLabelColor: Colors.white),
      // colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.grey).copyWith(background: const Color(0xFF1B1029))
  );

  // ANother theme

}

// Color(0xFFD35F1Cf)
