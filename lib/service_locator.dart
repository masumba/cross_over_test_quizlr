import 'dart:developer' as developer;
import 'package:cross_over_test_quizlr/services/navigation_service.dart';
import 'package:cross_over_test_quizlr/services/package_info_service.dart';
import 'package:cross_over_test_quizlr/views/app_base_view_model.dart';
import 'package:get_it/get_it.dart';

/// Create an instance of GetIt
final GetIt locator = GetIt.instance;

/// Sets up the service locator.
///
/// This function should be called once during app initialization.
Future<void> setUpLocator() async {
  developer.log("Setting Up Locator Service.");

  /// Register services as singletons. GetIt will only create these objects a single time,
  /// and then always return the same instance when requested.
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => PackageInfoService());

  /// Register a factory for the AppBaseViewModel. GetIt will create a new instance
  /// every time this type is requested.
  locator.registerFactory(() => AppBaseViewModel());
}
