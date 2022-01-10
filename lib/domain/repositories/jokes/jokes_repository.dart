import 'dart:async';
import 'package:praxis_flutter/domain/entities/jokes/joke_list.dart';

abstract class JokesRepository {
  Future<JokeList> getFiveRandomJokes();
}