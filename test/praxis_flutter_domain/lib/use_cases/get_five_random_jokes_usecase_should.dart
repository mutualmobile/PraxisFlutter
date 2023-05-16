import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:praxis_data/sources/network/exceptions/api_exception.dart';
import 'package:praxis_flutter_domain/entities/api_response.dart'
    as api_response;
import 'package:praxis_flutter_domain/entities/jokes/dm_joke_list.dart';
import 'package:praxis_flutter_domain/repositories/jokes/jokes_repository.dart';
import 'package:praxis_flutter_domain/use_cases/get_five_random_jokes_usecase.dart';

import 'get_five_random_jokes_usecase_should.mocks.dart';

@GenerateMocks([JokesRepository])
void main() {
  late MockJokesRepository _mockJokesRepo;
  late GetFiveRandomJokesUseCase _sut;

  setUp(
    () {
      _mockJokesRepo = MockJokesRepository();
      _sut = GetFiveRandomJokesUseCase(_mockJokesRepo);
    },
  );

  test(
    "return five random jokes on success API response",
    () async {
      var testApiResponse =
          api_response.Success(data: JokesListWithType("testType", []));

      when(_mockJokesRepo.getFiveRandomJokes())
          .thenAnswer((realInvocation) async => testApiResponse);

      _sut.perform((data) {
        if (data != null) {
          expect(data.jokeList, testApiResponse);
        }
      }, (Object error) {}, () {});
    },
  );

  test(
    "return error on failure API response",
    () async {
      var testApiResponse = api_response.Failure<JokesListWithType>(
          error: APIException("testException", 404, "testStatus"));

      when(_mockJokesRepo.getFiveRandomJokes())
          .thenAnswer((realInvocation) async => testApiResponse);

      _sut.perform((data) {
        if (data != null) {
          expect(
              ((data.jokeList as api_response.Failure<JokesListWithType>).error
                      as APIException)
                  .statusCode,
              404);
        }
      }, (Object error) {}, () {});
    },
  );
}
