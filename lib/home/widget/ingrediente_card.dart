import 'package:cocktail/constants/image_constants.dart';
import 'package:cocktail/models/ingredienti_model.dart';
import 'package:cocktail/shared/widgets/image_shadow.dart';
import 'package:flutter/material.dart';

class IngredienteCard extends StatelessWidget {
  const IngredienteCard({
    super.key,
    required this.item,
    this.isSelect = false,
    this.onPress,
  });

  final IngredientiModel item;
  final bool isSelect;
  final VoidCallback? onPress;

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).colorScheme;
    final appTextTheme = Theme.of(context).textTheme;

    return GestureDetector(
      onTap: onPress,
      child: AnimatedOpacity(
        opacity: isSelect ? 0.3 : 1.0,
        duration: const Duration(milliseconds: 200),
        child: Container(
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
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Expanded(
                  flex: 1,
                  child: Text(
                    item.strIngredient1,
                    style: appTextTheme.labelSmall?.copyWith(
                      color: appColors.onPrimaryContainer,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 10),
                Expanded(
                  flex: 5,
                  child: ImageShadow(
                    image: item.image!,
                    imgDefault: kImgRum,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
