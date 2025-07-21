import 'dart:convert';

import '../../app/utilities/typedef.dart';
import '../../domain/entities/{{name.snakeCase()}}_entity.dart';

class {{name.pascalCase()}}Model extends {{name.pascalCase()}}Entity {
  const {{name.pascalCase()}}Model({
    required super.id,
    required super.name,
  });

  const {{name.pascalCase()}}Model.empty()
      : this(
          id: -1,
          name: '_empty.name',
        );

  {{name.pascalCase()}}Model copyWith({
    int? id,
    String? name,
  }) {
    return {{name.pascalCase()}}Model(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  DataMap toMap() => {
        'id': id,
        'name': name,
      };

  factory {{name.pascalCase()}}Model.fromMap(DataMap map) {
    return {{name.pascalCase()}}Model(
      id: map['id'] as int,
      name: map['name'] as String,
    );
  }

  factory {{name.pascalCase()}}Model.fromJson(String source) =>
      {{name.pascalCase()}}Model.fromMap(json.decode(source) as DataMap);

  String toJson() => json.encode(toMap());
} 