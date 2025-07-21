import 'package:fpdart/fpdart.dart';

import '../utilities/errors/failure.dart';

typedef ResultFuture<T> = Future<Either<Failure, T>>;

typedef DataMap = Map<String, dynamic>;
