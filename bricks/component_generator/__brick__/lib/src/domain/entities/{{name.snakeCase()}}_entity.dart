import 'package:equatable/equatable.dart';

class {{name.pascalCase()}}Entity extends Equatable {
  const {{name.pascalCase()}}Entity({
    required this.id,
    required this.name,
  });

  const {{name.pascalCase()}}Entity.empty()
      : this(
          id: -1,
          name: '_empty.name',
        );

  final int id;
  final String name;

  @override
  List<Object> get props => [id, name];
} 