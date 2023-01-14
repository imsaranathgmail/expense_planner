// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:expense_planner/features/expense_planner/data/datasources/income_expense_type/income_expense_type_datasource.dart';
import 'package:expense_planner/features/expense_planner/data/models/income_expense_type/income_expense_type_model.dart';
import 'package:expense_planner/features/expense_planner/domain/entities/income_expense_type/income_expense_type_entity.dart';
import 'package:expense_planner/features/expense_planner/domain/repositories/income_expense_type/income_expense_type_repositroy.dart';

class IncomeExpenseTypeRepositoryImpl implements IncomeExpenseTypeRepository {
  final IncomeExpenseTypeDatasource incomeExpenseTypeDatasource;
  IncomeExpenseTypeRepositoryImpl({
    required this.incomeExpenseTypeDatasource,
  });

  @override
  Future<List<IncomeExpenseTypeEntity>> fetchIncomeExpenseType() async {
    try {
      final dataList = await incomeExpenseTypeDatasource.fetchIncomeExpenseType();
      return dataList;
    } on Exception {
      return [];
    }
  }

  @override
  Future<bool> saveIncomeExpenseType(IncomeExpenseTypeEntity incomeTypeEntity) async {
    try {
      final dataMap = incomeTypeEntity.toMap();
      final dataModel = IncomeExpenseTypeModel.fromMap(dataMap);
      final result = await incomeExpenseTypeDatasource.saveIncomeExpenseType(dataModel);
      return result;
    } on Exception {
      return false;
    }
  }

  @override
  Future<bool> updateIncomeExpenseType(IncomeExpenseTypeEntity incomeTypeEntity) async {
    try {
      final dataMap = incomeTypeEntity.toMap();
      final dataModel = IncomeExpenseTypeModel.fromMap(dataMap);
      final result = await incomeExpenseTypeDatasource.updateIncomeExpenseType(dataModel);
      return result;
    } on Exception {
      return false;
    }
  }

  @override
  Future<bool> deleteIncomeExpenseType(IncomeExpenseTypeEntity incomeTypeEntity) async {
    try {
      final dataMap = incomeTypeEntity.toMap();
      final dataModel = IncomeExpenseTypeModel.fromMap(dataMap);
      final result = await incomeExpenseTypeDatasource.deleteIncomeExpenseType(dataModel);
      return result;
    } on Exception {
      return false;
    }
  }
}
