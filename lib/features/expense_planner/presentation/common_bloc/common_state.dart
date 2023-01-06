part of 'common_bloc.dart';

class CommonState extends Equatable {
  final String selectedYear;
  final String selectedMonth;
  final String selectedDate;
  final String incomeExpenseType;
  const CommonState({
    this.selectedYear = '',
    this.selectedMonth = '',
    this.selectedDate = '',
    this.incomeExpenseType = '',
  });

  CommonState copyWith({
    String? selectedYear,
    String? selectedMonth,
    String? incomeType,
    String? selectedDate,
    String? incomeExpenseType,
  }) {
    return CommonState(
      selectedYear: selectedYear ?? this.selectedYear,
      selectedMonth: selectedMonth ?? this.selectedMonth,
      selectedDate: selectedDate ?? this.selectedDate,
      incomeExpenseType: incomeExpenseType ?? this.incomeExpenseType,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'selectedYear': selectedYear,
      'selectedMonth': selectedMonth,
      'selectedDate': selectedDate,
      'expenseType': incomeExpenseType,
    };
  }

  factory CommonState.fromMap(Map<String, dynamic> map) {
    return CommonState(
      selectedYear: map['selectedYear'] as String,
      selectedMonth: map['selectedMonth'] as String,
      selectedDate: map['selectedDate'] as String,
      incomeExpenseType: map['expenseType'] as String,
    );
  }

  @override
  List<Object> get props {
    return [
      selectedYear,
      selectedMonth,
      selectedDate,
      incomeExpenseType,
    ];
  }
}

class TypeLoadingState extends CommonState {}
