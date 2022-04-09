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

class _SplashScreenState extends ResponsiveViewState<SplashScreen, SplashVM> {
  _SplashScreenState() : super(SplashVM());

  FlutterLogo flutterLogo() {
    return const FlutterLogo(
      size: 160,
    );
  }

  ViewModelWidgetBuilder<SplashVM> pressMeButton() {
    return ViewModelWidgetBuilder<SplashVM>(builder: (context, controller) {
      return PraxisButton(
        title: !controller.pressed ? "Press Me!" : "You Pressed me! woo hoo!",
        onPressed: () {
          controller.press(!controller.pressed);
        },
      );
    });
  }

  PraxisButton loginButton() {
    return PraxisButton(
      title: "Login ?",
      onPressed: () {
        context.go(loginRoute);
      },
    );
  }

  Text praxisPlayground() => const Text("Welcome to Praxis Playground");

  @override
  Widget get desktopView => PraxisScaffold(
      androidAppBar: AppBar(
        title: praxisPlayground(),
      ),
      iosNavBar: CupertinoNavigationBar(
        middle: praxisPlayground(),
      ),
      body: Center(
        child: Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            flutterLogo(),
            Column(children: [
              pressMeButton(),
              verticalSpace(),
              loginButton()
            ],)
          ],
        ),
      ));

  @override
  Widget get mobileView => PraxisScaffold(
      androidAppBar: AppBar(
        title: praxisPlayground(),
      ),
      iosNavBar: CupertinoNavigationBar(
        middle: praxisPlayground(),
      ),
      body: Center(
        child:  Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            flutterLogo(),
            verticalSpace(),
            pressMeButton(),
            verticalSpace(),
            loginButton()
          ],
        ),
      ));

  @override
  Widget get tabletView => PraxisScaffold(
      androidAppBar: AppBar(
        title: praxisPlayground(),
      ),
      iosNavBar: CupertinoNavigationBar(
        middle: praxisPlayground(),
      ),
      body: Center(
        child: Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            flutterLogo(),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                pressMeButton(),
                verticalSpace(),
                loginButton()
              ],
            )
          ],
        ),
      ));

  SizedBox verticalSpace() {
    return const SizedBox(
              height: 24,
            );
  }

  @override
  Widget get watchView => Container();
}
