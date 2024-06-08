import 'package:cocktail/shared/widgets/shimmer_widget.dart';
import 'package:flutter/material.dart';

class GridLoading extends StatelessWidget {
  const GridLoading({
    this.aspectRatio = 0.7,
    this.crossAxis = 2,
    super.key,
  });

  final double aspectRatio;
  final int crossAxis;

  @override
  Widget build(BuildContext context) {
    // final appColors = Theme.of(context).colorScheme;
    // final appTextTheme = Theme.of(context).textTheme;

    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 8,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: aspectRatio,
        crossAxisCount: crossAxis,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      itemBuilder: (context, index) {
        return const ShimmerWidget();
      },
    );
  }
}
