import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:praxis_flutter/presentation/core/widgets/platform_button.dart';
import 'package:praxis_flutter/presentation/core/widgets/platform_scaffold.dart';
import 'package:praxis_flutter/presentation/core/widgets/platform_text_field.dart';
import 'package:praxis_flutter/presentation/core/extensions/widget_extensions.dart';
import 'package:praxis_flutter/routing/routes.dart';


class LoginPage extends StatelessWidget {
  final loginController = TextEditingController(text: 'random');
  final passwordController = TextEditingController(text: 'random');

  LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PraxisScaffold(
      body: SafeArea(child: buildColumn(context)),
      iosNavBar: CupertinoNavigationBar(
        middle: title(),
      ),
      androidAppBar: AppBar(
        title: title(),
      ),
    );
  }

  Text title() => const Text("Login");

  Column buildColumn(BuildContext context) {
    return Column(
      children: [
        const FlutterLogo(
          size: 120,
        ).paddingAll(24),
        PraxisTextField(
          hintText: "Username",
          controller: loginController,
        ).paddingAll(8),
        PraxisTextField(
          hintText: "Password",
          obscureText: true,
          controller: passwordController,
        ).paddingAll(8),
        loginButton(context)
      ],
    );
  }

  Widget loginButton(BuildContext context) {
    return PraxisButton(
        title: "Login",
        onPressed: () {
          context.go(homeRoute);
        });
  }
}
