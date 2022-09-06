import 'package:praxis_data/mapper/entity_mapper.dart';
import 'package:praxis_data/models/jokes/dt_joke.dart';

class DTJokeList  {
  final List<DTJoke> jokeList;

  DTJokeList(this.jokeList);

  DTJokeList.fromJson(Map<String, dynamic> map)
      :
        jokeList = List<DTJoke>.from((map['result'].cast<Map<String, dynamic>>())
            .toList()
            .map((map) => DTJoke.fromJson(map)));

  @override
  String toString() {
    return '$jokeList';
  }
}
