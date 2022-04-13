import 'package:injectable/injectable.dart';
import 'package:praxis_data/mapper/entity_mapper.dart';
import 'package:praxis_data/models/jokes/dt_joke.dart';
import 'package:praxis_data/models/jokes/dt_joke_list.dart';
import 'package:praxis_flutter_domain/entities/jokes/dm_joke_list.dart';
import 'package:praxis_flutter_domain/entities/jokes/dm_joke.dart';

@injectable
class JokesListMapper extends EntityMapper<JokesListWithType, DTJokeList> {
  JokeMapper jokeMapper;

  JokesListMapper(this.jokeMapper);

  @override
  DTJokeList mapToData(JokesListWithType model) {
    return DTJokeList(model.type,
        model.jokeList.map((e) => jokeMapper.mapToData(e)).toList());
  }

  @override
  JokesListWithType mapToDomain(DTJokeList entity) {
    return JokesListWithType(entity.type,
        entity.jokeList.map((e) => jokeMapper.mapToDomain(e)).toList());
  }
}

@injectable
class JokeMapper extends EntityMapper<Joke, DTJoke> {

  @override
  DTJoke mapToData(Joke model) {
    return DTJoke(model.id, model.joke);
  }

  @override
  Joke mapToDomain(DTJoke entity) {
    return Joke(entity.id, entity.joke);
  }
}
