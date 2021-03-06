import 'dart:async';

import 'package:logging/logging.dart';
import 'package:praxis/src/data/utils/http_helper.dart';
import 'package:praxis/src/data/utils/url.dart';
import 'package:praxis/src/domain/entities/joke_list.dart';
import 'package:praxis/src/domain/repositories/jokes_repository.dart';

class DataJokesRepository implements JokesRepository {
  Logger _logger;

  static final DataJokesRepository _instance = DataJokesRepository._internal();

  DataJokesRepository._internal() {
    _logger = Logger('DataJokesRepository');
  }

  factory DataJokesRepository() => _instance;

  @override
  Future<JokeList> getFiveRandomJokes() async {
    Map<String, dynamic> body;
    try {
      Uri uri =  Uri.https(URL.baseUrl, URL.FiveRandomJokesPath);
      body = await HttpHelper.invokeHttp(uri, RequestType.get);
    } catch (error) {
      _logger.warning('Could not get Jokes', error);
      rethrow;
    }

    JokeList jokeList = JokeList.fromJson(body);
    return jokeList;
  }
}
