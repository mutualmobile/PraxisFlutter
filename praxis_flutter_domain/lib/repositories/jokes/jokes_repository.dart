import 'dart:async';
import 'package:praxis_flutter_domain/entities/jokes/joke_list.dart';

abstract class JokesRepository {
  Future<JokeList> getFiveRandomJokes();
}