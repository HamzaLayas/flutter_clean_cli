import 'dart:io';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../utilities/typedef.dart';

class ApiInterceptor extends Interceptor {
  const ApiInterceptor({
    required Dio dio,
    int maxRetries = 3,
    Duration retryDelay = const Duration(seconds: 2),
  })  : _dio = dio,
        _retryDelay = retryDelay,
        _maxRetries = maxRetries;

  final Dio _dio;
  final int _maxRetries;
  final Duration _retryDelay;

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) {
    // if (_authCubit.isAuthenticated) {
    //   options.headers['Authorization'] = 'Bearer ${_authCubit.token}';
    // }
    // if (_authCubit.hasLocale) {
    //   options.headers['Accept-Language'] = _authCubit.locale;
    // }
    options.cancelToken = GetIt.I.get<CancelToken>();
    super.onRequest(options, handler);
  }

  @override
  void onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) {
    if (response.statusCode == HttpStatus.ok ||
        response.statusCode == HttpStatus.created) {
      if (response.data is DataMap && response.data['data']?['token'] != null) {
        final DataMap data = response.data as DataMap;
        // if (_authCubit.isAuthenticated) {
        //   _authCubit.removeToken();
        // }
        // _authCubit.token = data['data']['token'] as String;
      }
    }

    super.onResponse(response, handler);
  }

  @override
  Future onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == HttpStatus.unauthorized) {
      // _authCubit.unAuthenticate();
      return handler.reject(err);
    }
    final int retryCount =
        (err.requestOptions.extra['retryCount'] as int?) ?? 0;

    if (_shouldRetry(err) && retryCount < _maxRetries) {
      // Update retry count in request options
      err.requestOptions.extra['retryCount'] = retryCount + 1;

      // _authCubit.slowConnection();
      await Future.delayed(_retryDelay);

      try {
        // Re-execute the original request with all interceptors
        final response = await _dio.fetch(err.requestOptions);
        // _authCubit.reconnectedToInternet();
        return handler.resolve(response);
      } on DioException catch (e) {
        // Pass through to the same error handler for recursive processing
        return onError(e, handler);
      }
    } else if (_shouldRetry(err) && retryCount == _maxRetries) {
      // _authCubit.connectionTimeOut();
    } else if (err.type != DioExceptionType.cancel) {
      // _authCubit.reconnectedToInternet();
    }
    return super.onError(err, handler);
  }

  bool _shouldRetry(DioException error) {
    return error.type == DioExceptionType.connectionTimeout ||
        error.type == DioExceptionType.sendTimeout ||
        error.type == DioExceptionType.receiveTimeout ||
        error.type == DioExceptionType.connectionError ||
        error.type == DioExceptionType.unknown;
  }
} 