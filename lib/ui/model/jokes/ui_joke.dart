import 'package:praxis_flutter/ui/model/ui_model.dart';


class UiJoke extends UIModel {
  String joke;
  int id;

  UiJoke(this.id, this.joke);
}

class UIJokeList extends UIModel {
  List<UiJoke> jokes;
  String type;

  UIJokeList(this.type, this.jokes);
}