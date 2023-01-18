import 'package:expense_planner/features/expense_planner/domain/entities/currency/currency_type_entity.dart';

class CurrencySymbolHolder {
  CurrencySymbolHolder._();
  static String? _symbol;
  static setCurrencySymbol(CurrencyTypeEntity entity) {
    String symbol = entity.currencySymbol.isNotEmpty ? entity.currencySymbol : '';
    _symbol = symbol;
  }

  static String get currencySymbol {
    return _symbol ?? '';
  }
}
