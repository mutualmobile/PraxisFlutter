import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:go_router/go_router.dart';
import 'package:praxis_flutter/features/home/home_presenter.dart';
import 'package:praxis_flutter/routing/routes.dart';
import 'package:praxis_flutter/ui/model/jokes/ui_joke.dart';
import 'package:praxis_flutter_domain/entities/jokes/dm_joke_list.dart';

class HomeController extends Controller {
  bool showProgress = false;

  final HomePresenter homePresenter;

  HomeController(jokesRepo) : homePresenter = HomePresenter(jokesRepo);

  @override
  void initListeners() {
    homePresenter.getJokeListOnNext = (UIJokeList jokeList) {
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

  void jokeScreen(UIJokeList jokeList) {
    getContext().push(jokeListRoute, extra: jokeList);
  }

  void changeProgressbarVisibility(bool visibility) {
    showProgress = visibility;
    refreshUI();
  }
}
