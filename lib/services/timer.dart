import 'dart:async';

import 'package:flutter/material.dart';

class TimerService with ChangeNotifier {
  int time;
  TimerService({required this.time});

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

  void resetTimer(int t) {
    time = t;
    notifyListeners();
  }
}
