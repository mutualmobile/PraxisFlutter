import 'package:get_it/get_it.dart';
import 'package:praxis_data/mapper/jokes/jokes_mappers.dart';
import 'package:praxis_data/repositories/jokes/data_jokes_repository.dart';
import 'package:praxis_flutter_domain/repositories/jokes/jokes_repository.dart';

void setupRepositories() {
  final locator = GetIt.instance;
  locator.registerLazySingleton<JokesRepository>(() => DataJokesRepository(locator.get<JokesListMapper>()));
}