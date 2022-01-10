import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class SplashController extends Controller {
  bool pressed = false;

  @override
  void initListeners() {

  }

  void press(bool isPressed) {
    pressed = isPressed;
    refreshUI();
  }
}
