import 'package:bloc_test/bloc_test.dart';
import 'package:expense_planner/features/expense_planner/presentation/bloc/common_bloc/common_bloc.dart';

void main() {
  String selectedYear = '2022';
  String selectedMonth = '01';
  String incomeExpenseType = 'Salary';
  String selectedDate = '2022-01-01';

  blocTest<CommonBloc, CommonState>(
    'Selected Year',
    build: () => CommonBloc(),
    act: (bloc) => bloc.add(const SelectYear(selectedYear: '2022')),
    expect: () => [
      CommonState(selectedYear: selectedYear),
    ],
  );
  blocTest<CommonBloc, CommonState>(
    'Selected Month',
    build: () => CommonBloc(),
    act: (bloc) => bloc.add(const SelectMonth(selectedMonth: '01')),
    expect: () => [
      CommonState(selectedMonth: selectedMonth),
    ],
  );

  blocTest<CommonBloc, CommonState>(
    'Selected Income Expense Type',
    build: () => CommonBloc(),
    act: (bloc) => bloc.add(const SelectIncomeExpenseType(incomeExpenseType: 'Salary')),
    expect: () => [
      TypeLoadingState(),
      CommonState(incomeExpenseType: incomeExpenseType),
    ],
  );
  blocTest<CommonBloc, CommonState>(
    'Selected date',
    build: () => CommonBloc(),
    act: (bloc) => bloc.add(const SelecteDate(selectedDate: '2022-01-01')),
    expect: () => [
      CommonState(selectedDate: selectedDate),
    ],
  );
}
