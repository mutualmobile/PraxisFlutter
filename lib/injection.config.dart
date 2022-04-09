// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:praxis_flutter_domain/use_cases/login_use_case.dart' as _i4;

import 'features/login/login_vm.dart' as _i3;
import 'infrastructure/notifications/firebase_messaging.dart'
    as _i5; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// an extension to register the provided dependencies inside of [GetIt]
extension GetItInjectableX on _i1.GetIt {
  /// initializes the registration of provided dependencies inside of [GetIt]
  _i1.GetIt $initGetIt(
      {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
    final gh = _i2.GetItHelper(this, environment, environmentFilter);
    gh.factory<_i3.LoginVM>(() => _i3.LoginVM(get<_i4.LoginUseCase>()));
    gh.factory<_i5.PraxisFirebaseMessaging>(
        () => _i5.PraxisFirebaseMessaging());
    return this;
  }
}
