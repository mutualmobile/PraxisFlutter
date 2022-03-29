import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart' as dio;
import 'package:logger/logger.dart';
import 'package:praxis_data/network/exceptions/api_exception.dart';

class HttpHelper {
  /// [url] can either be a `string` or a `Uri`.
  /// The [type] can be any of the [RequestType]s.
  /// [body] and [encoding] only apply to [RequestType.post] and [RequestType.put] requests. Otherwise, they have no effect.
  /// This is optimized for requests that anticipate a response body of type `Map<String, dynamic>`, as in a json file-type response.
  static Future<Map<String, dynamic>> invokeHttp(dynamic url, RequestType type,
      {Map<String, String>? headers, dynamic body}) async {
    dio.Response response;
    try {
      response =
          await _invoke(url.toString(), type, headers: headers, body: body);
    } catch (error) {
      rethrow;
    }
    return response.data;
  }

  /// [url] can either be a `string` or a `Uri`.
  /// The [type] can be any of the [RequestType]s.
  /// [body] and [encoding] only apply to [RequestType.post] and [RequestType.put] requests. Otherwise, they have no effect.
  /// This is optimized for requests that anticipate a response body of type `List<dynamic>`, as in a list of json objects.
  static Future<List<dynamic>> invokeHttp2(dynamic url, RequestType type,
      {Map<String, String>? headers, dynamic body}) async {
    dio.Response? response;
    List<dynamic> responseBody;
    try {
      response =
          await _invoke(url.toString(), type, headers: headers, body: body);
    } on APIException {
      rethrow;
    } on SocketException {
      rethrow;
    } catch (exception) {
      print("Exception is: $exception");
    }

    responseBody = jsonDecode(response?.data);
    return responseBody;
  }

  static Future<dio.Response> _invoke(dynamic url, RequestType type,
      {Map<String, String>? headers, dynamic body}) async {
    dio.Response response;
    dio.Dio client = dio.Dio();
    final Logger logger = Logger();
    try {
      switch (type) {
        case RequestType.get:
          response =
              await client.get(url, options: dio.Options(headers: headers));
          break;
        case RequestType.post:
          response = await client.post(url,
              options: dio.Options(headers: headers), data: body);
          break;
        case RequestType.put:
          response = await client.put(url,
              options: dio.Options(headers: headers), data: body);
          break;
        case RequestType.delete:
          response =
              await client.delete(url, options: dio.Options(headers: headers));
          break;
      }

      if (response.statusCode != 200) {
        Map<String, dynamic> body = jsonDecode(response.data);
        throw APIException(
            body['message'], response.statusCode ?? 0, body['statusText']);
      }
      return response;
    } catch (error) {
      logger.e("Caught error!", error);
      rethrow;
    }
  }
}

enum RequestType { get, post, put, delete }
