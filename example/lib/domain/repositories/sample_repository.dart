import '../../app/utilities/typedef.dart';
import '../entities/sample_entity.dart';

abstract class SampleRepository {
  ResultFuture<SampleEntity> getSample();
}
