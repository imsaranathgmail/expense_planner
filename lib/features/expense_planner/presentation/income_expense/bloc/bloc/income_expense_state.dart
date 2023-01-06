part of 'income_expense_bloc.dart';

class IncomeExpenseState extends Equatable {
  final List<IncomeExpenseTypeEntity> typeList;
  final List<IncomeExpenseDataEntity> dataList;
  const IncomeExpenseState({
    this.typeList = const <IncomeExpenseTypeEntity>[],
    this.dataList = const <IncomeExpenseDataEntity>[],
  });

  @override
  List<Object> get props => [typeList, dataList];

  IncomeExpenseState copyWith({
    List<IncomeExpenseTypeEntity>? typeList,
    List<IncomeExpenseDataEntity>? dataList,
  }) {
    return IncomeExpenseState(
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

  factory IncomeExpenseState.fromMap(Map<String, dynamic> map) {
    return IncomeExpenseState(
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

class LoadingState extends IncomeExpenseState {}
