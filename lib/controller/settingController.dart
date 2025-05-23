import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingController extends ChangeNotifier {
  int asize = 15;
  late int bsize = 15;
  int isDark = Get.isDarkMode == true ? 1 : 0;

  int bfont = 0;
  int afont = 0;

  getisDark() async {
    SharedPreferences sh = await SharedPreferences.getInstance();

    return sh.getBool('isDark');
  }

  setisDark(index) async {
    SharedPreferences sh = await SharedPreferences.getInstance();
    if (index == 0) {
      Get.changeThemeMode(ThemeMode.dark);
      sh.setBool('isDark', true);
      isDark = index;
    } else {
      Get.changeThemeMode(ThemeMode.light);
      sh.setBool('isDark', false);
      isDark = index;
    }
    notifyListeners();
  }

  getaFont() async {
    SharedPreferences sh = await SharedPreferences.getInstance();

    var afg = sh.getInt('afg');
    return afg;
  }

  getbFont() async {
    SharedPreferences sh = await SharedPreferences.getInstance();
    var bfg = sh.getInt('bfg');

    return bfg;
  }

  getAbfont() async {
    SharedPreferences sh = await SharedPreferences.getInstance();
    afont = sh.getInt('afg') ?? 0;
    bfont = sh.getInt('bfg') ?? 0;
    notifyListeners();
  }

  setBFont(int val) async {
    SharedPreferences sh = await SharedPreferences.getInstance();
    if (bfont < 2) {
      await sh.setInt('bfg', val);
      bfont = val;
    }

    notifyListeners();
  }

  setAFont(val) async {
    SharedPreferences sh = await SharedPreferences.getInstance();
    if (afont < 2) {
      await sh.setInt('afg', val);
      afont = val;
    }

    notifyListeners();
  }

  setArabic(int value) async {
    SharedPreferences sh = await SharedPreferences.getInstance();

    sh.setInt('afont', value);
    asize = sh.getInt('afont') ?? 15;
    notifyListeners();
  }

  resetValue(int val, int val2) async {
    SharedPreferences sh = await SharedPreferences.getInstance();
    sh.setInt('bfont', val);
    sh.setInt('afont', val2);
    sh.setInt('afg', 0);
    sh.setInt('bfg', 0);
    bsize = sh.getInt('bfont') ?? 15;
    asize = sh.getInt('afont') ?? 15;
    bfont = sh.getInt('bfg') ?? 0;
    afont = sh.getInt('afg') ?? 0;
    notifyListeners();
  }

  setBangla(int value) async {
    SharedPreferences sh = await SharedPreferences.getInstance();
    sh.setInt('bfont', value);
    bsize = sh.getInt('bfont') ?? 15;
    notifyListeners();
  }

  getfontsize() async {
    SharedPreferences sh = await SharedPreferences.getInstance();
    bsize = sh.getInt('bfont') ?? 15;
    asize = sh.getInt('afont') ?? 15;
    notifyListeners();
  }

  getBangla() async {
    SharedPreferences sh = await SharedPreferences.getInstance();

    return sh.getInt('bfont');
  }

  getArabic() async {
    SharedPreferences sh = await SharedPreferences.getInstance();
    asize = sh.getInt('afont') ?? 15;
    return sh.getInt('afont');
  }

  // Check First Time Or Net

  isFirstTime() async {
    SharedPreferences sh = await SharedPreferences.getInstance();
    return sh.getBool('isFirsttime') ?? true;
  }

  setNotFirstTime() async {
    SharedPreferences sh = await SharedPreferences.getInstance();
    sh.setBool('isFirsttime', false);
  }
}
