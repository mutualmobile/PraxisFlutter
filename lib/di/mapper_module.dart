import 'package:get_it/get_it.dart';
import 'package:praxis_data/mapper/jokes/jokes_mappers.dart';

void setupMappers() {
  final locator = GetIt.instance;
  locator.registerLazySingleton<JokeMapper>(() => JokeMapper());
  locator.registerLazySingleton<JokesListMapper>(() => JokesListMapper(locator.get<JokeMapper>()));
}