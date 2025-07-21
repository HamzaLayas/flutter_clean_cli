import 'package:equatable/equatable.dart';

class SampleEntity extends Equatable {
  const SampleEntity({
    required this.id,
    required this.name,
  });

  const SampleEntity.empty()
      : this(
          id: -1,
          name: '_empty.name',
        );

  final int id;
  final String name;

  @override
  List<Object> get props => [id, name];
}
