import 'package:cocktail/constants/image_constants.dart';
import 'package:cocktail/drink/drink_provider.dart';
import 'package:cocktail/home/widget/ingrediente_card.dart';
import 'package:cocktail/ingredienti/add_favorite/widget/filtro_all_ingredienti_widget.dart';
import 'package:cocktail/ingredienti/ingredienti_provider.dart';
import 'package:cocktail/models/ingredienti_model.dart';
import 'package:cocktail/route/go_router_config.dart';
import 'package:cocktail/shared/widgets/text_shadow.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class AllIngredienti extends StatelessWidget {
  const AllIngredienti({super.key});

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).colorScheme;
    final appTextTheme = Theme.of(context).textTheme;

    onPr() {
      Provider.of<DrinkProvider>(context, listen: false).getDrinksByIngrediente;
      context.push(ScreenPaths.drinks);
    }

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
              text: 'Ingredienti',
              textTheme: appTextTheme.titleMedium!,
            ),
            centerTitle: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: AssetImage(kImgIngredienti),
                    fit: BoxFit.cover,
                    opacity: 0.6,
                  ),
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(50.0),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: FiltroAllIngredientiWidget(
                  function:
                      Provider.of<IngredientiProvider>(context, listen: false)
                          .filtraIngredienti,
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Consumer<IngredientiProvider>(
                  builder: (ctx, provider, _) {
                    return Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: GridAllIngredienti(
                        list: provider.allIngredientiFiltrati,
                      ),
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

class GridAllIngredienti extends StatelessWidget {
  const GridAllIngredienti({
    required this.list,
    this.optionSelect,
    super.key,
  });

  final List<IngredientiModel> list;
  final List<IngredientiModel>? optionSelect;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: list.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 0.8,
        crossAxisCount: 3,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      itemBuilder: (context, index) {
        final item = list[index];
        bool isSelect = false;
        if (optionSelect != null) {
          isSelect = optionSelect!.contains(item);
        }
        return IngredienteCard(
          item: item,
          isSelect: isSelect,
          onPress: () {
            Provider.of<DrinkProvider>(context, listen: false)
                .getDrinksByIngrediente(item);
            context.push(ScreenPaths.drinks);
          },
        );
      },
    );
  }
}
