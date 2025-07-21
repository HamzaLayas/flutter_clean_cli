import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

import 'exceptions.dart';

abstract class Failure extends Equatable {
  const Failure({
    required this.message,
    required this.statusCode,
  });

  final String message;
  final int statusCode;

  bool get isCanceled;

  @override
  List<Object> get props => [message, statusCode];
}

class APIFailure extends Failure {
  const APIFailure({
    required super.message,
    required super.statusCode,
    required this.type,
  });

  const APIFailure.empty()
      : this(
          message: "_empty_message",
          statusCode: -1,
          type: DioExceptionType.unknown,
        );

  @override
  bool get isCanceled => type == DioExceptionType.cancel;

  final DioExceptionType type;

  @override
  List<Object> get props => [...super.props, type];

  factory APIFailure.fromException(APIException exception) {
    return APIFailure(
      message: exception.message,
      statusCode: exception.statusCode,
      type: exception.type,
    );
  }
}
