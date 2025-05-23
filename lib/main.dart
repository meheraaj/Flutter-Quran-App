import 'package:al_quran/theming/apptheme.dart';
import 'package:al_quran/views/routes.dart';
import 'package:al_quran/views/servererror.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:provider/provider.dart';

import 'controller/checkConnection.dart';
import 'controller/fetchBookChapter.dart';
import 'controller/fetchBookList.dart';
import 'controller/fetchHadith.dart';
import 'controller/settingController.dart';


void main() async {
  // *** ADD THIS LINE ***
  WidgetsFlutterBinding.ensureInitialized();

  await JustAudioBackground.init(
      androidNotificationChannelId: 'com.ryanheise.bg_demo.channel.audio',
      androidNotificationChannelName: 'Audio playback',
      androidNotificationOngoing: true,
      preloadArtwork: true,
      androidShowNotificationBadge: true,
      androidResumeOnClick: true,
      androidNotificationClickStartsActivity: true);

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<FetchBookList>(
        create: (context) => FetchBookList(),
      ),
      ChangeNotifierProvider<FetchBookChapter>(
        create: (context) => FetchBookChapter(),
      ),
      ChangeNotifierProvider<FetchHadith>(create: ((context) => FetchHadith())),
      ChangeNotifierProvider<CheckConnection>(
          create: ((context) => CheckConnection())),
      ChangeNotifierProvider<SettingController>(
          create: ((context) => SettingController()))
    ],
    child: const MyApp(), // Added const keyword for MyApp
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // SettingController settingController = SettingController(); // Not needed here, provider handles it
  @override
  void initState() {
    super.initState();
    // Delaying the initVal call to ensure context is fully available,
    // though the Provider.of(listen:false) is generally safe in initState.
    // Future.microtask(() => initVal()); // Alternative if you face context issues
    initVal();
  }

  initVal() async {
    // Access providers using Provider.of<T>(context, listen: false)
    final checkConnectionProvider = Provider.of<CheckConnection>(context, listen: false);
    final settingControllerProvider = Provider.of<SettingController>(context, listen: false);

    checkConnectionProvider.checkConnection();

    var arabic = await settingControllerProvider.getArabic();
    var bangla = await settingControllerProvider.getBangla();

    var afont = await settingControllerProvider.getaFont();
    var bfont = await settingControllerProvider.getbFont();

    var isDark = await settingControllerProvider.getisDark();
    bool isFirsttime = await settingControllerProvider.isFirstTime();

    // Logic for isDark:
    // If isDark is false (meaning default/initial state where it's not set),
    // then set it to 1 (dark mode). Otherwise, set to 0 (light mode).
    // This looks like a toggle or default setting logic.
    if (isDark == null) { // Check for null if it's the very first run
      settingControllerProvider.setisDark(0); // Default to light if not set
    } else if (isDark == false) {
      settingControllerProvider.setisDark(1); // Toggle to dark if currently light (false)
    } else {
      settingControllerProvider.setisDark(0); // Toggle to light if currently dark (true)
    }


    if (afont == null || bfont == null) {
      settingControllerProvider.setAFont(0);
      settingControllerProvider.setBFont(1);
    }

    if (arabic == null || bangla == null) {
      settingControllerProvider.setArabic((25).toInt());
      settingControllerProvider.setBangla((20).toInt());
    } else if (arabic > 100 || bangla > 100) {
      settingControllerProvider.setArabic((25).toInt());
      settingControllerProvider.setBangla((20).toInt());
    } else {
      settingControllerProvider.getfontsize(); // This just reads, doesn't set
    }

    if (kIsWeb && isFirsttime == true) {
      Get.defaultDialog(
          content: AppsinfoDialog(), // Ensure AppsinfoDialog is defined/imported
          title: '',
          textCancel: 'Okey',
          onCancel: () {
            Get.back();
            settingControllerProvider.setNotFirstTime();
          },
          backgroundColor: const Color(0xff101031), // Use const if possible
          cancelTextColor: Colors.grey);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Shortcuts(
      shortcuts: <LogicalKeySet, Intent>{
        LogicalKeySet(LogicalKeyboardKey.select): const ActivateIntent(), // Added const
      },
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: Themes().darkTheme, // Assuming Themes().darkTheme returns ThemeData
        darkTheme: Themes().lightTheme, // Assuming Themes().lightTheme returns ThemeData
        home: const Scaffold( // Added const
          body: Routesgg(), // Added const
        ),
      ),
    );
  }
}