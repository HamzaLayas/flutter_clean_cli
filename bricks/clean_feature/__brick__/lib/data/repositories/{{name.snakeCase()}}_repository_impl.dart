import 'package:fpdart/fpdart.dart';

import '../../domain/entities/{{name.snakeCase()}}_entity.dart';
import '../data_sources/{{name.snakeCase()}}_data_source.dart';
import '../../domain/repositories/{{name.snakeCase()}}_repository.dart';
import '../../app/utilities/typedef.dart';
import '../../app/utilities/errors/failure.dart';
import '../../app/utilities/errors/exceptions.dart';

class {{name.pascalCase()}}RepositoryImpl implements {{name.pascalCase()}}Repository {
  const {{name.pascalCase()}}RepositoryImpl(this._{{name.camelCase()}}DataSource);

  final {{name.pascalCase()}}DataSource _{{name.camelCase()}}DataSource;
  @override
  ResultFuture<{{name.pascalCase()}}Entity> get{{name.pascalCase()}}() async {
    try {
      final result = await _{{name.camelCase()}}DataSource.get{{name.pascalCase()}}();
      return Right(result);
    } on APIException catch (e) {
      return Left(
        APIFailure.fromException(e),
      );
    }
  }
} 