import 'package:cocktail/add_favorite/widget/filtro_all_ingredienti_widget.dart';
import 'package:cocktail/constants/image_constants.dart';
import 'package:cocktail/home/widget/item_card.dart';
import 'package:cocktail/ingredienti_provider/ingredienti_provider.dart';
import 'package:cocktail/shared/widgets/text_shadow.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class AddFavoriteIngrediente extends StatelessWidget {
  const AddFavoriteIngrediente({super.key});

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
              text: 'Preferiti',
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
            bottom: const PreferredSize(
              preferredSize: Size.fromHeight(50.0),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: FiltroAllIngredientiWidget(),
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
                      child: GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: provider.allIngredienti.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: 0.8,
                          crossAxisCount: 3,
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 20,
                        ),
                        itemBuilder: (context, index) {
                          final item = provider.allIngredientiWithImage[index];
                          final isSelect =
                              provider.ingredientiPreferiti.contains(item);
                          return ItemCard(
                            item: item,
                            isSelect: isSelect,
                            onPress: () {
                              Provider.of<IngredientiProvider>(context,
                                      listen: false)
                                  .saveIngredientePreferito(item);
                            },
                          );
                        },
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
