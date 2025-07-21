import 'package:dio/dio.dart';

import '../../localization/generated/l10n.dart';
import '../../../app/constants/api_constants.dart';
import '../../../app/utilities/errors/exceptions.dart';
import '../models/sample_model.dart';

abstract class SampleDataSource {
  Future<SampleModel> getSample();
}

class SampleDataSourceImpl implements SampleDataSource {
  const SampleDataSourceImpl(this._dio);

  final Dio _dio;

  @override
  Future<SampleModel> getSample() async {
    try {
      final response = await _dio.post(ApiConstants.kGetSample);
      return SampleModel.fromMap(response.data['data']);
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
