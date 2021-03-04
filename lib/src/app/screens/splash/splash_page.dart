import 'package:flutter/material.dart';
import 'dart:developer';
import 'package:flutter/widgets.dart';
import 'package:clean_architecture/clean_architecture.dart';
import 'splash_controller.dart';
import 'package:logging/logging.dart';

class SplashPage extends View {
  SplashPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends ViewState<SplashPage, SplashController> with TickerProviderStateMixin {
  _SplashPageState() : super(SplashController());

  @override
  void initState() {
    super.initState();
    controller.initLogoAnimation(this);
  }

  @override
  Widget get view {
    return Scaffold(
      key:
        globalKey,
      body: new Container(
        color: Color.fromRGBO(44, 62, 80, 1.0),
        child: Center(
          child: ControlledWidgetBuilder<SplashController>(builder: (context, controller) {
            return FadeTransition(
              opacity: controller.animation,
              child: Image.asset("assets/logo.png"),
            );
          })
        ),
      ),
    );
  }
}