import 'package:praxis_data/mapper/entity_mapper.dart';
import 'package:praxis_data/models/jokes/dt_joke.dart';
import 'package:praxis_data/models/jokes/dt_joke_list.dart';
import 'package:praxis_flutter_domain/entities/jokes/dm_joke_list.dart';
import 'package:praxis_flutter_domain/entities/jokes/dm_joke.dart';


class JokesListMapper extends EntityMapper<DMJokeList, DTJokeList> {

  JokeMapper jokeMapper;

  JokesListMapper(this.jokeMapper);

  @override
  DTJokeList mapToData(DMJokeList model) {
    return DTJokeList(model.type,
        model.jokeList.map((e) => jokeMapper.mapToData(e)).toList());
  }

  @override
  DMJokeList mapToDomain(DTJokeList entity) {
    return DMJokeList(entity.type,
        entity.jokeList.map((e) => jokeMapper.mapToDomain(e)).toList());
  }
}


class JokeMapper extends EntityMapper<DMJoke, DTJoke> {
  @override
  DTJoke mapToData(DMJoke model) {
    return DTJoke(model.id, model.joke);
  }

  @override
  DMJoke mapToDomain(DTJoke entity) {
    return DMJoke(entity.id, entity.joke);
  }

}