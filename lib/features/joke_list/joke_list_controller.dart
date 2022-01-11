import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:praxis_flutter/ui/model/jokes/ui_joke.dart';

class JokeListController extends Controller {
  UIJokeList jokeList;

  JokeListController(this.jokeList);

  @override
  void initListeners() {}
}
