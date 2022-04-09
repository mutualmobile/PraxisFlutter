import 'dart:async';

import 'package:clean_architecture/clean_architecture.dart';
import 'package:praxis_flutter_domain/entities/login_request.dart';
import 'package:praxis_flutter_domain/entities/login_result.dart';
import 'package:praxis_flutter_domain/repositories/login_repo.dart';

class LoginUseCase extends UseCase<LoginResult, LoginRequest> {

  final LoginRepo _loginRepo;

  LoginUseCase(this._loginRepo);

  @override
  Future<Stream<LoginResult?>> buildUseCaseStream(LoginRequest? params) async {
    final controller = StreamController<LoginResult>();
    try {
      final loginResult = await _loginRepo.login(params?.username, params?.password);
      // Adding it triggers the .onNext() in the `Observer`
      controller.add(loginResult);
      logger.finest('LoginResult successful.');
      controller.close();
    } catch (e) {
      logger.severe('LoginResult unsuccessful.');
      controller.addError(e);
    }
    return controller.stream;
  }
}
