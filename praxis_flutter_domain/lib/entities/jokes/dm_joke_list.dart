import 'package:praxis_flutter_domain/entities/jokes/dm_joke.dart';
import 'package:praxis_flutter_domain/mapper/ui_model_mapper.dart';

class DMJokeList extends DomainModel {
  final String type;
  final List<DMJoke> jokeList;

  DMJokeList(this.type, this.jokeList);
}
