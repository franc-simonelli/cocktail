import 'package:flutter/material.dart';

class OptionScrollHome extends StatelessWidget {
  const OptionScrollHome({
    required this.text,
    required this.onPress,
    super.key,
  });

  final String text;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).colorScheme;
    final appTextTheme = Theme.of(context).textTheme;

    return GestureDetector(
      onTap: onPress,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: appColors.onBackground),
        ),
        child: Padding(
          padding: const EdgeInsets.all(3.0),
          child: Text(
            text,
            style: appTextTheme.labelSmall,
          ),
        ),
      ),
    );
  }
}
