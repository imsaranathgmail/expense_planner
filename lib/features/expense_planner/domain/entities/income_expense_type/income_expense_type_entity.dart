// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:equatable/equatable.dart';

class IncomeExpenseTypeEntity extends Equatable {
  final String id;
  final String typeName;
  final int isIncomeType;
  const IncomeExpenseTypeEntity({
    required this.id,
    required this.typeName,
    required this.isIncomeType,
  });

  @override
  List<Object> get props => [id, typeName, isIncomeType];

  IncomeExpenseTypeEntity copyWith({
    String? id,
    String? typeName,
    int? isIncomeType,
  }) {
    return IncomeExpenseTypeEntity(
      id: id ?? this.id,
      typeName: typeName ?? this.typeName,
      isIncomeType: isIncomeType ?? this.isIncomeType,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'typeName': typeName,
      'isIncomeType': isIncomeType,
    };
  }

  factory IncomeExpenseTypeEntity.fromMap(Map<String, dynamic> map) {
    return IncomeExpenseTypeEntity(
      id: map['id'] as String,
      typeName: map['typeName'] as String,
      isIncomeType: map['isIncomeType'] as int,
    );
  }
}
