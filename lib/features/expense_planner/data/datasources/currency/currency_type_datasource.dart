// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:expense_planner/features/expense_planner/data/models/currency/currency_type_model.dart';
import 'package:expense_planner/core/util/currency_type_db_helper.dart';

abstract class CurrencyTypeDatasource {
  Future<List<CurrencyTypeModel>> fetchCurrencyType();
  Future<bool> saveCurrencyType(CurrencyTypeModel currencyTypeModel);
  Future<bool> updateCurrencyType(CurrencyTypeModel currencyTypeModel);
  Future<bool> deleteCurrencyType(CurrencyTypeModel currencyTypeModel);
}

class CurrencyTypeDatasourceImpl implements CurrencyTypeDatasource {
  @override
  Future<List<CurrencyTypeModel>> fetchCurrencyType() async {
    final currencyTypeList = await CurrencyTypeDBHelper.fetchData();
    final result = currencyTypeList.map((type) => CurrencyTypeModel.fromMap(type)).toList();
    return result;
  }

  @override
  Future<bool> saveCurrencyType(CurrencyTypeModel currencyTypeModel) async {
    final dataList = currencyTypeModel.toMap();
    final result = await CurrencyTypeDBHelper.insert(dataList);
    if (result > 0) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<bool> updateCurrencyType(CurrencyTypeModel currencyTypeModel) async {
    final result = await CurrencyTypeDBHelper.update(currencyTypeModel.toMap());
    if (result > 0) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<bool> deleteCurrencyType(CurrencyTypeModel currencyTypeModel) async {
    final result = await CurrencyTypeDBHelper.delete(currencyTypeModel.toMap());
    if (result > 0) {
      return true;
    } else {
      return false;
    }
  }
}
