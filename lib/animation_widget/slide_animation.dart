import 'package:flutter/material.dart';

class SlideAnimation extends StatefulWidget {
  @override
  _SlideAnimation createState() => _SlideAnimation();
}

class _SlideAnimation extends State<SlideAnimation>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: Duration(seconds: 8),
      vsync: this,
    );

    startAnimation();
  }

  void startAnimation() {
    final isFirst = animation == null || animation.value == 1;

    final curvedAnimation = CurvedAnimation(
      parent: controller,
      curve: Curves.fastOutSlowIn,
    );

    if (isFirst) {
      animation = Tween<double>(begin: -1, end: 0).animate(curvedAnimation)
        ..addStatusListener(listenAnimation);
    } else {
      animation = Tween<double>(begin: 0, end: 1).animate(curvedAnimation)
        ..addStatusListener(listenAnimation);
    }

    controller.reset();
    controller.forward();
  }

  void listenAnimation(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      animation.removeStatusListener(listenAnimation);
      startAnimation();
    }
  }

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Center(
        child: AnimatedBuilder(
          animation: animation,
          child: Container(color: Colors.yellow, width: 80, height: 80),
          builder: (context, child) {
            
            final width = MediaQuery.of(context).size.width;
            final x = animation.value * width;

            return Transform(
              transform: Matrix4.translationValues(x, 0, 0),
              child: child,
            );
          },
        ),
      );
}