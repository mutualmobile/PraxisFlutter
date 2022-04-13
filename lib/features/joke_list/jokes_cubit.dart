import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:praxis_flutter/models/ui_state.dart';
import 'package:praxis_flutter/ui/model/jokes/ui_joke.dart';
import 'package:praxis_flutter/ui/model/jokes/ui_jokes_mapper.dart';
import 'package:praxis_flutter_domain/entities/api_response.dart'
    as api_response;
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
    final useCaseResponseJokes = response?.jokeList;
    if (useCaseResponseJokes == null) {
      emit(Failure(Exception("Couldn't fetch jokes!")));
    } else {
      if (useCaseResponseJokes is api_response.Failure) {
        emit(Failure(
            (useCaseResponseJokes as api_response.Failure).error));
      } else if (useCaseResponseJokes is api_response.Success) {
        var jokes = (useCaseResponseJokes as api_response.Success);
        final uiJokes =
        GetIt.instance.get<UIJokeMapper>().mapToPresentation(jokes.data);
        emit(Success(uiJokes));
      }
    }
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
