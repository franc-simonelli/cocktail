import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWidget extends StatelessWidget {
  const ShimmerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).colorScheme;
    return Shimmer.fromColors(
      baseColor: appColors.primaryContainer,
      highlightColor: appColors.primary,
      child: Container(
        width: 100,
        decoration: BoxDecoration(
          color: Colors.white,
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
      ),
    );
  }
}
