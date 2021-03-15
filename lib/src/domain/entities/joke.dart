class Joke {
  final int id;
  final String joke;

  Joke(this.id, this.joke);

  Joke.fromJson(Map<String, dynamic> map)
      : id = map['id'],
        joke = map['joke'];

  @override
  String toString() {
    return '$id, $joke';
  }
}