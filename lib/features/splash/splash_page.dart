import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:go_router/go_router.dart';
import 'package:praxis_flutter/application/widgets/platform_button.dart';
import 'package:praxis_flutter/application/widgets/platform_scaffold.dart';
import 'package:praxis_flutter/features/splash/splash_controller.dart';
import 'package:praxis_flutter/routing/routes.dart';

class SplashScreen extends View {
  SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends ViewState<SplashScreen, SplashController> {
  _SplashScreenState() : super(SplashController());

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
            ControlledWidgetBuilder<SplashController>(
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
