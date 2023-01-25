import 'package:flutter/animation.dart';

enum LogoVisible { invincible, visible, gone }

class StaggeredCircularSplashAnimation {
  final AnimationController controller;

  late final Animation<double> dropSize;
  late final Animation<double> dropPosition;
  late final Animation<bool> dropVisible;
  late final Animation<double> holeSize;
  late final Animation<bool> logoVisible;

  StaggeredCircularSplashAnimation(this.controller) {
    dropSize = Tween<double>(begin: 0, end: maximumDropSize).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.0, 0.2, curve: Curves.easeIn),
      ),
    );

    dropPosition = Tween<double>(begin: 0, end: maximumRelativeDropY).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.2, 0.5, curve: Curves.easeIn),
      ),
    );

    dropVisible = Tween<bool>(begin: true, end: false).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.5, 0.5),
      ),
    );

    holeSize = Tween<double>(begin: 0, end: maximumHoleSize).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.5, 1.0, curve: Curves.easeIn),
      ),
    );

    logoVisible = TweenSequence<bool>(
      <TweenSequenceItem<bool>>[
        TweenSequenceItem<bool>(
          tween: ConstantTween<bool>(false),
          weight: 0.5,
        ),
        TweenSequenceItem<bool>(
          tween: Tween<bool>(
            begin: false,
            end: true,
          ).chain(CurveTween(curve: const Interval(0, 0))),
          weight: 0.2,
        ),
        TweenSequenceItem<bool>(
          tween: Tween<bool>(
            begin: true,
            end: false,
          ).chain(CurveTween(curve: const Interval(0, 0))),
          weight: 0.3,
        ),
      ],
    ).animate(controller);
  }

  static const double maximumDropSize = 20;
  static const double maximumRelativeDropY = 0.5;
  static const double maximumHoleSize = 10;
}
