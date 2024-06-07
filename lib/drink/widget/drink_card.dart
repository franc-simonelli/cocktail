import 'package:cocktail/constants/image_constants.dart';
import 'package:cocktail/models/drink_model.dart';
import 'package:cocktail/shared/widgets/image_shadow.dart';
import 'package:flutter/material.dart';

class DrinkCard extends StatelessWidget {
  const DrinkCard({
    super.key,
    required this.item,
  });

  final DrinkModel item;

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).colorScheme;
    final appTextTheme = Theme.of(context).textTheme;

    return Container(
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
      child: Padding(
        padding: const EdgeInsets.all(0.0),
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: Text(
                      item.strDrink ?? '',
                      style: appTextTheme.labelSmall?.copyWith(
                        color: appColors.onPrimaryContainer,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              flex: 6,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: ImageShadow(
                    image: item.strDrinkThumb ?? '',
                    imgDefault: kImgDrinkDefault,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
