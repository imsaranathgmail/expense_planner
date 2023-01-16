// ignore_for_file: public_member_api_docs, sort_constructors_first, depend_on_referenced_packages
import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:expense_planner/core/helper/currency_symbol_holder.dart';
import 'package:expense_planner/core/helper/list_map_function.dart';

import 'package:expense_planner/features/expense_planner/domain/entities/currency/currency_type_entity.dart';
import 'package:expense_planner/features/expense_planner/domain/usecases/currency/currency_type_usecase.dart';
import 'package:expense_planner/core/helper/constants.dart';

part 'currency_type_event.dart';
part 'currency_type_state.dart';

class CurrencyTypeBloc extends Bloc<CurrencyTypeEvent, CurrencyTypeState> {
  final AddCurrencyTypeUsecase addCurrencyTypeUsecase;
  final UpdateCurrencyTypeUsecase updateCurrencyTypeUsecase;
  final FetchCurrencyTypeUsecase fetchCurrencyTypeUsecase;

  CurrencyTypeBloc(
    this.addCurrencyTypeUsecase,
    this.updateCurrencyTypeUsecase,
    this.fetchCurrencyTypeUsecase,
  ) : super(const CurrencyLoadedState(currencyList: [])) {
    on<AddCurrency>(_onAddCurrency);
    on<UpdateCurrency>(_onUpdateCurrencyType);
    on<FetchCurrency>(_onfetchCurrencyType);
  }

  FutureOr<void> _onAddCurrency(AddCurrency event, Emitter<CurrencyTypeState> emit) async {
    final state = this.state;
    final dataEntity = event.currencyTypeEntity;

    final result = await addCurrencyTypeUsecase.execute(dataEntity);
    if (result) {
      emit(
        CurrencyLoadedState(
          currencyList: List.from(state.currencyList)..add(dataEntity),
        ),
      );
      CurrencySymbolHolder.setCurrencySymbol(dataEntity);
    } else {
      emit(ErrorState(
        currencyTypeTxt + notSaved,
        currencyList: state.currencyList,
      ));
    }
  }

  FutureOr<void> _onUpdateCurrencyType(
      UpdateCurrency event, Emitter<CurrencyTypeState> emit) async {
    final state = this.state;
    final dataEntiry = event.currencyTypeEntity;

    final result = await updateCurrencyTypeUsecase.execute(dataEntiry);
    if (result) {
      List<CurrencyTypeEntity> currencyList = state.currencyList;

      currencyList = List.from(currencyList)
        ..removeWhere((element) => element.id == dataEntiry.id)
        ..insert(0, dataEntiry);
      emit(CurrencyLoadedState(currencyList: currencyList));
      CurrencySymbolHolder.setCurrencySymbol(dataEntiry);
    } else {
      emit(ErrorState(currencyTypeTxt + notUpdated, currencyList: state.currencyList));
    }
  }

  FutureOr<void> _onfetchCurrencyType(FetchCurrency event, Emitter<CurrencyTypeState> emit) async {
    final currencyList = await fetchCurrencyTypeUsecase.execute();
    if (currencyList.isNotEmpty) {
      emit(CurrencyLoadedState(currencyList: currencyList));
      CurrencySymbolHolder.setCurrencySymbol(currencyList.first);
      Future.delayed(const Duration(milliseconds: 50));
    } else {
      emit(ErrorState(currencyTypeTxt + notLoaded, currencyList: state.currencyList));
    }
  }
}
