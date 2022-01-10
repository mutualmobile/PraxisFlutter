import 'package:flutter_bloc/flutter_bloc.dart';

class SplashCubit extends Cubit<bool> {
  SplashCubit(state) : super(state);

  void press(bool newState) => emit(newState);
}
