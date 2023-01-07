// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'income_expense_bloc.dart';

abstract class IncomeExpenseEvent extends Equatable {
  const IncomeExpenseEvent();

  @override
  List<Object> get props => [];
}

//! Fetch Type and Data

class FetchBothTypeAndData extends IncomeExpenseEvent {
  @override
  List<Object> get props => [];
}

//! Income Expense Type Events
class AddIncomeExpenseType extends IncomeExpenseEvent {
  final IncomeExpenseTypeEntity incomeExpenseTypeEntity;
  const AddIncomeExpenseType({
    required this.incomeExpenseTypeEntity,
  });
  @override
  List<Object> get props => [incomeExpenseTypeEntity];
}

class UpdateIncomeExpenseType extends IncomeExpenseEvent {
  final IncomeExpenseTypeEntity incomeExpenseTypeEntity;
  const UpdateIncomeExpenseType({
    required this.incomeExpenseTypeEntity,
  });
  @override
  List<Object> get props => [incomeExpenseTypeEntity];
}

class DeleteIncomeExpenseType extends IncomeExpenseEvent {
  final IncomeExpenseTypeEntity incomeExpenseTypeEntity;
  const DeleteIncomeExpenseType({
    required this.incomeExpenseTypeEntity,
  });
  @override
  List<Object> get props => [incomeExpenseTypeEntity];
}

class FetchIncomeExpenseType extends IncomeExpenseEvent {
  @override
  List<Object> get props => [];
}

//! Income Expense Data Events
class AddIncomeExpenseData extends IncomeExpenseEvent {
  final IncomeExpenseDataEntity incomeExpenseDataEntity;
  const AddIncomeExpenseData({
    required this.incomeExpenseDataEntity,
  });
  @override
  List<Object> get props => [incomeExpenseDataEntity];
}

class UpdateIncomeExpenseData extends IncomeExpenseEvent {
  final IncomeExpenseDataEntity incomeExpenseDataEntity;
  const UpdateIncomeExpenseData({
    required this.incomeExpenseDataEntity,
  });
  @override
  List<Object> get props => [incomeExpenseDataEntity];
}

class DeleteIncomeExpenseData extends IncomeExpenseEvent {
  final IncomeExpenseDataEntity incomeExpenseDataEntity;
  const DeleteIncomeExpenseData({
    required this.incomeExpenseDataEntity,
  });
  @override
  List<Object> get props => [incomeExpenseDataEntity];
}

class FetchIncomeExpenseData extends IncomeExpenseEvent {
  @override
  List<Object> get props => [];
}
