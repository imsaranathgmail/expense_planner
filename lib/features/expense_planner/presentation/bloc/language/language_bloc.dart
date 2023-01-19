// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:expense_planner/core/language/languages_list.dart';
import 'package:expense_planner/features/expense_planner/domain/entities/language/language_entity.dart';
import 'package:flutter/cupertino.dart';

part 'language_event.dart';
part 'language_state.dart';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  LanguageBloc() : super(LanguageLoaded(locale: Locale(LanguagesList.languages[0].code))) {
    on<ToggledLanguageEvent>((event, emit) {
      emit(LanguageLoaded(locale: Locale(event.languageEntity.code)));
    });
  }
}
