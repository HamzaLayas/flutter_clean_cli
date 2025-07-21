import 'package:fpdart/fpdart.dart';

import '../../domain/entities/sample_entity.dart';
import '../data_sources/sample_data_source.dart';
import '../../domain/repositories/sample_repository.dart';
import '../../app/utilities/typedef.dart';
import '../../app/utilities/errors/failure.dart';
import '../../app/utilities/errors/exceptions.dart';

class SampleRepositoryImpl implements SampleRepository {
  const SampleRepositoryImpl(this._sampleDataSource);

  final SampleDataSource _sampleDataSource;
  @override
  ResultFuture<SampleEntity> getSample() async {
    try {
      final result = await _sampleDataSource.getSample();
      return Right(result);
    } on APIException catch (e) {
      return Left(
        APIFailure.fromException(e),
      );
    }
  }
}
