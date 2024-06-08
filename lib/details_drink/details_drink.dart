import 'package:cocktail/details_drink/details_drink_provider.dart';
import 'package:cocktail/models/drink_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class DrinkDetails extends StatefulWidget {
  const DrinkDetails({
    super.key,
  });

  @override
  State<DrinkDetails> createState() => _DrinkDetailsState();
}

class _DrinkDetailsState extends State<DrinkDetails>
    with TickerProviderStateMixin {
  late AnimationController _controllerAppBar;
  late Animation _animationAppBar;
  late Animation _animationOpacityAppBar;

  late AnimationController _controllerSliverList;
  late Animation _animationSliverList;

  @override
  void initState() {
    _controllerAppBar = AnimationController(
        duration: const Duration(milliseconds: 500), vsync: this);
    _animationAppBar =
        Tween<double>(begin: 1.0, end: 0.0).animate(_controllerAppBar);
    _animationOpacityAppBar =
        Tween<double>(begin: 0.0, end: 1.0).animate(_controllerAppBar);
    _controllerAppBar.addListener(() {
      setState(() {});
    });

    _controllerSliverList = AnimationController(
        duration: const Duration(milliseconds: 500), vsync: this);
    _animationSliverList =
        Tween<double>(begin: 0.0, end: 1.0).animate(_controllerSliverList);
    _controllerSliverList.addListener(() {
      setState(() {});
    });

    // _controllerAppBar.forward();
    super.initState();
  }

  @override
  void dispose() {
    _controllerAppBar.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).colorScheme;
    final appTextTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: Consumer<DetailsDrinkProvider>(
        builder: (ctx, provider, _) {
          if (provider.drink != null) {
            _controllerAppBar.forward();
            _controllerSliverList.forward();
          }
          return provider.statusLoading
              ? const Center(child: CircularProgressIndicator())
              : provider.statusSuccess
                  ? CustomScrollView(
                      slivers: [
                        SliverAppBar(
                          leading: GestureDetector(
                            onTap: () {
                              context.pop();
                            },
                            child: const Icon(
                              Icons.arrow_back_ios_new_outlined,
                              color: Colors.white,
                              shadows: [
                                BoxShadow(
                                    offset: Offset(1, 1), color: Colors.black),
                                BoxShadow(
                                    offset: Offset(1, -1), color: Colors.black),
                                BoxShadow(
                                    offset: Offset(-1, 1), color: Colors.black),
                                BoxShadow(
                                    offset: Offset(-1, -1), color: Colors.black)
                              ],
                            ),
                          ),
                          bottom: PreferredSize(
                            preferredSize: const Size.fromHeight(0.0),
                            child: Opacity(
                              opacity: _animationOpacityAppBar.value,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20, right: 20, bottom: 10),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Text(
                                            provider.drink?.strDrink ?? '',
                                            style: appTextTheme.titleSmall,
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      left: 20,
                                      right: 20,
                                      bottom: _animationAppBar.value * 20,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          provider.drink?.strCategory ?? '',
                                          style: appTextTheme.labelSmall
                                              ?.copyWith(color: Colors.grey),
                                        ),
                                        Text(
                                          provider.drink?.strGlass ?? '',
                                          style: appTextTheme.labelSmall
                                              ?.copyWith(color: Colors.grey),
                                        ),
                                        Text(
                                          provider.drink?.strAlcoholic ?? '',
                                          style: appTextTheme.labelSmall
                                              ?.copyWith(color: Colors.grey),
                                        )
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                ],
                              ),
                            ),
                          ),
                          expandedHeight: 400,
                          backgroundColor: Theme.of(context).primaryColor,
                          flexibleSpace: FlexibleSpaceBar(
                            background: Padding(
                              padding: const EdgeInsets.all(0.0),
                              child: Opacity(
                                opacity: _animationOpacityAppBar.value,
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            provider.drink?.strDrinkThumb ??
                                                ''),
                                        fit: BoxFit.cover,
                                        scale: 1.0),
                                  ),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        begin: Alignment.bottomRight,
                                        colors: [
                                          Colors.black,
                                          Colors.black.withOpacity(.3),
                                        ],
                                      ),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SliverList(
                          delegate: SliverChildListDelegate(
                            [
                              Opacity(
                                opacity: _animationSliverList.value,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    left: 20,
                                    right: 20,
                                    top: _animationSliverList.value * 20,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(height: 20),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text(
                                            "Ingredienti:",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          InkWell(
                                            child: const Icon(
                                              Icons.info_outline,
                                              color: Colors.grey,
                                            ),
                                            onTap: () {
                                              // showInfo(context);
                                            },
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      listaIngredienti(provider.drink!)
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20),
                              Opacity(
                                opacity: _animationSliverList.value,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: 20,
                                      right: 20,
                                      top: _animationSliverList.value * 20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text("Preparazione: ",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold)),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "${provider.drink?.strInstructionsIT}",
                                        style: const TextStyle(
                                            color: Colors.grey, fontSize: 16),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20),
                            ],
                          ),
                        )
                      ],
                    )
                  : const SizedBox.shrink();
        },
      ),
    );
  }

  Widget listaIngredienti(DrinkModel drink) {
    final appTextTheme = Theme.of(context).textTheme;
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              drink.strIngredient1 != null
                  ? Text("  ${drink.strIngredient1}",
                      style: appTextTheme.labelSmall)
                  : Container(),
              drink.strIngredient2 != null
                  ? Text("  ${drink.strIngredient2}",
                      style: appTextTheme.labelSmall)
                  : Container(),
              drink.strIngredient3 != null
                  ? Text("  ${drink.strIngredient3}",
                      style: appTextTheme.labelSmall)
                  : Container(),
              drink.strIngredient4 != null
                  ? Text("  ${drink.strIngredient4}",
                      style: appTextTheme.labelSmall)
                  : Container(),
              drink.strIngredient5 != null
                  ? Text("  ${drink.strIngredient5}",
                      style: appTextTheme.labelSmall)
                  : Container(),
              drink.strIngredient6 != null
                  ? Text("  ${drink.strIngredient6}",
                      style: appTextTheme.labelSmall)
                  : Container(),
              drink.strIngredient7 != null
                  ? Text("  ${drink.strIngredient7}",
                      style: appTextTheme.labelSmall)
                  : Container(),
              drink.strIngredient8 != null
                  ? Text("  ${drink.strIngredient8}",
                      style: appTextTheme.labelSmall)
                  : Container(),
              drink.strIngredient9 != null
                  ? Text("  ${drink.strIngredient9}",
                      style: appTextTheme.labelSmall)
                  : Container(),
              drink.strIngredient10 != null
                  ? Text("  ${drink.strIngredient10}",
                      style: appTextTheme.labelSmall)
                  : Container(),
              drink.strIngredient11 != null
                  ? Text("  ${drink.strIngredient11}",
                      style: appTextTheme.labelSmall)
                  : Container(),
              drink.strIngredient12 != null
                  ? Text("  ${drink.strIngredient12}",
                      style: appTextTheme.labelSmall)
                  : Container(),
              drink.strIngredient13 != null
                  ? Text("  ${drink.strIngredient13}",
                      style: appTextTheme.labelSmall)
                  : Container(),
              drink.strIngredient14 != null
                  ? Text("  ${drink.strIngredient14}",
                      style: appTextTheme.labelSmall)
                  : Container(),
              drink.strIngredient15 != null
                  ? Text("  ${drink.strIngredient15}",
                      style: appTextTheme.labelSmall)
                  : Container(),
            ],
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              drink.strMeasure1 != null
                  ? Text("  ${drink.strMeasure1}",
                      style: appTextTheme.labelSmall)
                  : Container(),
              drink.strMeasure2 != null
                  ? Text("  ${drink.strMeasure2}",
                      style: appTextTheme.labelSmall)
                  : Container(),
              drink.strMeasure3 != null
                  ? Text("  ${drink.strMeasure3}",
                      style: appTextTheme.labelSmall)
                  : Container(),
              drink.strMeasure4 != null
                  ? Text("  ${drink.strMeasure4}",
                      style: appTextTheme.labelSmall)
                  : Container(),
              drink.strMeasure5 != null
                  ? Text("  ${drink.strMeasure5}",
                      style: appTextTheme.labelSmall)
                  : Container(),
              drink.strMeasure6 != null
                  ? Text("  ${drink.strMeasure6}",
                      style: appTextTheme.labelSmall)
                  : Container(),
              drink.strMeasure7 != null
                  ? Text("  ${drink.strMeasure7}",
                      style: appTextTheme.labelSmall)
                  : Container(),
              drink.strMeasure8 != null
                  ? Text("  ${drink.strMeasure8}",
                      style: appTextTheme.labelSmall)
                  : Container(),
              drink.strMeasure9 != null
                  ? Text("  ${drink.strMeasure9}",
                      style: appTextTheme.labelSmall)
                  : Container(),
              drink.strMeasure10 != null
                  ? Text("  ${drink.strMeasure10}",
                      style: appTextTheme.labelSmall)
                  : Container(),
              drink.strMeasure11 != null
                  ? Text("  ${drink.strMeasure11}",
                      style: appTextTheme.labelSmall)
                  : Container(),
              drink.strMeasure12 != null
                  ? Text("  ${drink.strMeasure12}",
                      style: appTextTheme.labelSmall)
                  : Container(),
              drink.strMeasure13 != null
                  ? Text("  ${drink.strMeasure13}",
                      style: appTextTheme.labelSmall)
                  : Container(),
              drink.strMeasure14 != null
                  ? Text("  ${drink.strMeasure14}",
                      style: appTextTheme.labelSmall)
                  : Container(),
              drink.strMeasure15 != null
                  ? Text("  ${drink.strMeasure15}",
                      style: appTextTheme.labelSmall)
                  : Container(),
            ],
          ),
        )
      ],
    );
  }
}
