import '../../app/utilities/typedef.dart';
import '../../app/utilities/usecases/usecase.dart';
import '../entities/{{name.snakeCase()}}_entity.dart';
import '../repositories/{{name.snakeCase()}}_repository.dart';

class Get{{name.pascalCase()}} extends UseCaseWithNoParams<{{name.pascalCase()}}Entity> {
  const Get{{name.pascalCase()}}(this._repository);

  final {{name.pascalCase()}}Repository _repository;

  @override
  ResultFuture<{{name.pascalCase()}}Entity> call() async => _repository.get{{name.pascalCase()}}();
} 