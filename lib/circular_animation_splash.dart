library circular_animation_splash;

import 'package:flutter/widgets.dart';

import '../staggered_circular_splash_animation.dart';
import '../hole_painter.dart';

class CircularAnimationSplash extends StatefulWidget {
  /// the color of the circular animation
  final Color color;

  /// how long should the splash last
  final Duration duration;

  /// the distance in pixels between each successive circle in the splash
  final double circleDifference;

  /// how many circles should be shown in the splash
  final int numberOfCircles;

  /// the logo to show in the middle of the circular drop
  final Widget? logo;

  /// the screen to show underneath the logo
  final Widget? screen;

  const CircularAnimationSplash({
    super.key,
    required this.color,
    this.duration = const Duration(milliseconds: 3000),
    this.circleDifference = 100,
    this.numberOfCircles = 3,
    this.logo,
    this.screen,
  });

  @override
  State<CircularAnimationSplash> createState() =>
      _CircularAnimationSplashState();
}

class _CircularAnimationSplashState extends State<CircularAnimationSplash>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final StaggeredCircularSplashAnimation _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    );

    _animation = StaggeredCircularSplashAnimation(_controller);

    _controller.forward();
    _controller.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return IgnorePointer(
      child: Stack(
        alignment: Alignment.center,
        children: [
          if (widget.logo != null)
            Positioned(
              top: size.height * _animation.logoPosition.value,
              child: Column(
                children: [
                  widget.logo!,
                  if (widget.screen != null && _animation.screenVisible.value)
                    SizedBox(
                      height: size.height,
                      width: size.width,
                      child: widget.screen!,
                    ),
                ],
              ),
            ),
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: CustomPaint(
              painter: HolePainter(
                color: widget.color,
                radius: _animation.holeSize.value * size.width,
                circleDifference: widget.circleDifference,
                numberOfCircles: widget.numberOfCircles,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
