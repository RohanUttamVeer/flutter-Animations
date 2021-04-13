import 'dart:math';
import 'package:flutter/material.dart';

class Myanimation extends StatefulWidget {
  @override
  _Myanimation createState() => _Myanimation();
}

class _Myanimation extends State<Myanimation>
    with SingleTickerProviderStateMixin {
   AnimationController controller;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: Duration(seconds: 3),
      vsync: this,
    )..repeat();

    animation = Tween<double>(begin: 0, end: 2 * pi).animate(controller);
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
          child: Container(color: Colors.red, width: 80, height: 80),
          builder: (context, child) => Transform.rotate(
            angle: animation.value,
            child: child,
          ),
        ),
      );
}