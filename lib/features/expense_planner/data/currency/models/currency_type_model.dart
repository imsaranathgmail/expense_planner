// ignore_for_file: overridden_fields, annotate_overrides

import 'package:expense_planner/features/expense_planner/domain/currency/entities/currency_type_entity.dart';

class CurrencyTypeModel extends CurrencyTypeEntity {
  final String id;
  final String currencyName;
  final String currencySymbol;
  const CurrencyTypeModel({
    required this.id,
    required this.currencyName,
    required this.currencySymbol,
  }) : super(
          id: id,
          currencyName: currencyName,
          currencySymbol: currencySymbol,
        );

  CurrencyTypeModel copyWith({
    String? id,
    String? currencyName,
    String? currencySymbol,
  }) {
    return CurrencyTypeModel(
      id: id ?? this.id,
      currencyName: currencyName ?? this.currencyName,
      currencySymbol: currencySymbol ?? this.currencySymbol,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'currencyName': currencyName,
      'currencySymbol': currencySymbol,
    };
  }

  factory CurrencyTypeModel.fromMap(Map<String, dynamic> map) {
    return CurrencyTypeModel(
      id: map['id'] as String,
      currencyName: map['currencyName'] as String,
      currencySymbol: map['currencySymbol'] as String,
    );
  }
}
