import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:praxis_flutter_domain/entities/jokes/joke_list.dart';

class JokeListController extends Controller {
  JokeList jokeList;

  JokeListController(this.jokeList);

  @override
  void initListeners() {}
}
