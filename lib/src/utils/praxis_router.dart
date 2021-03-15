import 'package:flutter/material.dart';
import 'package:praxis/src/app/screens/joke_list/joke_list_page.dart';

import 'package:praxis/src/app/screens/screens.dart';

class PraxisRouter {
  final RouteObserver<PageRoute> routeObserver;

  PraxisRouter() : routeObserver = RouteObserver<PageRoute>();

  Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Screens.home:
        return _buildRoute(settings, HomePage());
      case Screens.jokeList:
        Map<String, dynamic> args = settings.arguments as Map;
        return _buildRoute(
          settings,
          JokeListPage(jokeList: args['jokeList']));
    }
  }

  MaterialPageRoute _buildRoute(RouteSettings settings, Widget builder) {
    return new MaterialPageRoute(
      settings: settings,
      builder: (ctx) => builder,
    );
  }
}