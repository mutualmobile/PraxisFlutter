import 'package:clean_architecture/clean_architecture.dart';
import 'package:go_router/go_router.dart';
import 'package:praxis_flutter/routing/routes.dart';
import 'package:praxis_flutter/ui/model/jokes/ui_joke.dart';
import 'package:praxis_flutter/ui/model/jokes/ui_jokes_mapper.dart';
import 'package:praxis_flutter_domain/entities/jokes/dm_joke_list.dart';
import 'package:praxis_flutter_domain/use_cases/get_five_random_jokes_usecase.dart';

class HomeVM extends ViewModel {
  bool showProgress = false;
  var mapper = UIJokeMapper();
  late GetFiveRandomJokesUseCase getFiveRandomJokesUseCase;

  HomeVM(jokesRepo)
      : getFiveRandomJokesUseCase = GetFiveRandomJokesUseCase(jokesRepo);

  void fetchJokeList() {
    changeProgressbarVisibility(true);
    getFiveRandomJokesUseCase.perform(handleResponse, error, complete);
  }

  void jokeScreen(UIJokeList jokeList) {
    getContext().push(jokeListRoute, extra: jokeList);
  }

  void changeProgressbarVisibility(bool visibility) {
    showProgress = visibility;
    refreshUI();
  }

  @override
  void didPop() {
    getFiveRandomJokesUseCase.dispose();
    super.didPop();
  }

  void handleResponse(GetJokeListUseCaseResponse? response) {
    changeProgressbarVisibility(false);
    var jokes = response?.jokeList ?? DMJokeList("EmptyList", []);
    jokeScreen(mapper.mapToPresentation(jokes));
  }

  void complete() {
    changeProgressbarVisibility(false);
  }

  error(e) {
    logger.info(e);
  }

  @override
  void initListeners() {
  }
}
