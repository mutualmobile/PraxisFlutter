import 'dart:async';

import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:praxis_data/mapper/jokes/jokes_mappers.dart';
import 'package:praxis_data/sources/local/praxis_database.dart';
import 'package:praxis_data/sources/network/jokes_api.dart';
import 'package:praxis_data/utils/platform_utils.dart';
import 'package:praxis_flutter_domain/entities/api_response.dart';
import 'package:praxis_flutter_domain/entities/jokes/dm_joke_list.dart';
import 'package:praxis_flutter_domain/repositories/jokes/jokes_repository.dart';

@Injectable(as: JokesRepository)
class DataJokesRepository implements JokesRepository {
  final JokesListMapper mapper;

  final JokesApi _jokesApi;
  final PraxisDatabase _praxisDatabase;
  final JokeMapper _jokeMapper;

  DataJokesRepository(
      this.mapper, this._jokesApi, this._praxisDatabase, this._jokeMapper);

  @override
  Future<ApiResponse<JokesListWithType>> getFiveRandomJokes() async {
    String? type;
    // Checking platform since sqflite doesn't support WEB
    if (isMobile()) {
      try {
        final networkResponse = await _jokesApi.getFiveRandomJokes();
        if (networkResponse is Success) {
          await _praxisDatabase.deleteAllJokes();
          final networkJokes = (networkResponse as Success).data as JokesListWithType;
          final jokes = mapper.mapToData(networkJokes);
          type = jokes.type;
          jokes.jokeList.forEach((joke) {
            _praxisDatabase.insertJoke(joke);
          });
        }
      } on Exception catch (e, _) {
        return Failure(error: e);
      }
      final dbJokes = await _praxisDatabase.getAllJokes();
      final domainJokes =
          dbJokes.map((dbJoke) => _jokeMapper.mapToDomain(dbJoke)).toList();
      return Success(data: JokesListWithType(type ?? "", domainJokes));
    } else {
      return _jokesApi.getFiveRandomJokes();
    }
  }
}
