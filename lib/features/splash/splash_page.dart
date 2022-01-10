import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:praxis_flutter/application/widgets/platform_button.dart';
import 'package:praxis_flutter/application/widgets/platform_scaffold.dart';
import 'package:praxis_flutter/features/splash/splash_cubit.dart';
import 'package:praxis_flutter/routing/routes.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PraxisScaffold(
        body: Center(
      child: buildBlocBuilder(),
    ));
  }

  BlocBuilder<SplashCubit, bool> buildBlocBuilder() {
    return BlocBuilder<SplashCubit, bool>(builder: (context, isPressed) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const FlutterLogo(
            size: 160,
          ),
          PraxisButton(
            title: !isPressed ? "Press Me!" : "Pressed me! woo hoo!",
            onPressed: () {
              context.read<SplashCubit>().press(!isPressed);
            },
          ),
          PraxisButton(
            title: "Login ?",
            onPressed: () {
              context.go(loginRoute);
            },
          )
        ],
      );
    });
  }
}
