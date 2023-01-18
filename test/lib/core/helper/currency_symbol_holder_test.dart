import 'package:expense_planner/core/helper/functions/currency_symbol_holder.dart';
import 'package:expense_planner/features/expense_planner/domain/entities/currency/currency_type_entity.dart';
import 'package:flutter_test/flutter_test.dart';

late CurrencyTypeEntity currencyTypeEntity;
void main() {
  setUp(() {
    currencyTypeEntity = const CurrencyTypeEntity(
      id: '1',
      currencyName: 'Sri Lanka',
      currencySymbol: 'LKR',
    );
  });
  test('should give what we sene to the class', () async {
    //arrange
    CurrencySymbolHolder.setCurrencySymbol(currencyTypeEntity);
    //act
    final result = CurrencySymbolHolder.currencySymbol;
    //assert
    expect(result, currencyTypeEntity.currencySymbol);
  });
}
