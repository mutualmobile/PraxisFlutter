import 'package:praxis/src/domain/entities/joke.dart';

class JokeList {
  final String type;
  final List<Joke> jokeList;

  JokeList(this.type, this.jokeList);

  JokeList.fromJson(Map<String, dynamic> map)
    : type = map['type'],
      jokeList = List<Joke>.from(
          (map['value'].cast<Map<String, dynamic>>())
              .toList()
              .map((map) => Joke.fromJson(map)));

  @override
  String toString() {
    return '$type, $jokeList';
  }
}