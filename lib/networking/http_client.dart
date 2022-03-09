import 'dart:io';

import 'package:dio/dio.dart';
import 'package:turistycle/common/config.dart';

class HttpClient {
  static final HttpClient _instance = HttpClient._internal();
  bool external = false;

  factory HttpClient() => _instance;

  final Dio _dioClient = Dio();

  HttpClient._internal() {
    _handleRequest();
    _dioClient.options.baseUrl = Config.API_URL;
  }

  Future<Response> get(url,
      {Map<String, dynamic>? headers,
      Map<String, dynamic>? queryParams}) async {
    return _dioClient.get(url, options: Options(headers: headers));
  }

  Future<Response> post(url,
      {Map<String, dynamic>? headers,
      Map<String, dynamic>? queryParams,
      Map<String, dynamic>? body}) async {
    return _dioClient.post(url,
        data: body == null ? null : encodeMappedBody(body),
        options: Options(headers: headers));
  }

  String encodeMappedBody(Map<String, dynamic> params) {
    return params.keys
        .map((key) =>
            "${Uri.encodeComponent(key)}=${Uri.encodeComponent(params[key])}")
        .join('&');
  }

  _handleRequest() {
    _dioClient.interceptors.add(
        InterceptorsWrapper(onRequest: (RequestOptions options, handler) async {
      options.headers[HttpHeaders.acceptHeader] = "application/json";
      return handler.next(options);
    }, onResponse: (Response response, handler) async {
      return handler.next(response);
    }, onError: (error, handler) async {
      return handler.next(error);
    }));
  }
}
