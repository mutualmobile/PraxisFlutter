import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:praxis_flutter_domain/entities/login_request.dart';
import 'package:praxis_flutter_domain/entities/login_result.dart';
import 'package:praxis_flutter_domain/repositories/login_repo.dart';
import 'package:praxis_flutter_domain/use_cases/login_use_case.dart';

import 'login_use_case_should.mocks.dart';

@GenerateMocks([LoginRepo])
void main() {
  late MockLoginRepo _mockLoginRepo;
  late LoginUseCase _sut;

  setUp(
    () {
      _mockLoginRepo = MockLoginRepo();
      _sut = LoginUseCase(_mockLoginRepo);
    },
  );

  test(
    "return login result on valid email and password",
    () {
      when(_mockLoginRepo.login("testUsername", "testPassword"))
          .thenAnswer((_) async => const LoginResult("testJwt", "testToken"));

      _sut.perform((event) {
        if (event != null) {
          expect(event, const LoginResult("testJwt", "testToken"));
        }
      }, (Object error) {}, () {},
          LoginRequest("testUsername", "testPassword"));
    },
  );
}
