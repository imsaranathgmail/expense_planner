// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:equatable/equatable.dart';

import 'package:expense_planner/features/expense_planner/domain/entities/income_expense_type/income_expense_type_entity.dart';

class IncomeExpenseDataEntity extends Equatable {
  final String id;
  final String description;
  final String addDate;
  final String amount;
  final int isIncome;
  final String incomeExpenseTypeId;
  final IncomeExpenseTypeEntity? incomeExpenseTypeEntity;
  const IncomeExpenseDataEntity({
    required this.id,
    required this.description,
    required this.addDate,
    required this.amount,
    required this.isIncome,
    required this.incomeExpenseTypeId,
    this.incomeExpenseTypeEntity,
  });

  IncomeExpenseDataEntity copyWith({
    String? id,
    String? description,
    String? addDate,
    String? amount,
    int? isIncome,
    String? incomeExpenseTypeId,
    IncomeExpenseTypeEntity? incomeExpenseTypeEntity,
  }) {
    return IncomeExpenseDataEntity(
      id: id ?? this.id,
      description: description ?? this.description,
      addDate: addDate ?? this.addDate,
      amount: amount ?? this.amount,
      isIncome: isIncome ?? this.isIncome,
      incomeExpenseTypeId: incomeExpenseTypeId ?? this.incomeExpenseTypeId,
      incomeExpenseTypeEntity: incomeExpenseTypeEntity ?? this.incomeExpenseTypeEntity,
    );
  }

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

  factory IncomeExpenseDataEntity.fromMap(Map<String, dynamic> map) {
    return IncomeExpenseDataEntity(
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

  @override
  List<Object> get props {
    return [
      id,
      description,
      addDate,
      amount,
      isIncome,
      incomeExpenseTypeId,
    ];
  }
}
