import 'dart:async';

import 'package:flutter/material.dart';

class TimerService with ChangeNotifier {
  int time = 3 * 60;
  TimerService();

  void startTimer() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      time--;
      if (time == 0) {
        //

        timer.cancel();
      }
      notifyListeners();
    });
    // notifyListeners();
  }

  void setTimer(int t) {
    time = t;
  }
}
