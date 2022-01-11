import 'dart:async';
import 'package:praxis_flutter_domain/entities/jokes/dm_joke_list.dart';

abstract class JokesRepository {
  Future<DMJokeList> getFiveRandomJokes();
}