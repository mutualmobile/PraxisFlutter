import 'package:clean_architecture/clean_architecture.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:praxis/src/app/screens/screens.dart';

class SplashController extends Controller {

  AnimationController animationController;
  Animation<double> animation;

  @override
  void initListeners() {}

  initLogoAnimation(TickerProvider tickerProvider) {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 1500),
        vsync: tickerProvider,
        value: 0,
        lowerBound: 0,
        upperBound: 1
    );
    animation = CurvedAnimation(parent: animationController, curve: Curves.linear);
    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        homeScreen();
      }
    });
    animationController.forward();
  }

  void homeScreen() {
    Navigator.of(getContext()).pushReplacementNamed(Screens.home);
  }
}