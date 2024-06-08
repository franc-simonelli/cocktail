import 'dart:math';
import 'package:flutter/material.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> with SingleTickerProviderStateMixin {
  bool toggle = false;

  late AnimationController _controller;
  late Animation _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 375),
      reverseDuration: const Duration(milliseconds: 275),
    );

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
      reverseCurve: Curves.easeIn,
    );

    _controller.addListener(() {
      setState(() {});
    });
  }

  Alignment alignment1 = const Alignment(0.0, 0.9);
  Alignment alignment2 = const Alignment(0.0, 0.9);
  Alignment alignment3 = const Alignment(0.0, 0.9);
  double size1 = 50;
  double size2 = 50;
  double size3 = 50;

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).colorScheme;

    return SizedBox(
      // color: Colors.blue,
      height: 250,
      width: 250,
      child: Stack(
        children: [
          AnimatedAlign(
            duration: toggle
                ? const Duration(milliseconds: 100)
                : const Duration(milliseconds: 100),
            alignment: alignment1,
            curve: toggle ? Curves.easeOut : Curves.easeIn,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 175),
              curve: toggle ? Curves.easeOut : Curves.easeIn,
              height: size1,
              width: size1,
              decoration: BoxDecoration(
                color: appColors.primary,
                borderRadius: BorderRadius.circular(40),
              ),
              child: Icon(
                Icons.favorite,
                color: appColors.primaryContainer,
              ),
            ),
          ),
          AnimatedAlign(
            duration: toggle
                ? const Duration(milliseconds: 100)
                : const Duration(milliseconds: 100),
            alignment: alignment2,
            curve: toggle ? Curves.easeOut : Curves.easeIn,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 175),
              curve: toggle ? Curves.easeOut : Curves.easeIn,
              height: size2,
              width: size2,
              decoration: BoxDecoration(
                color: appColors.primary,
                borderRadius: BorderRadius.circular(40),
              ),
              child: Icon(
                Icons.settings,
                color: appColors.primaryContainer,
              ),
            ),
          ),
          AnimatedAlign(
            duration: toggle
                ? const Duration(milliseconds: 100)
                : const Duration(milliseconds: 100),
            alignment: alignment3,
            curve: toggle ? Curves.easeOut : Curves.easeIn,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 175),
              curve: toggle ? Curves.easeOut : Curves.easeIn,
              height: size3,
              width: size3,
              decoration: BoxDecoration(
                color: appColors.primary,
                borderRadius: BorderRadius.circular(40),
              ),
              child: Icon(
                Icons.help,
                color: appColors.primaryContainer,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Transform.rotate(
              angle: _animation.value * pi * (3 / 4),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 375),
                width: toggle ? 70 : 60,
                height: toggle ? 70 : 60,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: appColors.primary,
                ),
                child: IconButton(
                  splashColor: Colors.black54,
                  splashRadius: 30,
                  onPressed: () {
                    setState(() {
                      if (!toggle) {
                        toggle = !toggle;
                        _controller.forward();
                        Future.delayed(const Duration(milliseconds: 10), () {
                          alignment1 = const Alignment(-0.8, 0.3);
                          size1 = 50;
                        });
                        Future.delayed(const Duration(milliseconds: 100), () {
                          alignment2 = const Alignment(0.0, -0.2);
                          size2 = 50;
                        });
                        Future.delayed(const Duration(milliseconds: 200), () {
                          alignment3 = const Alignment(0.8, 0.3);
                          size3 = 50;
                        });
                      } else {
                        toggle = !toggle;
                        _controller.reverse();
                        Future.delayed(const Duration(milliseconds: 10), () {
                          alignment1 = const Alignment(0.0, 0.9);
                        });
                        Future.delayed(const Duration(milliseconds: 100), () {
                          alignment2 = const Alignment(0.0, 0.9);
                        });
                        Future.delayed(const Duration(milliseconds: 200), () {
                          alignment3 = const Alignment(0.0, 0.9);
                        });
                        size1 = size2 = size3 = 20;
                      }
                    });
                  },
                  icon: Center(
                    child: Icon(
                      color: appColors.onPrimary,
                      Icons.add,
                      size: toggle ? 30 : 30,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
