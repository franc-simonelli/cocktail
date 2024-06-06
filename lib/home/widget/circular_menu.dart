import 'package:circular_menu/circular_menu.dart';
import 'package:cocktail/route/go_router_config.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MenuCircular extends StatelessWidget {
  const MenuCircular({
    required this.onPress,
    super.key,
  });

  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).colorScheme;

    return CircularMenu(
      toggleButtonOnPressed: onPress,
      alignment: Alignment.bottomCenter,
      toggleButtonColor: appColors.primaryContainer,
      items: [
        CircularMenuItem(
          icon: Icons.add,
          color: appColors.primary,
          onTap: () {
            context.push(ScreenPaths.addFavoriteIngredienti);
          },
        ),
        CircularMenuItem(
            icon: Icons.favorite_outline,
            color: appColors.primary,
            onTap: () {}),
        CircularMenuItem(
            icon: Icons.settings_outlined,
            color: appColors.primary,
            onTap: () {}),
        CircularMenuItem(
            icon: Icons.help_outline, color: appColors.primary, onTap: () {}),
      ],
    );
  }
}
