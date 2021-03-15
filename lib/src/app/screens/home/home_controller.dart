import 'package:clean_architecture/clean_architecture.dart';
import 'package:praxis/src/app/screens/home/home_presenter.dart';
import 'package:praxis/src/domain/entities/joke_list.dart';
import 'package:flutter/material.dart';

import '../screens.dart';

class HomeController extends Controller {

  final HomePresenter homePresenter;

  HomeController(jokesRepo)
    : homePresenter = HomePresenter(jokesRepo);

  @override
  void initListeners() {
    homePresenter.getJokeListOnNext = (JokeList jokeList) {
      jokeScreen(jokeList);
    };
    homePresenter.getJokeListOnComplete = () {};

    homePresenter.getJokeListOnError = (e) {
      logger.severe(e);
    };
  }

  void fetchJokeList() => homePresenter.getJokeList();

  void jokeScreen(JokeList jokeList) {
    Navigator.of(getContext()).pushNamed(Screens.jokeList, arguments: {
      'jokeList': jokeList
    });
  }

}