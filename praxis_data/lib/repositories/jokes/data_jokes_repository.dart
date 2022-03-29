import 'dart:async';

import 'package:logger/logger.dart';
import 'package:praxis_data/mapper/entity_mapper.dart';
import 'package:praxis_data/models/jokes/dt_joke_list.dart';
import 'package:praxis_data/network/http_helper.dart';
import 'package:praxis_data/network/url.dart';
import 'package:praxis_flutter_domain/entities/jokes/dm_joke_list.dart';
import 'package:praxis_flutter_domain/repositories/jokes/jokes_repository.dart';

class DataJokesRepository implements JokesRepository {
  final Logger _logger = Logger();

  EntityMapper<DMJokeList, DTJokeList> mapper;

  DataJokesRepository(this.mapper);

  @override
  Future<DMJokeList> getFiveRandomJokes() async {
    Map<String, dynamic> body;
    try {
      Uri uri = Uri.https(URL.baseUrl, URL.fiveRandomJokesPath);
      body = await HttpHelper.invokeHttp(uri, RequestType.get);
    } catch (error) {
      _logger.e('Could not get Jokes', error);
      rethrow;
    }
    DTJokeList jokeList = DTJokeList.fromJson(body);
    return mapper.mapToDomain(jokeList);
  }
}
