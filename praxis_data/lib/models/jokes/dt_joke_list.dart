import 'package:praxis_data/mapper/entity_mapper.dart';
import 'package:praxis_data/models/jokes/dt_joke.dart';

class DTJokeList  {
  final String type;
  final List<DTJoke> jokeList;

  DTJokeList(this.type, this.jokeList);

  DTJokeList.fromJson(Map<String, dynamic> map)
      : type = map['type'],
        jokeList = List<DTJoke>.from((map['value'].cast<Map<String, dynamic>>())
            .toList()
            .map((map) => DTJoke.fromJson(map)));

  @override
  String toString() {
    return '$type, $jokeList';
  }
}
