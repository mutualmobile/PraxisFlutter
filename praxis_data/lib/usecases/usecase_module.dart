import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:praxis_flutter_domain/use_cases/login_use_case.dart';

@module
abstract class UseCaseModule {
  LoginUseCase get loginUseCase => LoginUseCase(GetIt.instance.get());
}
