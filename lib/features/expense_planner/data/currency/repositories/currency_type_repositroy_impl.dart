// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:expense_planner/features/expense_planner/data/currency/datasources/currency_type_datasource.dart';
import 'package:expense_planner/features/expense_planner/data/currency/models/currency_type_model.dart';
import 'package:expense_planner/features/expense_planner/domain/currency/entities/currency_type_entity.dart';
import 'package:expense_planner/features/expense_planner/domain/currency/repositories/expense_type_repositroy.dart';

class CurrencyTypeRepositoryImpl implements CurrencyTypeRepository {
  final CurrencyTypeDatasource currencyTypeDatasource;
  CurrencyTypeRepositoryImpl({
    required this.currencyTypeDatasource,
  });

  @override
  Future<List<CurrencyTypeEntity>> fetchCurrencyType() async {
    final dataList = await currencyTypeDatasource.fetchCurrencyType();
    return dataList;
  }

  @override
  Future<bool> saveCurrencyType(CurrencyTypeEntity currencyTypeEntity) async {
    final dataMap = currencyTypeEntity.toMap();
    final dataModel = CurrencyTypeModel.fromMap(dataMap);
    final result = await currencyTypeDatasource.saveCurrencyType(dataModel);
    return result;
  }

  @override
  Future<bool> updateCurrencyType(CurrencyTypeEntity currencyTypeEntity) async {
    final dataMap = currencyTypeEntity.toMap();
    final dataModel = CurrencyTypeModel.fromMap(dataMap);
    final result = await currencyTypeDatasource.updateCurrencyType(dataModel);
    return result;
  }

  Future<bool> deleteCurrencyType(CurrencyTypeEntity currencyTypeEntity) async {
    final dataMap = currencyTypeEntity.toMap();
    final dataModel = CurrencyTypeModel.fromMap(dataMap);
    final result = await currencyTypeDatasource.deleteCurrencyType(dataModel);
    return result;
  }
}
