import 'package:get_it/get_it.dart';
import 'package:praxis_flutter/features/home/home_controller.dart';
import 'package:praxis_flutter/features/splash/splash_controller.dart';
import 'package:praxis_flutter_domain/repositories/jokes/jokes_repository.dart';

void setupControllers() {
  final locator = GetIt.instance;
  locator.registerLazySingleton<HomeController>(() => HomeController(locator.get<JokesRepository>()));
  locator.registerLazySingleton<SplashController>(() => SplashController());
}
