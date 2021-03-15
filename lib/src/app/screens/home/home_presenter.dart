
import 'package:clean_architecture/clean_architecture.dart';
import 'package:praxis/src/domain/usecases/get_five_random_jokes_usecase.dart';

class HomePresenter extends Presenter {
  Function getJokeListOnNext;
  Function getJokeListOnComplete;
  Function getJokeListOnError;

  final GetFiveRandomJokesUseCase getFiveRandomJokesUseCase;
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
    assert(presenter.getJokeListOnComplete != null);
    presenter.getJokeListOnComplete();
  }

  @override
  void onError(e) {
    assert(presenter.getJokeListOnError != null);
    presenter.getJokeListOnError(e);
  }

  @override
  void onNext(response) {
    assert(presenter.getJokeListOnNext != null);
    presenter.getJokeListOnNext(response.jokeList);
  }
}