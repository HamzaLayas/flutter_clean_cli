import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

class APIException extends Equatable implements Exception {
  const APIException({
    required this.message,
    required this.statusCode,
    required this.type,
  });

  final String message;
  final int statusCode;
  final DioExceptionType type;

  @override
  List<Object?> get props => [message, statusCode, type];
}
