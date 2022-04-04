import 'package:clean_architecture/clean_architecture.dart';
import 'package:praxis_flutter/ui/model/jokes/ui_jokes_mapper.dart';
import 'package:praxis_flutter_domain/use_cases/get_five_random_jokes_usecase.dart';
import 'package:praxis_flutter_domain/entities/jokes/dm_joke_list.dart';

class HomePresenter extends Presenter {
  Function? getJokeListOnNext;
  Function? getJokeListOnComplete;
  Function? getJokeListOnError;

  late GetFiveRandomJokesUseCase getFiveRandomJokesUseCase;

  HomePresenter(jokesRepo)
      : getFiveRandomJokesUseCase = GetFiveRandomJokesUseCase(jokesRepo);

  void getJokeList(Function) {
    getFiveRandomJokesUseCase.execute(_GetJokeListUseCaseObserver(this));
  }

  @override
  void dispose() {
    getFiveRandomJokesUseCase.dispose();
  }
}

class _GetJokeListUseCaseObserver extends Observer<GetJokeListUseCaseResponse> {
  final HomePresenter presenter;

  _GetJokeListUseCaseObserver(this.presenter);

  @override
  void onComplete() {
    presenter.getJokeListOnComplete?.call();
  }

  @override
  void onError(e) {
    presenter.getJokeListOnError?.call(e);
  }

  @override
  void onNext(response) {
    var mapper = UIJokeMapper(); // TODO where to write this mapper ?
    var jokes = response?.jokeList ?? DMJokeList("EmptyList", []);
    presenter.getJokeListOnNext?.call(mapper.mapToPresentation(jokes));
  }
}
