import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:praxis_flutter/features/login/login_cubit.dart';
import 'package:praxis_flutter/l10n/l10n.dart';
import 'package:praxis_flutter/models/ui_state.dart';
import 'package:praxis_flutter/presentation/core/extensions/widget_extensions.dart';
import 'package:praxis_flutter/presentation/core/widgets/platform_button.dart';
import 'package:praxis_flutter/presentation/core/widgets/platform_dialog.dart';
import 'package:praxis_flutter/presentation/core/widgets/platform_progress_bar.dart';
import 'package:praxis_flutter/presentation/core/widgets/platform_scaffold.dart';
import 'package:praxis_flutter/presentation/core/widgets/platform_text_field.dart';
import 'package:praxis_flutter/routing/routes.dart';
import 'package:praxis_flutter_domain/entities/login_result.dart';
import 'package:praxis_flutter_domain/validations.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LoginCubit(),
      child: BlocListener<LoginCubit, UiState<LoginResult>>(
        child: PraxisScaffold(
          body: SafeArea(child: buildColumn(context)),
          iosNavBar: CupertinoNavigationBar(
            middle: title(),
          ),
          androidAppBar: AppBar(
            title: title(),
          ),
        ),
        listener: (BuildContext context, state) {
          if (state is Failure) {
            print("Reaching in failure with value: ${(state as Failure).exception}");
            if ((state as Failure).exception is EmailValidationException) {
              showAlertDialog(
                  context: context,
                  title: context.l10n.emailErrorTitle,
                  content: context.l10n.emailErrorMessage,
                  defaultActionText: "OK");
            }
            if ((state as Failure).exception is PasswordTooShortException) {
              showAlertDialog(
                  context: context,
                  title: context.l10n.passwordErrorTitle,
                  content: context.l10n.passwordErrorMessage,
                  defaultActionText: "OK");
            }
          } else if (state is Success) {
            context.go(homeRoute);
          }
        },
      ),
    );
  }

  Text title() => const Text("Login");

  Widget buildColumn(BuildContext context) {
    return BlocBuilder<LoginCubit, UiState<LoginResult>>(
        builder: (context, selected) {
      return Column(
        children: [
          const FlutterLogo(
            size: 120,
          ).paddingAll(24),
          PraxisTextField(
            hintText: "Username",
            controller: context.read<LoginCubit>().loginController,
          ).paddingAll(8),
          PraxisTextField(
            hintText: "Password",
            obscureText: true,
            controller: context.read<LoginCubit>().passwordController,
          ).paddingAll(8),
          loginButton(context).paddingAll(8)
        ],
      );
    });
  }

  Widget loginButton(BuildContext context) {
    return BlocBuilder<LoginCubit, UiState<LoginResult>>(
        builder: (context, selected) {
      if (selected is Loading) {
        return const PraxisProgressBar();
      }
      return PraxisButton(
          title: "Login",
          onPressed: () {
            context.read<LoginCubit>().login();
          });
    });
  }
}
