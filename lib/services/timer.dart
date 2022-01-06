import 'dart:async';

import 'package:flutter/material.dart';

class TimerService with ChangeNotifier {
  int time = 3 * 60;
  late Timer t;
  TimerService();

  void startTimer() {
    t = Timer.periodic(const Duration(seconds: 1), (timer) {
      time--;
      if (time == 0) {
        //

        timer.cancel();
      }
      notifyListeners();
    });
    // notifyListeners();
  }

  clearTimer() {
    t.cancel();
  }

  void setTimer(int t) {
    time = t;
  }
}
