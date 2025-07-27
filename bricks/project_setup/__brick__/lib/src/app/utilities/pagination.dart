import 'package:equatable/equatable.dart';

import '../utilities/typedef.dart';

class Pagination<T> extends Equatable {
  const Pagination({
    required this.currentPage,
    required this.totalPages,
    required this.totalItems,
    required this.itemsPerPage,
    required this.items,
  });

  final int currentPage;
  final int totalPages;
  final int totalItems;
  final int itemsPerPage;
  final List<T> items;

  factory Pagination.fromMap(DataMap map, List<T> items) {
    return Pagination<T>(
      currentPage: map['current_page'] as int,
      totalPages: map['last_page'] as int,
      itemsPerPage: map['per_page'] as int,
      totalItems: map['total'] as int,
      items: items,
    );
  }

  @override
  List<Object> get props => [
    currentPage,
    totalPages,
    totalItems,
    itemsPerPage,
    items,
  ];
}
