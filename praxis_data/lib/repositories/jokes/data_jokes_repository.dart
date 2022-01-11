import 'dart:async';

import 'package:logging/logging.dart';
import 'package:praxis_data/network/http_helper.dart';
import 'package:praxis_data/network/url.dart';
import 'package:praxis_flutter_domain/entities/jokes/joke_list.dart';
import 'package:praxis_flutter_domain/repositories/jokes/jokes_repository.dart';

class DataJokesRepository implements JokesRepository {
  late Logger _logger;

  static final DataJokesRepository _instance = DataJokesRepository._internal();

  DataJokesRepository._internal() {
    _logger = Logger('DataJokesRepository');
  }

  factory DataJokesRepository() => _instance;

  @override
  Future<JokeList> getFiveRandomJokes() async {
    Map<String, dynamic> body;
    try {
      Uri uri = Uri.https(URL.baseUrl, URL.fiveRandomJokesPath);
      body = await HttpHelper.invokeHttp(uri, RequestType.get);
    } catch (error) {
      _logger.warning('Could not get Jokes', error);
      rethrow;
    }

    JokeList jokeList = JokeList.fromJson(body);
    return jokeList;
  }
}
