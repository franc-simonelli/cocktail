import 'package:cocktail/drink/drink_provider.dart';
import 'package:cocktail/home/widget/ingrediente_card.dart';
import 'package:cocktail/home/widget/item_card_add.dart';
import 'package:cocktail/ingredienti/ingredienti_provider.dart';
import 'package:cocktail/models/ingredienti_model.dart';
import 'package:cocktail/route/go_router_config.dart';
import 'package:cocktail/shared/widgets/shimmer_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class SectionScrollIngredienti extends StatelessWidget {
  const SectionScrollIngredienti({
    required this.title,
    required this.lista,
    required this.status,
    this.showAdd = false,
    this.onPressAdd,
    this.widgetOption,
    super.key,
  });

  final String title;
  final List<IngredientiModel> lista;
  final Status status;
  final bool showAdd;
  final VoidCallback? onPressAdd;
  final Widget? widgetOption;

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
              if (widgetOption != null) widgetOption!
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0),
          child: SizedBox(
            height: 35.w,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: status == Status.success && lista.isNotEmpty
                  ? _ContentSuccess(lista: lista)
                  : status == Status.success && lista.isEmpty
                      ? _ContentAdd(onPressAdd: onPressAdd)
                      : status == Status.loading
                          ? const _ContentLoad()
                          : const SizedBox(),
            ),
          ),
        ),
      ],
    );
  }
}

class _ContentAdd extends StatelessWidget {
  const _ContentAdd({
    super.key,
    required this.onPressAdd,
  });

  final VoidCallback? onPressAdd;

  @override
  Widget build(BuildContext context) {
    return onPressAdd != null
        ? ItemCardAdd(
            onPressAdd: onPressAdd ?? () {},
          )
        : const SizedBox();
  }
}

class _ContentLoad extends StatelessWidget {
  const _ContentLoad({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 3,
      itemBuilder: (context, index) {
        return const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: ShimmerWidget(),
        );
      },
    );
  }
}

class _ContentSuccess extends StatelessWidget {
  const _ContentSuccess({
    required this.lista,
  });

  final List<IngredientiModel> lista;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: lista.length,
      itemBuilder: (context, index) {
        final item = lista[index];
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: IngredienteCard(
            item: item,
            onPress: () {
              Provider.of<DrinkProvider>(context, listen: false)
                  .getDrinksByIngrediente(item);
              context.push(ScreenPaths.drinks);
            },
          ),
        );
      },
    );
  }
}
