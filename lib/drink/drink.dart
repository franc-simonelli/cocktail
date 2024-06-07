import 'package:cocktail/constants/image_constants.dart';
import 'package:cocktail/drink/drink_provider.dart';
import 'package:cocktail/drink/widget/drink_card.dart';
import 'package:cocktail/ingredienti/add_favorite/widget/filtro_all_ingredienti_widget.dart';
import 'package:cocktail/models/drink_model.dart';
import 'package:cocktail/shared/widgets/shimmer_widget.dart';
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
            // bottom: const PreferredSize(
            //   preferredSize: Size.fromHeight(50.0),
            //   child: Padding(
            //     padding: EdgeInsets.symmetric(horizontal: 20),
            //     child: FiltroAllIngredientiWidget(),
            //   ),
            // ),
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
                                lista: provider.drinksList,
                              )
                            : provider.statusLoading
                                ? const _ContentLoading()
                                : const SizedBox.shrink());
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
    super.key,
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
        bool isSelect = false;
        // if (optionSelect != null) {
        //   isSelect = optionSelect!.contains(item);
        // }
        return DrinkCard(item: item);
      },
    );
  }
}

class _ContentLoading extends StatelessWidget {
  const _ContentLoading({super.key});

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).colorScheme;
    final appTextTheme = Theme.of(context).textTheme;

    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 8,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 0.7,
        crossAxisCount: 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      itemBuilder: (context, index) {
        return const ShimmerWidget();
      },
    );
  }
}
