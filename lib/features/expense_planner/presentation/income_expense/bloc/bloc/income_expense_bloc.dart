// ignore_for_file: public_member_api_docs, sort_constructors_first, depend_on_referenced_packages
import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:expense_planner/features/expense_planner/domain/income_expense_data/entities/income_expense_data_entity.dart';
import 'package:expense_planner/features/expense_planner/domain/income_expense_data/usecases/income_expense_data_usecase.dart';
import 'package:expense_planner/features/expense_planner/domain/income_expense_type/entities/income_expense_type_entity.dart';
import 'package:expense_planner/features/expense_planner/domain/income_expense_type/usecases/income_expense_type_usecase.dart';

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
  ) : super(LoadingState()) {
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
      IncomeExpenseState(
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
        IncomeExpenseState(
          typeList: List.from(state.typeList)..add(dataEntity),
          dataList: state.dataList,
        ),
      );
    } else {
      emit(
        IncomeExpenseState(
          typeList: state.typeList,
          dataList: state.dataList,
        ),
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
        IncomeExpenseState(
          typeList: typeList,
          dataList: state.dataList,
        ),
      );
    } else {
      emit(
        IncomeExpenseState(
          typeList: state.typeList,
          dataList: state.dataList,
        ),
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

      typeList = List.from(typeList)..removeWhere((element) => element.id == dataEntity.id);
      dataList = List.from(dataList)
        ..removeWhere((element) => element.incomeExpenseTypeId == dataEntity.id);
      emit(
        IncomeExpenseState(
          typeList: typeList,
          dataList: dataList,
        ),
      );
    } else {
      emit(
        IncomeExpenseState(
          typeList: state.typeList,
          dataList: state.dataList,
        ),
      );
    }
  }

  //! Income Expense Data

  FutureOr<void> _onFetchIncomeExpenseData(
      FetchIncomeExpenseData event, Emitter<IncomeExpenseState> emit) async {
    final state = this.state;
    final dataList = await fetchIncomeExpenseDataUsecase.execute();

    emit(
      IncomeExpenseState(
        typeList: state.typeList,
        dataList: dataList,
      ),
    );
  }

  FutureOr<void> _onAddIncomeExpenseData(
      AddIncomeExpenseData event, Emitter<IncomeExpenseState> emit) async {
    final state = this.state;
    final dataEntity = event.incomeExpenseDataEntity;

    final result = await addIncomeExpenseDataUsecase.execute(dataEntity);
    if (result) {
      emit(
        IncomeExpenseState(
          typeList: state.typeList,
          dataList: List.from(state.dataList)..add(dataEntity),
          // dataList: state.dataList,
        ),
      );
    } else {
      emit(
        IncomeExpenseState(
          typeList: state.typeList,
          dataList: state.dataList,
        ),
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
        IncomeExpenseState(
          typeList: state.typeList,
          dataList: dataList,
          // dataList: state.dataList,
        ),
      );
    } else {
      emit(
        IncomeExpenseState(
          typeList: state.typeList,
          dataList: state.dataList,
        ),
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
        IncomeExpenseState(
          typeList: state.typeList,
          dataList: dataList,
        ),
      );
    } else {
      emit(
        IncomeExpenseState(
          typeList: state.typeList,
          dataList: state.dataList,
        ),
      );
    }
  }

  FutureOr<void> _onFetchBothTypeData(
      FetchBothTypeAndData event, Emitter<IncomeExpenseState> emit) async {
    final typeList = await fetchIncomeExpenseTypeUsecase.execute();
    final dataList = await fetchIncomeExpenseDataUsecase.execute();

    emit(
      IncomeExpenseState(
        typeList: typeList,
        dataList: dataList,
      ),
    );
  }
}
