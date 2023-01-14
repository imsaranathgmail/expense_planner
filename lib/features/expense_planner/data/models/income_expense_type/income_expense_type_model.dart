// ignore_for_file: overridden_fields

import 'package:expense_planner/features/expense_planner/domain/entities/income_expense_type/income_expense_type_entity.dart';

class IncomeExpenseTypeModel extends IncomeExpenseTypeEntity {
  @override
  final String id;
  @override
  final String typeName;
  @override
  final int isIncomeType;
  const IncomeExpenseTypeModel({
    required this.id,
    required this.typeName,
    required this.isIncomeType,
  }) : super(id: id, typeName: typeName, isIncomeType: isIncomeType);

  @override
  List<Object> get props => [id, typeName, isIncomeType];

  @override
  IncomeExpenseTypeModel copyWith({
    String? id,
    String? typeName,
    int? isIncomeType,
  }) {
    return IncomeExpenseTypeModel(
      id: id ?? this.id,
      typeName: typeName ?? this.typeName,
      isIncomeType: isIncomeType ?? this.isIncomeType,
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'typeName': typeName,
      'isIncomeType': isIncomeType,
    };
  }

  factory IncomeExpenseTypeModel.fromMap(Map<String, dynamic> map) {
    return IncomeExpenseTypeModel(
      id: map['id'] as String,
      typeName: map['typeName'] as String,
      isIncomeType: map['isIncomeType'] as int,
    );
  }
}
