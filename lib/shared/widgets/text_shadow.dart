import 'package:flutter/material.dart';

class TextShadow extends StatelessWidget {
  const TextShadow({
    required this.text,
    required this.textTheme,
    this.invertStyle = false,
    super.key,
  });

  final String text;
  final TextStyle textTheme;
  final bool invertStyle;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: textTheme.copyWith(
        color: invertStyle ? Colors.black : Colors.grey.shade300,
        letterSpacing: 3.0,
        shadows: [
          BoxShadow(
              // bottomLeft
              offset: const Offset(-1.0, -1.0),
              blurRadius: 3,
              spreadRadius: 3,
              color: invertStyle ? Colors.white : Colors.black),
          BoxShadow(
              // bottomRight
              offset: const Offset(1.5, -1.5),
              blurRadius: 3,
              spreadRadius: 5,
              color: invertStyle ? Colors.white : Colors.black),
          BoxShadow(
              // topRight
              offset: const Offset(1.5, 1.5),
              blurRadius: 3,
              spreadRadius: 5,
              color: invertStyle ? Colors.white : Colors.black),
          BoxShadow(
              // topLeft
              offset: const Offset(-1.5, 1.5),
              blurRadius: 0,
              spreadRadius: 5,
              color: invertStyle ? Colors.white : Colors.black)
        ],
      ),
    );
  }
}
