import 'dart:async';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:praxis_flutter_domain/entities/jokes/joke_list.dart';
import 'package:praxis_flutter_domain/repositories/jokes/jokes_repository.dart';

class GetFiveRandomJokesUseCase extends UseCase<GetJokeListUseCaseResponse, void> {

  final JokesRepository jokesRepository;
  GetFiveRandomJokesUseCase(this.jokesRepository);

  @override
  Future<Stream<GetJokeListUseCaseResponse>> buildUseCaseStream(void params) async {
    final controller = StreamController<GetJokeListUseCaseResponse>();
    try {
      final jokeList = await jokesRepository.getFiveRandomJokes();
      // Adding it triggers the .onNext() in the `Observer`
      controller.add(GetJokeListUseCaseResponse(jokeList));
      logger.finest('GetFiveRandomJokesUseCase successful.');
      controller.close();
    } catch (e) {
      logger.severe('GetUserUseCase unsuccessful.');
      controller.addError(e);
    }
    return controller.stream;
  }
}

class GetJokeListUseCaseResponse {
  final JokeList jokeList;
  GetJokeListUseCaseResponse(this.jokeList);
}