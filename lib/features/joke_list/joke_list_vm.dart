import 'package:clean_architecture/clean_architecture.dart';
import 'package:praxis_flutter/ui/model/jokes/ui_joke.dart';
import 'package:praxis_flutter/ui/model/jokes/ui_jokes_mapper.dart';
import 'package:praxis_flutter_domain/entities/jokes/dm_joke_list.dart';
import 'package:praxis_flutter_domain/use_cases/get_five_random_jokes_usecase.dart';

class JokeListVM extends ViewModel {
  UIJokeList jokesList = UIJokeList("empty", []);

  @override
  void initListeners() {
    fetchJokeList();
  }

  bool showProgress = false;
  var mapper = UIJokeMapper();
  late GetFiveRandomJokesUseCase getFiveRandomJokesUseCase;

  JokeListVM(jokesRepo)
      : getFiveRandomJokesUseCase = GetFiveRandomJokesUseCase(jokesRepo);

  void fetchJokeList() {
    changeProgressbarVisibility(true);
    getFiveRandomJokesUseCase.perform(handleResponse, error, complete);
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
    jokesList = mapper.mapToPresentation(jokes);
    refreshUI();
  }

  void complete() {
    changeProgressbarVisibility(false);
  }

  error(e) {
    logger.info(e);
  }
}
