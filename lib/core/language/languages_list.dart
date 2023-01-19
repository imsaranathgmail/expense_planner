import 'package:expense_planner/features/expense_planner/domain/entities/language/language_entity.dart';

class LanguagesList {
  LanguagesList._();

  static List<LanguageEntity> languages = [
    LanguageEntity(code: 'en', value: 'English'),
    LanguageEntity(code: 'si', value: 'සිංහල'),
  ];
}
