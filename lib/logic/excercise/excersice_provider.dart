import 'dart:async';
import 'package:flutter/material.dart';

class ExerciseProvider extends ChangeNotifier {

  Timer? countdownTimer;
  Duration myDuration = const Duration(seconds: 30);

  // 0 withCounter 1 without counter
  int type = 0;

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
  void changeType({int type = 0}) {
      this.type = type;
      resetTimer();
      notifyListeners();
  }
}
