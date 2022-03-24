import 'package:equatable/equatable.dart';

class DTJoke extends Equatable {
  final int id;
  final String joke;

  const DTJoke(this.id, this.joke);

  @override
  String toString() {
    return '$id, $joke';
  }

  factory DTJoke.fromJson(Map<String, dynamic> map) {
    return DTJoke(map['id'],map['joke']);
  }
  @override
  List<Object> get props => [DTJoke(id, joke)];
}
