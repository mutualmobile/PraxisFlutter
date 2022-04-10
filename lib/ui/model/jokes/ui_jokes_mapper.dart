import 'package:injectable/injectable.dart';
import 'package:praxis_flutter/ui/model/jokes/ui_joke.dart';
import 'package:praxis_flutter_domain/mapper/ui_model_mapper.dart';
import 'package:praxis_flutter_domain/entities/jokes/dm_joke_list.dart';
import 'package:praxis_flutter_domain/entities/jokes/dm_joke.dart';

@injectable
class UIJokeMapper extends UiModelMapper<DMJokeList, UIJokeList> {
  @override
  DMJokeList mapToDomain(UIJokeList modelItem) {
    return DMJokeList(modelItem.type,
        modelItem.jokes.map((e) => DMJoke(e.id, e.joke)).toList());
  }

  @override
  UIJokeList mapToPresentation(DMJokeList model) {
    return UIJokeList(
        model.type, model.jokeList.map((e) => UiJoke(e.id, e.joke)).toList());
  }
}
