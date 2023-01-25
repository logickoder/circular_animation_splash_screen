library circular_animation_splash;

import 'package:flutter/widgets.dart';

import '../staggered_circular_splash_animation.dart';
import '../hole_painter.dart';
import '../raindrop_painter.dart';

class CircularAnimationSplash extends StatefulWidget {
  final Color color;

  const CircularAnimationSplash({super.key, required this.color});

  @override
  State<CircularAnimationSplash> createState() =>
      _CircularAnimationSplashState();
}

class _CircularAnimationSplashState extends State<CircularAnimationSplash>
    with SingleTickerProviderStateMixin {
  var size = Size.zero;
  late final AnimationController _controller;
  late final StaggeredCircularSplashAnimation _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 3000),
      vsync: this,
    );

    _animation = StaggeredCircularSplashAnimation(_controller);

    _controller.forward();
    _controller.addListener(() => setState(() {}));
  }

  @override
  void didChangeDependencies() {
    setState(() => size = MediaQuery.of(context).size);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: CustomPaint(
            painter: HolePainter(
              color: widget.color,
              holeSize: _animation.holeSize.value * size.width,
            ),
          ),
        ),
        Positioned(
          top: _animation.dropPosition.value * size.height,
          left: size.width / 2 - _animation.dropSize.value / 2,
          child: SizedBox(
            width: _animation.dropSize.value,
            height: _animation.dropSize.value,
            child: CustomPaint(
              painter: RaindropPainter(
                visible: _animation.dropVisible.value,
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
