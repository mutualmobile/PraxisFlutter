import 'package:clean_architecture/clean_architecture.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';
import 'package:praxis_flutter/l10n/l10n.dart';
import 'package:praxis_flutter/presentation/core/widgets/platform_dialog.dart';
import 'package:praxis_flutter/routing/routes.dart';
import 'package:praxis_flutter_domain/entities/login_request.dart';
import 'package:praxis_flutter_domain/entities/login_result.dart';
import 'package:praxis_flutter_domain/use_cases/login_use_case.dart';
import 'package:praxis_flutter_domain/validations.dart';

@injectable
class LoginVM extends ViewModel {
  final loginController = TextEditingController(text: 'random');
  final passwordController = TextEditingController(text: 'random');

  LoginUseCase loginUseCase;

  bool isLoading = false;

  LoginVM(this.loginUseCase);

  @override
  void initListeners() {}

  void login() {
    isLoading = true;
    refreshUI();
    loginUseCase.perform(
        handleResponse,
        error,
        complete,
        LoginRequest(
            loginController.value.text, passwordController.value.text));
  }

  void handleResponse(LoginResult? response) {
    getContext().go(homeRoute);
  }

  void complete() {
    isLoading = false;
    refreshUI();
  }

  error(e) {
    if (e is EmailValidationException) {
      showAlertDialog(
          context: getContext(),
          title: getContext().l10n.emailErrorTitle,
          content: getContext().l10n.emailErrorMessage,
          defaultActionText: "OK");
    }
    if (e is PasswordTooShortException) {
      showAlertDialog(
          context: getContext(),
          title: getContext().l10n.passwordErrorTitle,
          content: getContext().l10n.passwordErrorMessage,
          defaultActionText: "OK");
    }
    logger.info(e);
    isLoading = false;
    refreshUI();
  }
}
