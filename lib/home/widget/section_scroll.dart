import 'package:cocktail/home/widget/item_card.dart';
import 'package:cocktail/home/widget/item_card_add.dart';
import 'package:cocktail/models/ingredienti_model.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SectionScrollIngredienti extends StatelessWidget {
  const SectionScrollIngredienti({
    required this.title,
    required this.lista,
    this.showElimina = false,
    this.showAdd = false,
    this.onPress,
    this.onPressAdd,
    super.key,
  });

  final String title;
  final List<IngredientiModel> lista;
  final bool showElimina;
  final bool showAdd;
  final VoidCallback? onPress;
  final VoidCallback? onPressAdd;

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).colorScheme;
    final appTextTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.all(4.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: appTextTheme.labelMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: appColors.onBackground,
                ),
              ),
              if (showElimina && lista.isNotEmpty)
                GestureDetector(
                  onTap: onPress!,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: appColors.onBackground),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Text(
                        'Elimina',
                        style: appTextTheme.labelSmall,
                      ),
                    ),
                  ),
                )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0),
          child: SizedBox(
            height: 35.w,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: lista.isNotEmpty
                  ? ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: lista.length,
                      itemBuilder: (context, index) {
                        final item = lista[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: ItemCard(item: item),
                        );
                      },
                    )
                  : ItemCardAdd(
                      onPressAdd: onPressAdd ?? () {},
                    ),
            ),
          ),
        ),
      ],
    );
  }
}
