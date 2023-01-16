import 'package:expense_planner/features/expense_planner/domain/entities/currency/currency_type_entity.dart';

abstract class CurrencyTypeRepository {
  Future<List<CurrencyTypeEntity>> fetchCurrencyType();
  Future<bool> saveCurrencyType(CurrencyTypeEntity currencyTypeEntity);
  Future<bool> updateCurrencyType(CurrencyTypeEntity currencyTypeEntity);
}
