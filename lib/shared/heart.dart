import 'package:flutter/material.dart';

class Heart extends StatefulWidget {
  const Heart({super.key});

  @override
  State<Heart> createState() => _HeartState();
}

class _HeartState extends State<Heart> with TickerProviderStateMixin {
  AnimationController? controller;
  Animation<Color?>? colorAnimation;
  Animation<double>? sizeAnimation;
  Animation<double>? curve;
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

    curve = CurvedAnimation(parent: controller!, curve: Curves.slowMiddle);

    sizeAnimation = TweenSequence(<TweenSequenceItem<double>>[
      TweenSequenceItem<double>(
        tween: Tween<double>(begin: 30, end: 50),
        weight: 50,
      ),
      TweenSequenceItem<double>(
        tween: Tween<double>(begin: 50, end: 30),
        weight: 50,
      ),
    ]).animate(curve!);
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
          icon: Icon(
            Icons.favorite,
            color: colorAnimation!.value,
            size: sizeAnimation!.value,
          ),
          onPressed: () {
            isFav ? controller!.reverse() : controller!.forward();
          },
        );
      },
    );
  }
}
