import 'dart:convert';

import '../../app/utilities/typedef.dart';
import '../../domain/entities/sample_entity.dart';

class SampleModel extends SampleEntity {
  const SampleModel({
    required super.id,
    required super.name,
  });

  const SampleModel.empty()
      : this(
          id: -1,
          name: '_empty.name',
        );

  SampleModel copyWith({
    int? id,
    String? name,
  }) {
    return SampleModel(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  DataMap toMap() => {
        'id': id,
        'name': name,
      };

  factory SampleModel.fromMap(DataMap map) {
    return SampleModel(
      id: map['id'] as int,
      name: map['name'] as String,
    );
  }

  factory SampleModel.fromJson(String source) =>
      SampleModel.fromMap(json.decode(source) as DataMap);

  String toJson() => json.encode(toMap());
}
