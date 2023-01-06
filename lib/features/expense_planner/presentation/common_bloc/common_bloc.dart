// ignore_for_file: public_member_api_docs, sort_constructors_first, depend_on_referenced_packages
import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'common_event.dart';
part 'common_state.dart';

class CommonBloc extends Bloc<CommonEvent, CommonState> {
  CommonBloc() : super(const CommonState()) {
    on<SelectYear>(_onSelectedYear);
    on<SelectMonth>(_onSelectedMonth);
    on<SelectIncomeExpenseType>(_onSelectedExpenseType);
    on<SelecteDate>(_onSelectedDate);
  }

  FutureOr<void> _onSelectedYear(SelectYear event, Emitter<CommonState> emit) {
    emit(CommonState(selectedYear: event.selectedYear));
  }

  FutureOr<void> _onSelectedMonth(SelectMonth event, Emitter<CommonState> emit) {
    emit(CommonState(selectedMonth: event.selectedMonth));
  }

  FutureOr<void> _onSelectedExpenseType(SelectIncomeExpenseType event, Emitter<CommonState> emit) {
    emit(TypeLoadingState());
    emit(CommonState(incomeExpenseType: event.incomeExpenseType));
  }

  FutureOr<void> _onSelectedDate(SelecteDate event, Emitter<CommonState> emit) {
    emit(CommonState(selectedDate: event.selectedDate));
  }
}
