class DTJoke  {
  final int id;
  final String joke;

  DTJoke(this.id, this.joke);

  DTJoke.fromJson(Map<String, dynamic> map)
      : id = map['id'],
        joke = map['joke'];

  @override
  String toString() {
    return '$id, $joke';
  }
}
