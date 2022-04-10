import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:praxis_flutter_domain/entities/login_request.dart';
import 'package:praxis_flutter_domain/entities/login_result.dart';
import 'package:praxis_flutter_domain/use_cases/login_use_case.dart';
import 'package:praxis_flutter_domain/validations.dart';

class LoginCubit extends Cubit<LoginState> {
  final loginController = TextEditingController(text: 'random@gmail.com');
  final passwordController = TextEditingController(text: 'random');

  final LoginUseCase loginUseCase = GetIt.instance.get<LoginUseCase>();

  LoginCubit() : super(LoginInitial());

  void login() {
    emit(LoginInProcess());
    loginUseCase.perform(
        handleResponse,
        error,
        complete,
        LoginRequest(
            loginController.value.text, passwordController.value.text));
  }

  void handleResponse(LoginResult? response) {
    emit(LoginSuccess(response));
  }

  void complete() {
    emit(LoginComplete());
  }

  error(e) {
    emit(LoginFailed(e));
  }

  @override
  Future<void> close() {
    loginUseCase.dispose();
    return super.close();
  }
}

@immutable
abstract class LoginState {}

class LoginInitial implements LoginState {}

class LoginInProcess implements LoginState {}

class LoginSuccess implements LoginState {
  final LoginResult? loginResult;

  LoginSuccess(this.loginResult);
}

class LoginFailed implements LoginState {
  final Exception exception;

  LoginFailed(this.exception);
}

class LoginComplete implements LoginState {}
