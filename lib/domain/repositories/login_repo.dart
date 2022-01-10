import 'package:praxis_flutter/domain/entities/login_result.dart';

abstract class LoginRepo {
  Future<LoginResult> login(String username, String password);
}
