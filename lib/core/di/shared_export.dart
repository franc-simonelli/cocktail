import 'package:cocktail/environment/environment_config.dart';
import 'package:cocktail/loading/loading_notifier.dart';
import 'package:cocktail/repository/ingredienti_repository.dart';
import 'package:cocktail/service/context_service.dart';
import 'package:cocktail/service/shared_preferences_service.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

ContextService get contextService => GetIt.I.get<ContextService>();
BuildContext get globalContext => contextService.context;
SharedPreferenceService get sharedPrefsService =>
    GetIt.I.get<SharedPreferenceService>();
GetIt locator = GetIt.instance;
LoadingNotifier get loadingNotifier => GetIt.I.get<LoadingNotifier>();
EnvironmentConfig get environmentConfig => GetIt.I.get<EnvironmentConfig>();
IngredientiRepository get ingredientiRepository =>
    GetIt.I.get<IngredientiRepository>();
