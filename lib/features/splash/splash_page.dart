import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:clean_architecture/clean_architecture.dart';
import 'package:go_router/go_router.dart';
import 'package:praxis_flutter/features/splash/splash_vm.dart';
import 'package:praxis_flutter/presentation/core/widgets/platform_button.dart';
import 'package:praxis_flutter/presentation/core/widgets/platform_scaffold.dart';
import 'package:praxis_flutter/routing/routes.dart';

class SplashScreen extends View {
  SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends ViewState<SplashScreen, SplashVM> {
  _SplashScreenState() : super(SplashVM());

  @override
  Widget get view => PraxisScaffold(
      androidAppBar: AppBar(title: praxisPlayground(),),
      iosNavBar: CupertinoNavigationBar(middle: praxisPlayground(),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const FlutterLogo(
              size: 160,
            ),
            ControlledWidgetBuilder<SplashVM>(
                builder: (context, controller) {
              return PraxisButton(
                title:
                    !controller.pressed ? "Press Me!" : "You Pressed me! woo hoo!",
                onPressed: () {
                  controller.press(!controller.pressed);
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

  Text praxisPlayground() => const Text("Welcome to Praxis Playground");
}
