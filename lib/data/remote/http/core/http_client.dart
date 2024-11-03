import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:test_task/utils/log_service.dart';
import 'i_http_client.dart';

@Injectable(as: BaseHttpClient, env: [Environment.dev])
class MHttpClient extends _HttpClient {
  MHttpClient()
      : super(
          Dio(
            BaseOptions(
              baseUrl: 'https://rickandmortyapi.com/api/',
              headers: {
                Headers.contentTypeHeader: Headers.jsonContentType,
              },
            ),
          ),
        );
}

class _HttpClient implements BaseHttpClient {
  final Dio _dio;

  _HttpClient(this._dio) {
    _setInterceptors();
    HttpOverrides.global = MyHttpOverrides();
  }

  @override
  Future get({
    required query,
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
    ProgressCallback? progressCallback,
  }) async {
    return await _sendRequest(_dio.get(
      query,
      queryParameters: queryParameters,
      cancelToken: cancelToken,
      onReceiveProgress: progressCallback,
    ));
  }

  @override
  Future post({
    required query,
    Object? data,
    CancelToken? cancelToken,
  }) async =>
      await _sendRequest(
        _dio.post(
          query,
          data: data,
          cancelToken: cancelToken,
        ),
      );

  @override
  Future put({
    required query,
    Map<String, dynamic>? data,
    CancelToken? cancelToken,
  }) async =>
      await _sendRequest(_dio.put(query, data: data));

  @override
  Future patch({
    required query,
    Map<String, dynamic>? data,
  }) async =>
      await _sendRequest(_dio.patch(query, data: data));

  @override
  Future fetch(RequestOptions requestOptions) async =>
      await _sendRequest(_dio.fetch(requestOptions));

  @override
  Future delete({
    required query,
    Map<String, dynamic>? data,
  }) async =>
      await _sendRequest(_dio.delete(query, data: data));

  Future _sendRequest(Future<Response> request) async {
    final Response response = await request.catchError(
      (error) {
        throw error;
      },
    );
    return response.data;
  }

  Future<void> _setInterceptors() async {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: onRequest,
        onResponse: onResponse,
        onError: onError,
      ),
    );
  }

  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) {
    println("[ ${DateTime.now().toUtc()} ]"
        "\n---------- DioRequest ----------"
        "\n\turl: ${options.baseUrl}${options.path}"
        "\n\tquery: ${options.queryParameters}"
        "\n\tmethod: ${options.method}"
        "\n\tdata: ${options.data}"
        "\n\theaders: ${options.headers}\n}"
        "\n--------------------------------\n");
    return handler.next(options);
  }

  void onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) {
    final options = response.requestOptions;
    println("[ ${DateTime.now().toUtc()} ]"
        "\n---------- DioResponse ----------"
        "\n\turl: ${options.baseUrl}${options.path}"
        "\n\tmethod: ${options.method}"
        "\n\tresponse: $response"
        "\n--------------------------------\n");
    return handler.next(response);
  }

  void onError(DioException error, ErrorInterceptorHandler handler) async {
    final options = error.requestOptions;
    println("[ ${DateTime.now().toUtc()} ]"
        "\n---------- DioError ----------"
        "\n\turl: ${options.baseUrl}${options.path}"
        "\n\tmethod: ${options.method}"
        "\n\tmessage: ${error.message}"
        "\n\tresponse: ${error.response}"
        "\n\terrorCode: ${error.response?.statusCode}"
        "\n--------------------------------\n");
    return handler.next(error);
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
