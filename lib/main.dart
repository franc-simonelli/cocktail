import 'package:cocktail/bootstrap.dart';
import 'package:cocktail/ingredienti_provider/ingredienti_provider.dart';
import 'package:cocktail/environment/environment_config.dart';
import 'package:cocktail/loading/fullscreen_loading_listener.dart';
import 'package:cocktail/route/go_router_config.dart';
import 'package:cocktail/theme/my_text_theme.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await bootstrap(EnvironmentConfig.dev());
  runApp(const WrapperProviders());
}

class WrapperProviders extends StatelessWidget {
  const WrapperProviders({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(
        create: (_) => IngredientiProvider()..getAllIngredienti(),
      ),
    ], child: const _MyApp());
  }
}

class _MyApp extends StatelessWidget {
  const _MyApp();

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          theme: AppTheme().myTheme().copyWith(
                pageTransitionsTheme: const PageTransitionsTheme(
                  builders: {
                    TargetPlatform.android: CupertinoPageTransitionsBuilder(),
                    TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
                  },
                ),
              ),
          routerConfig: goRouter,
          builder: (context, child) {
            return Stack(
              children: [
                _Unfocus(
                  child: child!,
                ),
                const FullScreenLoadingListener(),
              ],
            );
          },
        );
      },
    );
  }
}

class _Unfocus extends StatelessWidget {
  const _Unfocus({
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: child,
      ),
    );
  }
}
