import 'dart:async';
import 'package:praxis_flutter_domain/entities/api_response.dart';
import 'package:praxis_flutter_domain/entities/jokes/dm_joke_list.dart';

abstract class JokesRepository {
  Future<ApiResponse<JokesListWithType>> getFiveRandomJokes();
}