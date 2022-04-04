import 'package:clean_architecture/clean_architecture.dart';
import 'package:praxis_flutter/ui/model/jokes/ui_joke.dart';

class JokeListController extends ViewModel {
  UIJokeList jokeList;

  JokeListController(this.jokeList);

  @override
  void initListeners() {}
}
