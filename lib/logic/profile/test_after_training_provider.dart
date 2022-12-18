import 'dart:async';
import 'package:flutter/material.dart';

class TestAfterTrainingProvider extends ChangeNotifier {
  TestAfterTrainingProvider();

  Timer? countdownTimer;
  Duration myDuration = const Duration(seconds: 0);

  void startTimer() {
    countdownTimer = Timer.periodic(const Duration(seconds: 1), (_) => setCountDown());
  }
  void stopTimer() {
    countdownTimer!.cancel();
  }

  void resetTimer() {
    stopTimer();
    myDuration = const Duration(seconds: 0);
  }

  void setCountDown() {
    const reduceSecondsBy = 1;
      final seconds = myDuration.inSeconds + reduceSecondsBy;
      myDuration = Duration(seconds: seconds);
      notifyListeners();
  }
}
