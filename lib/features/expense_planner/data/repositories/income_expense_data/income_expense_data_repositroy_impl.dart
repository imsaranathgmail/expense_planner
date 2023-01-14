// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:expense_planner/features/expense_planner/data/datasources/income_expense_data/income_expense_data_datasource.dart';
import 'package:expense_planner/features/expense_planner/data/models/income_expense_data/income_expense_data_model.dart';
import 'package:expense_planner/features/expense_planner/domain/entities/income_expense_data/income_expense_data_entity.dart';
import 'package:expense_planner/features/expense_planner/domain/repositories/income_expense_data/income_expense_data_repositroy.dart';

class IncomeExpenseDataRepositoryImpl implements IncomeExpenseDataRepository {
  final IncomeExpenseDatasource incomeExpenseDatasource;
  IncomeExpenseDataRepositoryImpl({
    required this.incomeExpenseDatasource,
  });

  @override
  Future<List<IncomeExpenseDataEntity>> fetchIncomeExpenseData() async {
    try {
      final dataList = await incomeExpenseDatasource.fetchIncomeExpenseData();
      return dataList;
    } on Exception {
      return [];
    }
  }

  // @override
  // Future<List<Map<String, dynamic>>> customeFetchQueryData(String sql) async {
  //   final dataList = await incomeExpenseDatasource.customeFetchQueryData(sql);
  //   return dataList;
  // }

  @override
  Future<bool> saveIncomeExpenseData(IncomeExpenseDataEntity incomeExpenseDataEntity) async {
    try {
      final dataMap = incomeExpenseDataEntity.toMap();
      final dataModel = IncomeExpenseDataModel.fromMap(dataMap);
      final result = await incomeExpenseDatasource.saveIncomeExpenseData(dataModel);
      return result;
    } on Exception {
      return false;
    }
  }

  @override
  Future<bool> updateIncomeExpenseData(IncomeExpenseDataEntity incomeExpenseDataEntity) async {
    try {
      final dataMap = incomeExpenseDataEntity.toMap();
      final dataModel = IncomeExpenseDataModel.fromMap(dataMap);
      final result = await incomeExpenseDatasource.updateIncomeExpenseData(dataModel);
      return result;
    } on Exception {
      return false;
    }
  }

  @override
  Future<bool> deleteIncomeExpenseData(IncomeExpenseDataEntity incomeExpenseDataEntity) async {
    try {
      final dataMap = incomeExpenseDataEntity.toMap();
      final dataModel = IncomeExpenseDataModel.fromMap(dataMap);
      final result = await incomeExpenseDatasource.deleteIncomeExpenseData(dataModel);
      return result;
    } on Exception {
      return false;
    }
  }
}
