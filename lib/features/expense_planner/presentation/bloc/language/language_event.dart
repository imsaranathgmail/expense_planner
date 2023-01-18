// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'language_bloc.dart';

abstract class LanguageEvent extends Equatable {
  const LanguageEvent();

  @override
  List<Object> get props => [];
}

class ToggledLanguageEvent extends LanguageEvent {
  final LanguageEntity languageEntity;
  const ToggledLanguageEvent({
    required this.languageEntity,
  });

  @override
  List<Object> get props => [languageEntity];
}
