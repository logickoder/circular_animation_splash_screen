import 'package:flutter/animation.dart';

class StaggeredCircularSplashAnimation {
  final AnimationController controller;

  late final Animation<double> holeSize;
  late final Animation<double> logoPosition;
  late final Animation<bool> screenVisible;

  StaggeredCircularSplashAnimation(this.controller) {
    holeSize = Tween<double>(begin: 0, end: maximumHoleSize).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.3, 1.0, curve: Curves.easeIn),
      ),
    );

    logoPosition = Tween<double>(begin: maximumRelativeDropY, end: 0).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.4, 0.8, curve: Curves.easeIn),
      ),
    );

    screenVisible = Tween<bool>(begin: false, end: true).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.8, 0.8, curve: Curves.easeIn),
      ),
    );
  }

  static const double maximumHoleSize = 10;
  static const double maximumRelativeDropY = 0.5;
}
