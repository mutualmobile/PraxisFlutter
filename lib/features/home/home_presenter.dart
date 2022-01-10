import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:praxis_flutter/domain/use_cases/get_five_random_jokes_usecase.dart';

class HomePresenter extends Presenter {
  Function? getJokeListOnNext;
  Function? getJokeListOnComplete;
  Function? getJokeListOnError;

  late GetFiveRandomJokesUseCase getFiveRandomJokesUseCase;

  HomePresenter(jokesRepo)
      : getFiveRandomJokesUseCase = GetFiveRandomJokesUseCase(jokesRepo);

  void getJokeList() {
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
    presenter.getJokeListOnNext?.call(response?.jokeList);
  }
}
