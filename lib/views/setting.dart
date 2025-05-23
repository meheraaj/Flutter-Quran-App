import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';



import '../controller/settingController.dart';
import '../controller/urlLuncher.dart';

class Setting extends StatelessWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final setting = Provider.of<SettingController>(context);
    final size = MediaQuery.of(context).size;
    final isDark = setting.isDark == 1;

    final textColor = isDark ? CupertinoColors.white : CupertinoColors.black;
    final descColor = CupertinoColors.systemGrey;

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(
          'সেটিং',
          style: TextStyle(
            fontFamily: "HindSiliguri",
            fontSize: 20,
            color: textColor,
          ),
        ),
        backgroundColor: CupertinoTheme.of(context).barBackgroundColor,
      ),
      child: SafeArea(
        child: ListView(
          children: [

            /// Font Size
            CupertinoListSection.insetGrouped(
              header: Text("Font Size", style: TextStyle(color: descColor)),
              children: [
                CupertinoListTile(

                  title: Text('Arabic ${setting.asize} / 100',
                      style: TextStyle(color: textColor)),
                  subtitle: CupertinoSlider(

                    value: setting.asize.toDouble(),
                    min: 15,
                    max: 60,
                    onChanged: (val) => setting.setArabic(val.toInt()),
                  ),
                ),
                CupertinoListTile(
                  title: Text('Bangla ${setting.bsize} / 100',
                      style: TextStyle(color: textColor)),
                  subtitle: CupertinoSlider(
                    value: setting.bsize.toDouble(),
                    min: 15,
                    max: 60,
                    onChanged: (val) => setting.setBangla(val.toInt()),
                  ),
                ),
              ],
            ),

            /// Font Selection
            CupertinoListSection.insetGrouped(
              header: Text("Select Font", style: TextStyle(color: descColor)),
              children: [
                CupertinoListTile.notched(
                  title: Text("Bangla Preview", style: TextStyle(color: textColor)),
                  subtitle: Text(
                    'বাংলা ফন্ট ১ ২ ৩',
                    style: TextStyle(
                      fontFamily: setting.bfont == 0 ? 'HindSiliguri' : 'Noto Serif',
                      fontSize: setting.bsize.toDouble(),
                      color: textColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                ...List.generate(2, (i) {
                  return CupertinoListTile(
                    title: Text("Font ${i + 1}", style: TextStyle(color: textColor)),
                    trailing: CupertinoRadio<int>(
                      value: i,
                      groupValue: setting.bfont,
                      onChanged: (val) {
                        if (val != null) setting.setBFont(val);
                      },
                    ),
                  );
                }),
                CupertinoListTile.notched(
                  title: Text("Arabic Preview", style: TextStyle(color: textColor)),
                  subtitle: Text(
                    'الخط العربي',
                    style: TextStyle(
                      fontFamily: setting.afont == 0 ? 'ScheherazadeNew' : 'Amiri',
                      fontSize: setting.asize.toDouble(),
                      color: textColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                ...List.generate(2, (i) {
                  return CupertinoListTile(
                    title: Text("Font ${i + 1}", style: TextStyle(color: textColor)),
                    trailing: CupertinoRadio<int>(
                      value: i,
                      groupValue: setting.afont,
                      onChanged: (val) {
                        if (val != null) setting.setAFont(val);
                      },
                    ),
                  );
                }),
              ],
            ),

            /// Reset
            CupertinoListSection.insetGrouped(
              children: [
                CupertinoListTile(
                  title: Text(
                    "Reset Font Setting",
                    style: TextStyle(color: CupertinoColors.systemRed),
                  ),
                  onTap: () {
                    Get.defaultDialog(
                      title: 'Are you sure?',
                      titleStyle: const TextStyle(fontFamily: "HindSiliguri"),
                      middleText: 'It will reset your font size to default.',
                      middleTextStyle: const TextStyle(fontFamily: "HindSiliguri"),
                      contentPadding: EdgeInsets.symmetric(vertical: size.width / 20),
                      textConfirm: 'Reset',
                      textCancel: 'No',
                      onConfirm: () {
                        setting.resetValue(size.width ~/ 20, size.width ~/ 16);
                        Get.back();
                      },
                    );
                  },
                )
              ],
            ),

            /// Theme
            CupertinoListSection.insetGrouped(
              header: Text("Theme", style: TextStyle(color: descColor)),
              children: [
                CupertinoListTile(
                  title: Text("Light Mode", style: TextStyle(color: textColor)),
                  trailing: CupertinoRadio<int>(
                    value: 0,
                    groupValue: setting.isDark,
                    onChanged: (val) {
                      if (val != null) setting.setisDark(val);
                    },
                  ),
                ),
                CupertinoListTile(
                  title: Text("Dark Mode", style: TextStyle(color: textColor)),
                  trailing: CupertinoRadio<int>(
                    value: 1,
                    groupValue: setting.isDark,
                    onChanged: (val) {
                      if (val != null) setting.setisDark(val);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    'Using Night mode extends battery life on devices with OLED display',
                    style: TextStyle(
                        color: descColor, fontSize: 13, height: 1.3),
                  ),
                ),
              ],
            ),

            /// Social
            CupertinoListSection.insetGrouped(
              header: Text("Social", style: TextStyle(color: descColor)),
              children: [
                CupertinoListTile(
                  title: Text("Facebook", style: TextStyle(color: textColor)),
                  onTap: () => lucnUrl('https://facebook.com/mehe.raj43/'),
                ),
                CupertinoListTile(
                  title: Text("Telegram", style: TextStyle(color: textColor)),
                  onTap: () => lucnUrl('https://t.me/bs_gc'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
