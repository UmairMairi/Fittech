import 'dart:async';

import 'package:flutter/material.dart';

class GymExerciseProvider extends ChangeNotifier {
  GymExerciseProvider();

  int? currentSet;
  int totalSets = 2;
  Timer? countdownTimer;
  Duration myDuration = const Duration(seconds: 30);

  setCurrentSet({required int? val}) {
    currentSet = val;
    notifyListeners();
  }

  void startTimer() {
    countdownTimer = Timer.periodic(const Duration(seconds: 1), (_) => setCountDown());
  }
  void stopTimer() {
    if(countdownTimer!=null){
      countdownTimer!.cancel();
    }
  }

  void resetTimer() {
    stopTimer();
    myDuration = const Duration(seconds: 30);
  }

  void setCountDown() {
    const reduceSecondsBy = 1;
    if(myDuration.inSeconds>0){
      final seconds = myDuration.inSeconds - reduceSecondsBy;
      myDuration = Duration(seconds: seconds);
      notifyListeners();
    }else{
      stopTimer();
    }
  }

  void disposeProvider() {
    currentSet = null;
    totalSets = 2;
    resetTimer();
  }
}
