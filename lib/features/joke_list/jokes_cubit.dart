import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';
import 'package:praxis_flutter/ui/model/jokes/ui_joke.dart';
import 'package:praxis_flutter/ui/model/jokes/ui_jokes_mapper.dart';
import 'package:praxis_flutter_domain/entities/jokes/dm_joke_list.dart';
import 'package:praxis_flutter_domain/use_cases/get_five_random_jokes_usecase.dart';

part 'jokes_state.dart';

class JokesCubit extends Cubit<JokesState> {
  GetFiveRandomJokesUseCase getFiveRandomJokesUseCase =
      GetIt.instance.get<GetFiveRandomJokesUseCase>();

  JokesCubit() : super(JokesInitial()){
    loadJokes();
  }

  void loadJokes() {
    emit(JokesLoading());
    getFiveRandomJokesUseCase.perform(handleResponse, error, complete);
  }

  void handleResponse(GetJokeListUseCaseResponse? response) {
    var jokes = response?.jokeList ?? DMJokeList("EmptyList", []);
    final uiJokes = GetIt.instance.get<UIJokeMapper>().mapToPresentation(jokes);
    emit(JokesLoaded(uiJokes));
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
