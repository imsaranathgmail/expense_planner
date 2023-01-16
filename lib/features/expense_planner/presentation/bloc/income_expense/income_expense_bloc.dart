// ignore_for_file: public_member_api_docs, sort_constructors_first, depend_on_referenced_packages
import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:expense_planner/features/expense_planner/domain/entities/income_expense_data/income_expense_data_entity.dart';
import 'package:expense_planner/features/expense_planner/domain/usecases/income_expense_data/income_expense_data_usecase.dart';
import 'package:expense_planner/features/expense_planner/domain/entities/income_expense_type/income_expense_type_entity.dart';
import 'package:expense_planner/features/expense_planner/domain/usecases/income_expense_type/income_expense_type_usecase.dart';
import 'package:expense_planner/core/helper/constants.dart';

part 'income_expense_event.dart';
part 'income_expense_state.dart';

class IncomeExpenseBloc extends Bloc<IncomeExpenseEvent, IncomeExpenseState> {
  final AddIncomeExpenseTypeUsecase addIncomeExpenseTypeUsecase;
  final UpdateIncomeExpenseTypeUsecase updateIncomeExpenseTypeUsecase;
  final DeleteIncomeExpenseTypeUsecase deleteIncomeExpenseTypeUsecase;
  final FetchIncomeExpenseTypeUsecase fetchIncomeExpenseTypeUsecase;
  final AddIncomeExpenseDataUsecase addIncomeExpenseDataUsecase;
  final UpdateIncomeExpenseDataUsecase updateIncomeExpenseDataUsecase;
  final DeleteIncomeExpenseDataUsecase deleteIncomeExpenseDataUsecase;
  final FetchIncomeExpenseDataUsecase fetchIncomeExpenseDataUsecase;
  IncomeExpenseBloc(
    this.addIncomeExpenseTypeUsecase,
    this.updateIncomeExpenseTypeUsecase,
    this.deleteIncomeExpenseTypeUsecase,
    this.fetchIncomeExpenseTypeUsecase,
    this.addIncomeExpenseDataUsecase,
    this.updateIncomeExpenseDataUsecase,
    this.deleteIncomeExpenseDataUsecase,
    this.fetchIncomeExpenseDataUsecase,
  ) : super(const IncomeExpenseDataLoaded(typeList: [], dataList: [])) {
    //! Fetch both Type and Data
    on<FetchBothTypeAndData>(_onFetchBothTypeData);
    //! Income Expense Type
    on<FetchIncomeExpenseType>(_onFetchIncomeExpenseType);
    on<AddIncomeExpenseType>(_onAddIncomeExpenseType);
    on<UpdateIncomeExpenseType>(_onUpdateIncomeExpenseType);
    on<DeleteIncomeExpenseType>(_onDeleteIncomeExpenseType);
    //! Income Expense Data
    on<FetchIncomeExpenseData>(_onFetchIncomeExpenseData);
    on<AddIncomeExpenseData>(_onAddIncomeExpenseData);
    on<UpdateIncomeExpenseData>(_onUpdateIncomeExpenseData);
    on<DeleteIncomeExpenseData>(_onDeleteIncomeExpenseData);
  }

//! Income Expense Type

  FutureOr<void> _onFetchIncomeExpenseType(
      FetchIncomeExpenseType event, Emitter<IncomeExpenseState> emit) async {
    final state = this.state;
    final typeList = await fetchIncomeExpenseTypeUsecase.execute();
    emit(
      IncomeExpenseDataLoaded(
        typeList: typeList,
        dataList: state.dataList,
      ),
    );
  }

  FutureOr<void> _onAddIncomeExpenseType(
      AddIncomeExpenseType event, Emitter<IncomeExpenseState> emit) async {
    final state = this.state;
    final dataEntity = event.incomeExpenseTypeEntity;

    final result = await addIncomeExpenseTypeUsecase.execute(dataEntity);
    if (result) {
      emit(
        IncomeExpenseDataLoaded(
          typeList: List.from(state.typeList)..add(dataEntity),
          dataList: state.dataList,
        ),
      );
    } else {
      emit(
        ErrorState(dataEntity.isIncomeType == isIncome ? incomeTypeTxt : expenseTypeTxt + notSaved,
            typeList: state.typeList, dataList: state.dataList),
      );
    }
  }

  FutureOr<void> _onUpdateIncomeExpenseType(
      UpdateIncomeExpenseType event, Emitter<IncomeExpenseState> emit) async {
    final state = this.state;
    final dataEntity = event.incomeExpenseTypeEntity;

    final result = await updateIncomeExpenseTypeUsecase.execute(dataEntity);
    if (result) {
      List<IncomeExpenseTypeEntity> typeList = state.typeList;

      typeList = List.from(typeList)
        ..removeWhere((element) => element.id == dataEntity.id)
        ..insert(0, dataEntity);
      emit(
        IncomeExpenseDataLoaded(
          typeList: typeList,
          dataList: state.dataList,
        ),
      );
    } else {
      emit(
        ErrorState(
            dataEntity.isIncomeType == isIncome ? incomeTypeTxt : expenseTypeTxt + notUpdated,
            typeList: state.typeList,
            dataList: state.dataList),
      );
    }
  }

  FutureOr<void> _onDeleteIncomeExpenseType(
      DeleteIncomeExpenseType event, Emitter<IncomeExpenseState> emit) async {
    final state = this.state;
    final dataEntity = event.incomeExpenseTypeEntity;

    final result = await deleteIncomeExpenseTypeUsecase.execute(dataEntity);
    if (result) {
      List<IncomeExpenseTypeEntity> typeList = state.typeList;
      List<IncomeExpenseDataEntity> dataList = state.dataList;

      typeList = List.from(state.typeList)..removeWhere((element) => element.id == dataEntity.id);
      dataList = List.from(state.dataList)
        ..removeWhere((element) => element.incomeExpenseTypeId == dataEntity.id);
      emit(
        IncomeExpenseDataLoaded(
          typeList: typeList,
          dataList: dataList,
        ),
      );
    } else {
      emit(
        ErrorState(
            dataEntity.isIncomeType == isIncome ? incomeTypeTxt : expenseTypeTxt + notDeleted,
            typeList: state.typeList,
            dataList: state.dataList),
      );
    }
  }

  //! Income Expense Data

  FutureOr<void> _onFetchIncomeExpenseData(
      FetchIncomeExpenseData event, Emitter<IncomeExpenseState> emit) async {
    final state = this.state;
    final dataList = await fetchIncomeExpenseDataUsecase.execute();
    if (dataList.isNotEmpty) {
      emit(
        IncomeExpenseDataLoaded(
          typeList: state.typeList,
          dataList: dataList,
        ),
      );
    } else {
      emit(
        ErrorState(incomeExpenseDataTxt + notLoaded,
            typeList: state.typeList, dataList: state.dataList),
      );
    }
  }

  FutureOr<void> _onAddIncomeExpenseData(
      AddIncomeExpenseData event, Emitter<IncomeExpenseState> emit) async {
    final state = this.state;
    final dataEntity = event.incomeExpenseDataEntity;

    final result = await addIncomeExpenseDataUsecase.execute(dataEntity);
    if (result) {
      emit(
        IncomeExpenseDataLoaded(
          typeList: state.typeList,
          dataList: List.from(state.dataList)..add(dataEntity),
          // dataList: state.dataList,
        ),
      );
    } else {
      emit(
        ErrorState(dataEntity.isIncome == isIncome ? incomeDataTxt : expenseDataTxt + notSaved,
            typeList: state.typeList, dataList: state.dataList),
      );
    }
  }

  FutureOr<void> _onUpdateIncomeExpenseData(
      UpdateIncomeExpenseData event, Emitter<IncomeExpenseState> emit) async {
    final state = this.state;
    final dataEntity = event.incomeExpenseDataEntity;

    final result = await updateIncomeExpenseDataUsecase.execute(dataEntity);
    if (result) {
      List<IncomeExpenseDataEntity> dataList = state.dataList;

      dataList = List.from(dataList)
        ..removeWhere((element) => element.id == dataEntity.id)
        ..insert(0, dataEntity);
      emit(
        IncomeExpenseDataLoaded(
          typeList: state.typeList,
          dataList: dataList,
          // dataList: state.dataList,
        ),
      );
    } else {
      emit(
        ErrorState(dataEntity.isIncome == isIncome ? incomeDataTxt : expenseDataTxt + notUpdated,
            typeList: state.typeList, dataList: state.dataList),
      );
    }
  }

  FutureOr<void> _onDeleteIncomeExpenseData(
      DeleteIncomeExpenseData event, Emitter<IncomeExpenseState> emit) async {
    final state = this.state;
    final dataEntity = event.incomeExpenseDataEntity;

    final result = await deleteIncomeExpenseDataUsecase.execute(dataEntity);
    if (result) {
      List<IncomeExpenseDataEntity> dataList = state.dataList;

      dataList = List.from(dataList)..removeWhere((element) => element.id == dataEntity.id);
      emit(
        IncomeExpenseDataLoaded(
          typeList: state.typeList,
          dataList: dataList,
        ),
      );
    } else {
      emit(
        ErrorState(dataEntity.isIncome == isIncome ? incomeDataTxt : expenseDataTxt + notDeleted,
            typeList: state.typeList, dataList: state.dataList),
      );
    }
  }

  FutureOr<void> _onFetchBothTypeData(
      FetchBothTypeAndData event, Emitter<IncomeExpenseState> emit) async {
    final typeList = await fetchIncomeExpenseTypeUsecase.execute();
    final dataList = await fetchIncomeExpenseDataUsecase.execute();
    emit(
      IncomeExpenseDataLoaded(
        typeList: typeList,
        dataList: dataList,
      ),
    );
  }
}
