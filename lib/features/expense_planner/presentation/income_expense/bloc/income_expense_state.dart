// ignore_for_file: public_member_api_docs, sort_constructors_first, overridden_fields

part of 'income_expense_bloc.dart';

abstract class IncomeExpenseState extends Equatable {
  final List<IncomeExpenseTypeEntity> typeList;
  final List<IncomeExpenseDataEntity> dataList;
  const IncomeExpenseState({
    required this.typeList,
    required this.dataList,
  });
  @override
  List<Object?> get props => [typeList, dataList];
}

class IncomeExpenseDataLoaded extends IncomeExpenseState {
  @override
  final List<IncomeExpenseTypeEntity> typeList;
  @override
  final List<IncomeExpenseDataEntity> dataList;

  const IncomeExpenseDataLoaded({
    required this.typeList,
    required this.dataList,
  }) : super(typeList: typeList, dataList: dataList);
  @override
  List<Object?> get props => [typeList, dataList];

  IncomeExpenseDataLoaded copyWith({
    List<IncomeExpenseTypeEntity>? typeList,
    List<IncomeExpenseDataEntity>? dataList,
  }) {
    return IncomeExpenseDataLoaded(
      typeList: typeList ?? this.typeList,
      dataList: dataList ?? this.dataList,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'typeList': typeList.map((x) => x.toMap()).toList(),
      'dataList': dataList.map((x) => x.toMap()).toList(),
    };
  }

  factory IncomeExpenseDataLoaded.fromMap(Map<String, dynamic> map) {
    return IncomeExpenseDataLoaded(
      typeList: List<IncomeExpenseTypeEntity>.from(
        (map['typeList'] as List<int>).map<IncomeExpenseTypeEntity>(
          (x) => IncomeExpenseTypeEntity.fromMap(x as Map<String, dynamic>),
        ),
      ),
      dataList: List<IncomeExpenseDataEntity>.from(
        (map['dataList'] as List<int>).map<IncomeExpenseDataEntity>(
          (x) => IncomeExpenseDataEntity.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }
}

class ErrorState extends IncomeExpenseState {
  final String message;

  const ErrorState(this.message, {required super.typeList, required super.dataList});
}
