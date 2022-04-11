import 'package:praxis_flutter_domain/validator.dart';
import 'package:praxis_flutter_domain/validations.dart';

class LoginRequest implements Validator {
  String email;
  String password;

  LoginRequest(this.email, this.password);

  @override
  bool isValid() {
    if (!email.isValidEmail()) {
      throw EmailValidationException();
    }
    if (password.length < 6) {
      throw PasswordTooShortException();
    }
    return true;
  }
}
