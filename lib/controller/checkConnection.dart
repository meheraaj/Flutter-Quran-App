import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';

class CheckConnection extends ChangeNotifier {
  bool hasConnection = false;

  checkConnection() async {
    var results = await Connectivity().checkConnectivity();

    if (results == ConnectivityResult.ethernet ||
        results == ConnectivityResult.mobile ||
        results == ConnectivityResult.wifi) {
      hasConnection = true;
      notifyListeners();
    } else {
      hasConnection = false;
      notifyListeners();
    }

    Connectivity().onConnectivityChanged.listen((event) {
      if (event == ConnectivityResult.ethernet ||
          event == ConnectivityResult.mobile ||
          event == ConnectivityResult.wifi) {
        hasConnection = true;
        notifyListeners();
      } else {
        hasConnection = false;
        notifyListeners();
      }
    });
  }
}
