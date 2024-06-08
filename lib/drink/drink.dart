import 'package:cocktail/constants/image_constants.dart';
import 'package:cocktail/drink/drink_provider.dart';
import 'package:cocktail/drink/widget/drink_card.dart';
import 'package:cocktail/route/go_router_config.dart';
import 'package:cocktail/shared/widgets/filtro_widget.dart';
import 'package:cocktail/models/drink_model.dart';
import 'package:cocktail/shared/widgets/grid_loading.dart';
import 'package:cocktail/shared/widgets/text_shadow.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class Drink extends StatelessWidget {
  const Drink({super.key});

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).colorScheme;
    final appTextTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: CustomScrollView(
        physics: const ScrollPhysics(parent: BouncingScrollPhysics()),
        slivers: [
          SliverAppBar(
            pinned: true,
            backgroundColor: appColors.background,
            surfaceTintColor: appColors.background,
            expandedHeight: 150.0,
            leading: GestureDetector(
              onTap: () {
                context.pop();
              },
              child: const Icon(Icons.arrow_back_ios_new_outlined),
            ),
            title: TextShadow(
              text: 'Cocktail',
              textTheme: appTextTheme.titleMedium!,
            ),
            centerTitle: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: AssetImage(kImgCocktail),
                    fit: BoxFit.cover,
                    opacity: 0.6,
                  ),
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(50.0),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: FiltroWidget(
                  function: Provider.of<DrinkProvider>(context, listen: false)
                      .filtraDrinks,
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Consumer<DrinkProvider>(
                  builder: (ctx, provider, _) {
                    return Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: provider.statusSuccess
                          ? _ContentSuccess(
                              lista: provider.drinksFiltrati,
                            )
                          : provider.statusLoading
                              ? const GridLoading(
                                  aspectRatio: 0.8, crossAxis: 2)
                              : const SizedBox.shrink(),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ContentSuccess extends StatelessWidget {
  const _ContentSuccess({
    required this.lista,
  });

  final List<DrinkModel> lista;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: lista.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 0.7,
        crossAxisCount: 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      itemBuilder: (context, index) {
        final item = lista[index];
        // bool isSelect = false;
        // if (optionSelect != null) {
        //   isSelect = optionSelect!.contains(item);
        // }
        return GestureDetector(
          onTap: () {
            context.push(ScreenPaths.drinkDetails, extra: item.idDrink);
          },
          child: DrinkCard(item: item),
        );
      },
    );
  }
}
