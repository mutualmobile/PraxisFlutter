import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';
import 'package:praxis_flutter/ui/model/jokes/ui_joke.dart';
import 'package:praxis_flutter/ui/model/jokes/ui_jokes_mapper.dart';
import 'package:praxis_flutter_domain/entities/api_response.dart'
    as api_response;
import 'package:praxis_flutter_domain/use_cases/get_five_random_jokes_usecase.dart';

part 'jokes_state.dart';

class JokesCubit extends Cubit<JokesState> {
  GetFiveRandomJokesUseCase getFiveRandomJokesUseCase =
      GetIt.instance.get<GetFiveRandomJokesUseCase>();

  JokesCubit() : super(JokesInitial()) {
    loadJokes();
  }

  void loadJokes() {
    emit(JokesLoading());
    getFiveRandomJokesUseCase.perform(handleResponse, error, complete);
  }

  void handleResponse(GetJokeListUseCaseResponse? response) {
    final useCaseResponseJokes = response?.jokeList;
    if (useCaseResponseJokes == null) {
      emit(JokesException(Exception("Couldn't fetch jokes!")));
    } else {
      if (useCaseResponseJokes is api_response.Failure) {
        emit(JokesException(
            (useCaseResponseJokes as api_response.Failure).error));
      } else if (useCaseResponseJokes is api_response.Success) {
        var jokes = (useCaseResponseJokes as api_response.Success);
        final uiJokes =
            GetIt.instance.get<UIJokeMapper>().mapToPresentation(jokes.data);
        emit(JokesLoaded(uiJokes));
      }
    }
  }

  void complete() {}

  error(e) {
    emit(JokesException(e));
  }

  @override
  Future<void> close() {
    getFiveRandomJokesUseCase.dispose();
    return super.close();
  }
}
