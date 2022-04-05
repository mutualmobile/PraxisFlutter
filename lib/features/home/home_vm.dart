import 'package:clean_architecture/clean_architecture.dart';
import 'package:go_router/go_router.dart';
import 'package:praxis_flutter/routing/routes.dart';

class HomeVM extends ViewModel {
  @override
  void initListeners() {
  }

  void navigateJokes() {
    getContext().push(jokeListRoute);
  }
}
