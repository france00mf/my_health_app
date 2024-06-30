import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class CustomWidgetAnimated extends StatelessWidget {
  final int index;
  final int delay;
  final Widget child;
  const CustomWidgetAnimated(
      {super.key,
      required this.index,
      required this.delay,
      required this.child});

  @override
  Widget build(BuildContext context) {
    if (index == 1) {
      return FadeInDown(
        delay: Duration(milliseconds: delay),
        child: child,
      );
    }
    return FadeInUp(
      delay: Duration(milliseconds: delay),
      child: child,
    );
  }
}