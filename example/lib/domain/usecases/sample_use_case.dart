import '../../app/utilities/typedef.dart';
import '../../app/utilities/usecases/usecase.dart';
import '../entities/sample_entity.dart';
import '../repositories/sample_repository.dart';

class GetSample extends UseCaseWithNoParams<SampleEntity> {
  const GetSample(this._repository);

  final SampleRepository _repository;

  @override
  ResultFuture<SampleEntity> call() async => _repository.getSample();
}
