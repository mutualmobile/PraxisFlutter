import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:praxis_flutter/features/splash/splash_providers.dart';
import 'package:praxis_flutter/presentation/core/widgets/platform_button.dart';
import 'package:praxis_flutter/presentation/core/widgets/platform_scaffold.dart';
import 'package:praxis_flutter/routing/routes.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PraxisScaffold(
        androidAppBar: AppBar(
          title: praxisPlayground(),
        ),
        iosNavBar: CupertinoNavigationBar(
          middle: praxisPlayground(),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const FlutterLogo(
                size: 160,
              ),
              Consumer(builder: (context, ref, child) {
                final isPressed = ref.watch(isPressedProvider.state).state;
                return PraxisButton(
                  title: !isPressed ? "Press Me!" : "You Pressed me! woo hoo!",
                  onPressed: () {
                    var refState = ref.read(isPressedProvider.state);
                    refState.state = !isPressed;
                  },
                );
              }),
              PraxisButton(
                title: "Login ?",
                onPressed: () {
                  context.go(loginRoute);
                },
              )
            ],
          ),
        ));
  }

  Text praxisPlayground() => const Text("Welcome to Praxis Playground");
}
