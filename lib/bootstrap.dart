import 'package:cocktail/core/di/register_dependencies.dart';
import 'package:cocktail/environment/environment_config.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';

bootstrap(EnvironmentConfig environmentConfig) async {
  GetIt.I.registerSingleton<EnvironmentConfig>(environmentConfig);
  registerDependencies();
  await _setDeviceOrientation();
}

Future _setDeviceOrientation() async {
  final orientations = <DeviceOrientation>[];
  orientations.addAll([
    DeviceOrientation.portraitUp,
  ]);
  await SystemChrome.setPreferredOrientations(orientations);
}
