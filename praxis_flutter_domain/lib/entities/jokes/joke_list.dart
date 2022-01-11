import 'package:equatable/equatable.dart';
import 'package:praxis_flutter_domain/entities/jokes/joke.dart';

class JokeList extends Equatable {
  final String type;
  final List<Joke> jokeList;

  const JokeList(this.type, this.jokeList);

  JokeList.fromJson(Map<String, dynamic> map)
      : type = map['type'],
        jokeList = List<Joke>.from((map['value'].cast<Map<String, dynamic>>())
            .toList()
            .map((map) => Joke.fromJson(map)));

  @override
  String toString() {
    return '$type, $jokeList';
  }

  @override
  List<Object?> get props => [type, jokeList];
}
