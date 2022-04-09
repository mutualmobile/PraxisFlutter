// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:praxis_flutter_domain/repositories/jokes/jokes_repository.dart'
    as _i4;
import 'package:praxis_flutter_domain/repositories/login_repo.dart' as _i6;
import 'package:praxis_flutter_domain/use_cases/login_use_case.dart' as _i8;

import 'mapper/jokes/jokes_mappers.dart' as _i3;
import 'repositories/jokes/data_jokes_repository.dart' as _i5;
import 'repositories/pr_login_repo.dart' as _i7;
import 'usecases/usecase_module.dart'
    as _i9; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// an extension to register the provided dependencies inside of [GetIt]
extension GetItInjectableX on _i1.GetIt {
  /// initializes the registration of provided dependencies inside of [GetIt]
  _i1.GetIt $initGetIt(
      {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
    final gh = _i2.GetItHelper(this, environment, environmentFilter);
    final useCaseModule = _$UseCaseModule();
    gh.factory<_i3.JokeMapper>(() => _i3.JokeMapper());
    gh.factory<_i3.JokesListMapper>(
        () => _i3.JokesListMapper(get<_i3.JokeMapper>()));
    gh.factory<_i4.JokesRepository>(
        () => _i5.DataJokesRepository(get<_i3.JokesListMapper>()));
    gh.factory<_i6.LoginRepo>(() => _i7.PraxisLoginRepo());
    gh.factory<_i8.LoginUseCase>(() => useCaseModule.loginUseCase);
    return this;
  }
}

class _$UseCaseModule extends _i9.UseCaseModule {}
