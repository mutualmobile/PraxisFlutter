import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:go_router/go_router.dart';
import 'package:praxis_flutter/domain/entities/jokes/joke_list.dart';
import 'package:praxis_flutter/features/home/home_presenter.dart';
import 'package:praxis_flutter/routing/routes.dart';

class HomeController extends Controller {
  bool showProgress = false;

  final HomePresenter homePresenter;

  HomeController(jokesRepo) : homePresenter = HomePresenter(jokesRepo);

  @override
  void initListeners() {
    homePresenter.getJokeListOnNext = (JokeList jokeList) {
      changeProgressbarVisibility(false);
      jokeScreen(jokeList);
    };
    homePresenter.getJokeListOnComplete = () {};

    homePresenter.getJokeListOnError = (e) {
      logger.severe(e);
    };
  }

  void fetchJokeList() {
    changeProgressbarVisibility(true);
    homePresenter.getJokeList();
  }

  void jokeScreen(JokeList jokeList) {
    getContext().push(jokeListRoute, extra: jokeList);
  }

  void changeProgressbarVisibility(bool visibility) {
    showProgress = visibility;
    refreshUI();
  }
}
