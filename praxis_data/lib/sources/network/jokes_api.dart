import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:praxis_data/mapper/jokes/jokes_mappers.dart';
import 'package:praxis_data/sources/network/exceptions/api_exception.dart';
import 'package:praxis_data/sources/network/url.dart';
import 'package:praxis_flutter_domain/entities/api_response.dart';
import 'package:praxis_flutter_domain/entities/jokes/dm_joke_list.dart';

import '../../models/jokes/dt_joke_list.dart';

const String genericApiFailMsg = "Unexpected API response!";

@injectable
class JokesApi {
  final _logger = Logger();
  final dio = Dio();
  final JokesListMapper _mapper;

  JokesApi(this._mapper);

  Future<ApiResponse<DMJokeList>> getFiveRandomJokes() async {
    try {
      final networkResponse = await dio
          .get(Uri.https(URL.baseUrl, URL.fiveRandomJokesPath).toString());
      if (networkResponse.data != null) {
        final parsedDataResponse = DTJokeList.fromJson(networkResponse.data);
        final parsedDomainResponse = _mapper.mapToDomain(parsedDataResponse);
        return Success(data: parsedDomainResponse);
      } else {
        return Failure(
            error: APIException(
                networkResponse.statusMessage ?? genericApiFailMsg,
                networkResponse.statusCode ?? 0,
                networkResponse.statusMessage ?? genericApiFailMsg));
      }
    } on Exception catch (e, _) {
      _logger.e("API Error: ${e.toString()}");
      return Failure(error: e);
    }
  }
}
