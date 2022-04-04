import 'package:clean_architecture/clean_architecture.dart';

class SplashVM extends ViewModel {
  bool pressed = false;

  @override
  void initListeners() {

  }

  void press(bool isPressed) {
    pressed = isPressed;
    refreshUI();
  }
}
