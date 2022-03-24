import 'package:praxis_data/models/jokes/dt_joke.dart';
import 'package:equatable/equatable.dart';

class DTJokeList extends Equatable {
  final String type;
  final List<DTJoke> jokeList;

  const DTJokeList(this.type, this.jokeList);

  factory DTJokeList.fromJson(Map<String, dynamic> map) {
    return DTJokeList(map['type'], List<DTJoke>.from((map['value'])
        .toList()
        .map((map) => DTJoke.fromJson(map))));
  }

  @override
  List<Object> get props => [DTJokeList(type,jokeList)];

  @override
  String toString() {
    return '$type, $jokeList';
  }
}
