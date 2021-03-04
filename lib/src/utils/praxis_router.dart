import 'package:flutter/material.dart';

import 'package:praxis/src/app/screens/screens.dart';

class PraxisRouter {
  final RouteObserver<PageRoute> routeObserver;

  PraxisRouter() : routeObserver = RouteObserver<PageRoute>();

  Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Screens.home:
        return _buildRoute(settings, HomePage());
    }
  }

  MaterialPageRoute _buildRoute(RouteSettings settings, Widget builder) {
    return new MaterialPageRoute(
      settings: settings,
      builder: (ctx) => builder,
    );
  }
}