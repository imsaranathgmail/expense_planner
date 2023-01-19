import 'package:expense_planner/core/helper/functions/list_map_function.dart';
import 'package:expense_planner/features/expense_planner/domain/entities/income_expense_data/income_expense_data_entity.dart';
import 'package:expense_planner/features/expense_planner/presentation/bloc/income_expense/income_expense_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

late IncomeExpenseState incomeExpenseState;
// late IncomeExpenseTypeEntity entity;
late List<IncomeExpenseDataEntity> dataList;
List<String> amountList = ['1000', '2000', '3000', '4000'];
List<String> dateList = [
  '01/01/2023',
  '01/01/2023',
  '01/02/2023',
  '01/02/2023',
];
List<int> typeList = [0, 0, 1, 1];
void main() {
  setUp(() {
    dataList = amountList
        .map<IncomeExpenseDataEntity>((amount) => IncomeExpenseDataEntity(
              id: amountList.indexOf(amount).toString(),
              description: 'description',
              addDate: dateList[amountList.indexOf(amount)],
              amount: amount,
              isIncome: typeList[amountList.indexOf(amount)],
              incomeExpenseTypeId: '${typeList[amountList.indexOf(amount)]}',
            ))
        .toList();
  });

  group(
    'All List Map functions',
    () {
      test('should return total amount as 3000', () async {
        //arrange

        //act
        final reslut = ListMapFunctions.getTotalAmountFromList(dataList);
        //assert
        expect(reslut, 10000);
      });

      test('should return data to relevent dates', () async {
        //arrange
        String searchString01 = '/2023';
        String searchString02 = '/02/2023';
        //act
        final result01 = ListMapFunctions.getFilteredListYearMonthWice(dataList, searchString01, 0);
        final result02 = ListMapFunctions.getFilteredListYearMonthWice(dataList, searchString02, 1);
        //assert
        expect(result01.length, 2);
        expect(result02.length, 2);
      });

      test('should return group with type and result should be 2', () async {
        //arrange

        //act
        final result = ListMapFunctions.getIncomeOrExpenseGroupWiceAmountMap(dataList);
        //assert
        expect(result.length, 2);
      });
    },
  );
}
