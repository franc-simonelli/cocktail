import 'package:cocktail/constants/image_constants.dart';
import 'package:cocktail/home/widget/circular_menu.dart';
import 'package:cocktail/ingredienti_provider/ingredienti_provider.dart';
import 'package:cocktail/home/widget/section_scroll.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _isMenuOpen = false;
  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).colorScheme;
    final appTextTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                flex: 3,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(0),
                    color: Colors.black,
                    image: const DecorationImage(
                      image: AssetImage(kImgWallpaper),
                      opacity: 0.8,
                      fit: BoxFit.contain,
                    ),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20.w,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'The best \ncocktail guide',
                              style: appTextTheme.titleMedium
                                  ?.copyWith(fontWeight: FontWeight.bold),
                            ),
                            Image.asset(
                              kImgIcon,
                              width: 60,
                              height: 60,
                              color: appColors.primary,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 30),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 50,
                          decoration: BoxDecoration(
                            color: appColors.background.withOpacity(0.6),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: appColors.onBackground),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text("Name a Cocktail?"),
                                Icon(
                                  Icons.search,
                                  color: appColors.onBackground,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 5,
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: appColors.background,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: Column(
                    children: [
                      Consumer<IngredientiProvider>(
                        builder: (ctx, provider, _) {
                          return SectionScrollIngredienti(
                            title: 'Ingredienti preferiti',
                            lista: provider.ingredientiPreferiti,
                            showElimina: true,
                            showAdd: true,
                            onPress: () {
                              Provider.of<IngredientiProvider>(context,
                                      listen: false)
                                  .removeAllIngredientiPreferiti();
                            },
                            onPressAdd: () {},
                          );
                        },
                      ),
                      SizedBox(height: 2.w),
                      Consumer<IngredientiProvider>(
                        builder: (ctx, provider, _) {
                          return SectionScrollIngredienti(
                            title: 'Ingredienti',
                            lista: provider.allIngredientiWithImage,
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          if (_isMenuOpen)
            Container(
              color: Colors.black54,
            ),
          Align(
            alignment: Alignment.bottomCenter,
            child: MenuCircular(
              onPress: () {
                setState(() {
                  _isMenuOpen = !_isMenuOpen;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
