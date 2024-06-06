import 'package:cocktail/loading/loading_notifier.dart';
import 'package:cocktail/repository/ingredienti_repository.dart';
import 'package:cocktail/service/context_service.dart';
import 'package:cocktail/service/local_storage_service.dart';
import 'package:cocktail/service/shared_preferences_service.dart';
import 'package:get_it/get_it.dart';

void registerDependencies() {
  final contextService = ContextService();
  GetIt.I.registerSingleton<SharedPreferenceService>(SharedPreferenceService());
  GetIt.I.registerSingleton(
    LocalStorageService(
      prefs: SharedPreferenceService(),
    ),
  );
  GetIt.I.registerSingleton<ContextService>(contextService);
  GetIt.I.registerLazySingleton(() => LoadingNotifier());
  GetIt.I.registerLazySingleton(() => IngredientiRepository());
}
