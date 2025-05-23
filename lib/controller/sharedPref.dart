

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SetSharedPrefData extends GetxController {
  RxString nameOFsurah = ''.obs;
  RxInt surahNumber = 1.obs;
  RxInt surahAyah = 7.obs;
  RxDouble offsetoflist = 0.0.obs;

  setLastReadedSurah(
      String surahName, int surahNo, int totalAya, double offset) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('lastreadsurahname', surahName);
    await prefs.setInt('lastreadsurahno', surahNo);
    await prefs.setInt('lastreadsurahta', totalAya);
    await prefs.setDouble('lastreadsurahol', offset);
    getLastRead();
  }

  getLastRead() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    nameOFsurah.value = prefs.getString('lastreadsurahname') ?? '';
    surahNumber.value = prefs.getInt('lastreadsurahno') ?? 1;
    surahAyah.value = prefs.getInt('lastreadsurahta') ?? 7;
    offsetoflist.value = prefs.getDouble('lastreadsurahol') ?? 0.0;
  }

  @override
  void onInit() {
    super.onInit();
    getLastRead();
  }
}
