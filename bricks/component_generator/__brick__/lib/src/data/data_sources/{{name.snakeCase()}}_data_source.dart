import 'package:dio/dio.dart';

import '../../../generated/l10n.dart';
import '../../app/constants/api_constants.dart';
import '../../app/utilities/errors/exceptions.dart';
import '../models/{{name.snakeCase()}}_model.dart';

abstract class {{name.pascalCase()}}DataSource {
  Future<{{name.pascalCase()}}Model> get{{name.pascalCase()}}();
}

class {{name.pascalCase()}}DataSourceImpl implements {{name.pascalCase()}}DataSource {
  const {{name.pascalCase()}}DataSourceImpl(this._dio);

  final Dio _dio;

  @override
  Future<{{name.pascalCase()}}Model> get{{name.pascalCase()}}() async {
    try {
      final response = await _dio.post(ApiConstants.kGet{{name.pascalCase()}});
      return {{name.pascalCase()}}Model.fromMap(response.data['data']);
    } on DioException catch (e) {
      throw APIException(
        message: e.response?.data['message'] ??
            e.response?.statusMessage ??
            S.current.somethingWentWrong,
        statusCode: e.response?.statusCode ?? 505,
        type: e.type,
      );
    } catch (e) {
      throw APIException(
          message: e.toString(),
          statusCode: 505,
          type: DioExceptionType.unknown);
    }
  }
} 