import 'package:flutter/material.dart';

class transformAnimation extends StatefulWidget {
  @override
  _transformAnimation createState() => _transformAnimation();
}

class _transformAnimation extends State<transformAnimation>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> sizeAnimation;
  Animation<BorderRadius> radiusAnimation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: Duration(seconds: 8),
      vsync: this,
    )..repeat();

    final curvedAnimation =
        CurvedAnimation(parent: controller, curve: Curves.ease);

    sizeAnimation = Tween<double>(begin: 20, end: 100).animate(curvedAnimation);
    radiusAnimation = BorderRadiusTween(
      begin: BorderRadius.circular(60),
      end: BorderRadius.circular(0),
    ).animate(curvedAnimation);
  }

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Center(
        child: AnimatedBuilder(
          animation: controller,
          builder: (context, child) => Container(
            width: sizeAnimation.value,
            height: sizeAnimation.value,
            decoration: BoxDecoration(
              color: Colors.pinkAccent,
              borderRadius: radiusAnimation.value,
            ),
          ),
        ),
      );
}
