import 'dart:async';
import 'package:fit_tech/presentation/screens/exercise_screen.dart';
import 'package:flutter/material.dart';

class BreakBetweenSequenceProvider extends ChangeNotifier {
  BreakBetweenSequenceProvider();

  Timer? countdownTimer;
  Duration myDuration = const Duration(seconds: 20);

  void startTimer({required BuildContext context}) {
    countdownTimer = Timer.periodic(const Duration(seconds: 1), (_) => setCountDown(context:context));
  }
  void stopTimer() {
    if(countdownTimer!=null){
      countdownTimer!.cancel();
    }
  }

  void resetTimer() {
    stopTimer();
    myDuration = const Duration(seconds: 20);
  }

  void addDuration() {
    final seconds = myDuration.inSeconds + 20;
    myDuration = Duration(seconds: seconds);
    notifyListeners();
  }

  void setCountDown({required BuildContext context}) {
    const reduceSecondsBy = 1;
    if(myDuration.inSeconds>0){
      final seconds = myDuration.inSeconds - reduceSecondsBy;
      myDuration = Duration(seconds: seconds);
      notifyListeners();
    }else{
      resetTimer();
      Navigator.pushNamed(context,ExerciseScreen.tag);
    }
  }
}
