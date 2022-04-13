import 'package:injectable/injectable.dart';
import 'package:praxis_flutter/ui/model/jokes/ui_joke.dart';
import 'package:praxis_flutter_domain/mapper/ui_model_mapper.dart';
import 'package:praxis_flutter_domain/entities/jokes/dm_joke_list.dart';
import 'package:praxis_flutter_domain/entities/jokes/dm_joke.dart';

@injectable
class UIJokeMapper extends UiModelMapper<JokesListWithType, UIJokeList> {
  @override
  JokesListWithType mapToDomain(UIJokeList modelItem) {
    return JokesListWithType(modelItem.type,
        modelItem.jokes.map((e) => Joke(e.id, e.joke)).toList());
  }

  @override
  UIJokeList mapToPresentation(JokesListWithType model) {
    return UIJokeList(
        model.type, model.jokeList.map((e) => UiJoke(e.id, e.joke)).toList());
  }
}
