import '../typedef.dart';

abstract class UseCase<Output> {
  const UseCase();

  ResultFuture<Output> call();
}

abstract class UseCaseWithParams<Output, Input> {
  const UseCaseWithParams();

  ResultFuture<Output> call(Input params);
}

abstract class UseCaseWithNoParams<Output> {
  const UseCaseWithNoParams();

  ResultFuture<Output> call();
}
