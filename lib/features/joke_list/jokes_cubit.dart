import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:praxis_flutter/models/ui_state.dart';
import 'package:praxis_flutter/ui/model/jokes/ui_joke.dart';
import 'package:praxis_flutter/ui/model/jokes/ui_jokes_mapper.dart';
import 'package:praxis_flutter_domain/entities/jokes/dm_joke_list.dart';
import 'package:praxis_flutter_domain/use_cases/get_five_random_jokes_usecase.dart';

class JokesCubit extends Cubit<UiState<UIJokeList>> {
  GetFiveRandomJokesUseCase getFiveRandomJokesUseCase =
      GetIt.instance.get<GetFiveRandomJokesUseCase>();

  JokesCubit() : super(Initial()) {
    loadJokes();
  }

  void loadJokes() {
    emit(Loading());
    getFiveRandomJokesUseCase.perform(handleResponse, error, complete);
  }

  void handleResponse(GetJokeListUseCaseResponse? response) {
    var jokes = response?.jokeList ?? DMJokeList("EmptyList", []);
    final uiJokes = GetIt.instance.get<UIJokeMapper>().mapToPresentation(jokes);
    emit(Success(data: uiJokes));
  }

  void complete() {}

  error(e) {
    emit(Failure(exception: e));
  }

  @override
  Future<void> close() {
    getFiveRandomJokesUseCase.dispose();
    return super.close();
  }
}
