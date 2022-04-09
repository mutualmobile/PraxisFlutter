import 'package:clean_architecture/clean_architecture.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:praxis_flutter/features/login/login_vm.dart';
import 'package:praxis_flutter/presentation/core/widgets/platform_button.dart';
import 'package:praxis_flutter/presentation/core/widgets/platform_progress_bar.dart';
import 'package:praxis_flutter/presentation/core/widgets/platform_scaffold.dart';
import 'package:praxis_flutter/presentation/core/widgets/platform_text_field.dart';
import 'package:praxis_flutter/presentation/core/extensions/widget_extensions.dart';
import 'package:praxis_flutter/routing/routes.dart';
import 'package:praxis_flutter_domain/use_cases/login_use_case.dart';

class LoginPage extends View {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ViewState<LoginPage, LoginVM> {
  _LoginPageState() : super(GetIt.instance.get());

  @override
  Widget get view => PraxisScaffold(
        key: globalKey,
        body: SafeArea(child: buildColumn(context)),
        iosNavBar: CupertinoNavigationBar(
          middle: title(),
        ),
        androidAppBar: AppBar(
          title: title(),
        ),
      );

  Text title() => const Text("Login");

  Widget buildColumn(BuildContext context) {
    return ViewModelWidgetBuilder<LoginVM>(builder: (context, viewModel) {
      return Column(
        children: [
          const FlutterLogo(
            size: 120,
          ).paddingAll(24),
          PraxisTextField(
            hintText: "Username",
            controller: viewModel.loginController,
          ).paddingAll(8),
          PraxisTextField(
            hintText: "Password",
            obscureText: true,
            controller: viewModel.passwordController,
          ).paddingAll(8),
          loginButton(context).paddingAll(8)
        ],
      );
    });
  }

  Widget loginButton(BuildContext context) {
    return ViewModelWidgetBuilder<LoginVM>(
      builder: (context, viewModel) {
        if (viewModel.isLoading) {
          return const PraxisProgressBar();
        }
        return PraxisButton(
            title: "Login",
            onPressed: () {
              viewModel.login();
            });
      },
    );
  }
}
