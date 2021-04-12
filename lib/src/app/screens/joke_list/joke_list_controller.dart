
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:praxis/src/domain/entities/joke_list.dart';

class JokeListController extends Controller {

  JokeList jokeList;

  JokeListController(this.jokeList);

  @override
  void initListeners() {}

}