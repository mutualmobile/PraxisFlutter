import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:praxis/src/app/screens/home/home_presenter.dart';
import 'package:praxis/src/domain/entities/joke_list.dart';
import 'package:flutter/material.dart';

import '../screens.dart';

class HomeController extends Controller {
  bool showProgress = false;

  final HomePresenter homePresenter;

  HomeController(jokesRepo)
    : homePresenter = HomePresenter(jokesRepo);

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
    Navigator.of(getContext()).pushNamed(Screens.jokeList, arguments: {
      'jokeList': jokeList
    });
  }

  void changeProgressbarVisibility(bool visibility) {
    showProgress = visibility;
    refreshUI();
  }

}