// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'common_bloc.dart';

abstract class CommonEvent extends Equatable {
  const CommonEvent();

  @override
  List<Object> get props => [];
}

class SelectYear extends CommonEvent {
  final String selectedYear;
  const SelectYear({
    required this.selectedYear,
  });
  @override
  List<Object> get props => [selectedYear];
}

class SelectMonth extends CommonEvent {
  final String selectedMonth;
  const SelectMonth({
    required this.selectedMonth,
  });
  @override
  List<Object> get props => [selectedMonth];
}

class SelectIncomeExpenseType extends CommonEvent {
  final String incomeExpenseType;
  const SelectIncomeExpenseType({
    required this.incomeExpenseType,
  });

  @override
  List<Object> get props => [incomeExpenseType];
}

class SelecteDate extends CommonEvent {
  final String selectedDate;
  const SelecteDate({
    required this.selectedDate,
  });

  @override
  List<Object> get props => [selectedDate];
}
