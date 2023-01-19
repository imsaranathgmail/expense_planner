// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'language_bloc.dart';

abstract class LanguageState extends Equatable {
  const LanguageState();

  @override
  List<Object> get props => [];
}

class LanguageLoaded extends LanguageState {
  final Locale locale;
  const LanguageLoaded({
    required this.locale,
  });
  @override
  List<Object> get props => [locale.languageCode];
}
