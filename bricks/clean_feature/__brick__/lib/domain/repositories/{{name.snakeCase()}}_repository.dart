import '../../app/utilities/typedef.dart';
import '../entities/{{name.snakeCase()}}_entity.dart';

abstract class {{name.pascalCase()}}Repository {
  ResultFuture<{{name.pascalCase()}}Entity> get{{name.pascalCase()}}();
} 