import 'package:flutter/material.dart';

class Heart extends StatefulWidget {
  const Heart({super.key});

  @override
  State<Heart> createState() => _HeartState();
}

class _HeartState extends State<Heart> with TickerProviderStateMixin {
  AnimationController? controller;
  Animation<Color?>? colorAnimation;
  bool isFav = false;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 250))
          ..addStatusListener((state) {
            if (state == AnimationStatus.completed) {
              setState(() {
                isFav = true;
              });
            } else {
              setState(() {
                isFav = false;
              });
            }
          });

    colorAnimation = ColorTween(
      begin: Colors.grey.shade400,
      end: Colors.redAccent,
    ).animate(controller!);
  }

  @override
  void dispose() {
    super.dispose();
    controller!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller!,
      builder: (context, child) {
        return IconButton(
          icon: Icon(Icons.favorite, color: colorAnimation!.value, size: 30),
          onPressed: () {
            isFav ? controller!.reverse() : controller!.forward();
          },
        );
      },
    );
  }
}
