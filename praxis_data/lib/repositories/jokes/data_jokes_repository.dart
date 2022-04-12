import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:praxis_data/mapper/jokes/jokes_mappers.dart';
import 'package:praxis_data/sources/network/jokes_api.dart';
import 'package:praxis_flutter_domain/entities/api_response.dart';
import 'package:praxis_flutter_domain/entities/jokes/dm_joke_list.dart';
import 'package:praxis_flutter_domain/repositories/jokes/jokes_repository.dart';

@Injectable(as: JokesRepository)
class DataJokesRepository implements JokesRepository {
  JokesListMapper mapper;
  late JokesApi _jokesApi;

  DataJokesRepository(this.mapper) {
    _jokesApi = JokesApi(mapper);
  }

  @override
  Future<ApiResponse<DMJokeList>> getFiveRandomJokes() async =>
      _jokesApi.getFiveRandomJokes();
}
