// ignore_for_file: public_member_api_docs, sort_constructors_first, overridden_fields

import 'package:expense_planner/features/expense_planner/domain/entities/income_expense_data/income_expense_data_entity.dart';
import 'package:expense_planner/features/expense_planner/domain/entities/income_expense_type/income_expense_type_entity.dart';

class IncomeExpenseDataModel extends IncomeExpenseDataEntity {
  @override
  final String id;
  @override
  final String description;
  @override
  final String addDate;
  @override
  final String amount;
  @override
  final int isIncome;
  @override
  final String incomeExpenseTypeId;
  @override
  final IncomeExpenseTypeEntity? incomeExpenseTypeEntity;
  const IncomeExpenseDataModel({
    required this.id,
    required this.description,
    required this.addDate,
    required this.amount,
    required this.isIncome,
    required this.incomeExpenseTypeId,
    this.incomeExpenseTypeEntity,
  }) : super(
          id: id,
          description: description,
          addDate: addDate,
          amount: amount,
          isIncome: isIncome,
          incomeExpenseTypeId: incomeExpenseTypeId,
          incomeExpenseTypeEntity: incomeExpenseTypeEntity,
        );

  @override
  IncomeExpenseDataModel copyWith({
    String? id,
    String? description,
    String? addDate,
    String? amount,
    int? isIncome,
    String? incomeExpenseTypeId,
    IncomeExpenseTypeEntity? incomeExpenseTypeEntity,
  }) {
    return IncomeExpenseDataModel(
      id: id ?? this.id,
      description: description ?? this.description,
      addDate: addDate ?? this.addDate,
      amount: amount ?? this.amount,
      isIncome: isIncome ?? this.isIncome,
      incomeExpenseTypeId: incomeExpenseTypeId ?? this.incomeExpenseTypeId,
      incomeExpenseTypeEntity: incomeExpenseTypeEntity ?? this.incomeExpenseTypeEntity,
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'description': description,
      'addDate': addDate,
      'amount': amount,
      'isIncome': isIncome,
      'incomeExpenseTypeId': incomeExpenseTypeId,
      'incomeExpenseTypeEntity': incomeExpenseTypeEntity?.toMap(),
    };
  }

  @override
  Map<String, dynamic> toMapToDb() {
    return <String, dynamic>{
      'id': id,
      'description': description,
      'addDate': addDate,
      'amount': amount,
      'isIncome': isIncome,
      'incomeExpenseTypeId': incomeExpenseTypeId,
    };
  }

  factory IncomeExpenseDataModel.fromMap(Map<String, dynamic> map) {
    return IncomeExpenseDataModel(
      id: map['id'] as String,
      description: map['description'] as String,
      addDate: map['addDate'] as String,
      amount: map['amount'] as String,
      isIncome: map['isIncome'] as int,
      incomeExpenseTypeId: map['incomeExpenseTypeId'] as String,
      incomeExpenseTypeEntity: map['incomeExpenseTypeEntity'] != null
          ? IncomeExpenseTypeEntity.fromMap(map['incomeExpenseTypeEntity'] as Map<String, dynamic>)
          : null,
    );
  }
}
