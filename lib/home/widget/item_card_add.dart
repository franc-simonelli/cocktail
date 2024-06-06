import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ItemCardAdd extends StatelessWidget {
  const ItemCardAdd({
    required this.onPressAdd,
    super.key,
  });

  final VoidCallback onPressAdd;

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).colorScheme;
    // final appTextTheme = Theme.of(context).textTheme;

    return GestureDetector(
      onTap: onPressAdd,
      child: Container(
          height: 35.w,
          width: 110,
          decoration: BoxDecoration(
            color: appColors.primaryContainer,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: appColors.shadow,
                offset: const Offset(-1, -1),
              ),
              BoxShadow(
                color: appColors.shadow,
                offset: const Offset(3, 3),
                blurRadius: 1,
                spreadRadius: 1,
              ),
            ],
          ),
          child: Center(
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: appColors.onPrimary,
              ),
              child: Icon(
                Icons.add,
                size: 40,
                color: appColors.primaryContainer,
              ),
            ),
          )),
    );
  }
}
