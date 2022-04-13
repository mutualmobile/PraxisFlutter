import 'package:praxis_flutter_domain/entities/jokes/dm_joke.dart';
import 'package:praxis_flutter_domain/mapper/ui_model_mapper.dart';

class JokesListWithType {
  final String type;
  final List<Joke> jokeList;

  JokesListWithType(this.type, this.jokeList);
}
