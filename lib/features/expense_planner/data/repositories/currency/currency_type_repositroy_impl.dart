// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:expense_planner/features/expense_planner/data/datasources/currency/currency_type_datasource.dart';
import 'package:expense_planner/features/expense_planner/data/models/currency/currency_type_model.dart';
import 'package:expense_planner/features/expense_planner/domain/entities/currency/currency_type_entity.dart';
import 'package:expense_planner/features/expense_planner/domain/repositories/currency/expense_type_repositroy.dart';

class CurrencyTypeRepositoryImpl implements CurrencyTypeRepository {
  final CurrencyTypeDatasource currencyTypeDatasource;
  CurrencyTypeRepositoryImpl({
    required this.currencyTypeDatasource,
  });

  @override
  Future<List<CurrencyTypeEntity>> fetchCurrencyType() async {
    try {
      final dataList = await currencyTypeDatasource.fetchCurrencyType();
      return dataList;
    } on Exception {
      return [];
    }
  }

  @override
  Future<bool> saveCurrencyType(CurrencyTypeEntity currencyTypeEntity) async {
    try {
      final dataMap = currencyTypeEntity.toMap();
      final dataModel = CurrencyTypeModel.fromMap(dataMap);
      final result = await currencyTypeDatasource.saveCurrencyType(dataModel);
      return result;
    } on Exception {
      return false;
    }
  }

  @override
  Future<bool> updateCurrencyType(CurrencyTypeEntity currencyTypeEntity) async {
    try {
      final dataMap = currencyTypeEntity.toMap();
      final dataModel = CurrencyTypeModel.fromMap(dataMap);
      final result = await currencyTypeDatasource.updateCurrencyType(dataModel);
      return result;
    } on Exception {
      return false;
    }
  }

  Future<bool> deleteCurrencyType(CurrencyTypeEntity currencyTypeEntity) async {
    try {
      final dataMap = currencyTypeEntity.toMap();
      final dataModel = CurrencyTypeModel.fromMap(dataMap);
      final result = await currencyTypeDatasource.deleteCurrencyType(dataModel);
      return result;
    } on Exception {
      return false;
    }
  }
}
