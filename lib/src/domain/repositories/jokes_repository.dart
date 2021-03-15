import 'dart:async';

import 'package:praxis/src/domain/entities/joke_list.dart';

abstract class JokesRepository {
  Future<JokeList> getFiveRandomJokes();
}