import 'package:equatable/equatable.dart';

class Joke extends Equatable {
  final int id;
  final String joke;

  const Joke(this.id, this.joke);

  Joke.fromJson(Map<String, dynamic> map)
      : id = map['id'],
        joke = map['joke'];

  @override
  String toString() {
    return '$id, $joke';
  }

  @override
  List<Object?> get props => [ id, joke];
}
