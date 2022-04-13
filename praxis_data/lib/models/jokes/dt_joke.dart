const String jokesTable = "jokesTable";

class JokeFields {
  static const String id = "_id";
  static const String joke = "joke";
}

class DTJoke {
  final int id;
  final String joke;

  DTJoke(this.id, this.joke);

  DTJoke.fromJson(Map<String, dynamic> map)
      : id = map['id'],
        joke = map['joke'];

  Map<String, Object?> toJson() => {JokeFields.id: id, JokeFields.joke: joke};

  static DTJoke dtJokeFromJson(Map<String, Object?> json) =>
      DTJoke(json[JokeFields.id] as int? ?? 0, json[JokeFields.joke] as String);

  @override
  String toString() {
    return '$id, $joke';
  }
}
