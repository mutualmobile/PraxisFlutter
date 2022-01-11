import 'package:praxis_flutter_domain/entities/login_result.dart';
import 'package:praxis_flutter_domain/repositories/login_repo.dart';

class PraxisLoginRepo extends LoginRepo {
  @override
  Future<LoginResult> login(String username, String password) async {
    await Future.delayed(const Duration(seconds: 3));
    return const LoginResult("some jwt", "some refresh token");
  }
}
