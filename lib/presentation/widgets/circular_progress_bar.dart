import 'package:fit_tech/utils/colors.dart';
import 'package:fit_tech/utils/my_styles.dart';
import 'package:flutter/material.dart';

class CircularProgress extends StatefulWidget {
  final double maxLength;
  final double? startAnimation;
  final double progress;
  final Widget child;
  final Color trackColor;
  final Color valueColor;

  const CircularProgress(
      {super.key,
      required this.maxLength,
      required this.progress,
      this.startAnimation,
      this.trackColor = MyColors.greyMediumColor,
      this.valueColor = MyColors.redColor,
      required this.child});

  @override
  State<CircularProgress> createState() => _CircularProgressState();
}

class _CircularProgressState extends State<CircularProgress> {
  var max = 1.0;
  var progress = 0.0;
  var endProgress = 0.0;

  @override
  Widget build(BuildContext context) {
    max = widget.maxLength;
    progress = widget.progress / widget.maxLength;
    endProgress = widget.startAnimation ?? 0.0 / widget.maxLength;
    return SizedBox(
      height: 100,
      width: 100,
      child: Stack(
        fit: StackFit.expand,
        alignment: Alignment.center,
        children: [
          TweenAnimationBuilder(
              tween: Tween<double>(begin: widget.startAnimation??0.0, end: progress),
              duration: const Duration(milliseconds: 1000),
              builder: (context, value,_) {
                return CircularProgressIndicator(
                  backgroundColor: widget.trackColor,
                  valueColor: AlwaysStoppedAnimation<Color>(widget.valueColor),
                  value: value,
                  color: Colors.grey,
                  strokeWidth: 5.0,
                );
              }),
          widget.child,
        ],
      ),
    );
  }
}
