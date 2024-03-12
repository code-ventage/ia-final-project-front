import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class CustomAnimatedTimer extends StatefulWidget {
  const CustomAnimatedTimer({super.key, required this.duration, this.onFinished, required this.size, this.fontSize = 64.0, this.strokeWeight = 8.0});

  final Duration duration;
  final void Function()? onFinished;
  final Size size;
  final double fontSize;
  final double strokeWeight;

  @override
  State<CustomAnimatedTimer> createState() => _CustomAnimatedTimerState();
}

class _CustomAnimatedTimerState extends State<CustomAnimatedTimer> {
  int maxTime = 0;
  Timer? timer;
  int animationKey = 0;

  @override
  Widget build(BuildContext context) {
    if (maxTime <= 0) {
      timer?.cancel();
      widget.onFinished?.call();
    }
    var textTheme = Theme.of(context).textTheme;
    return SizedBox(
      width: widget.size.width,
      height: widget.size.height,
      child: Stack(
        fit: StackFit.expand,
        children: [
          CircularProgressIndicator(
            value: maxTime / widget.duration.inSeconds,
            strokeWidth: widget.strokeWeight,
            color: maxTime > 10
                ? Theme.of(context).colorScheme.primary
                : maxTime > 5
                    ? Colors.orangeAccent
                    : Colors.redAccent,
          ),
          Center(
            child: Animate(
              key: Key(animationKey.toString()),
              effects: const [ScaleEffect()],
              child: Text(
                '$maxTime',
                style: textTheme.titleLarge?.copyWith(fontSize: widget.fontSize, fontWeight: FontWeight.w500),
              ),
            ),
          )
        ],
      ),
    );
  }

  void startTimer() async {
    timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      if (maxTime <= 0) {
        setState(() {
          timer.cancel();
        });
      } else {
        setState(() {
          maxTime--;
          animationKey++;
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    maxTime = widget.duration.inSeconds;
    startTimer();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }
}