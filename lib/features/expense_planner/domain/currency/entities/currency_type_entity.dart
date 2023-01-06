import 'package:equatable/equatable.dart';

class CurrencyTypeEntity extends Equatable {
  final String id;
  final String currencyName;
  final String currencySymbol;
  const CurrencyTypeEntity({
    required this.id,
    required this.currencyName,
    required this.currencySymbol,
  });

  @override
  List<Object> get props => [id, currencyName, currencySymbol];

  CurrencyTypeEntity copyWith({
    String? id,
    String? currencyName,
    String? currencySymbol,
  }) {
    return CurrencyTypeEntity(
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

  factory CurrencyTypeEntity.fromMap(Map<String, dynamic> map) {
    return CurrencyTypeEntity(
      id: map['id'] as String,
      currencyName: map['currencyName'] as String,
      currencySymbol: map['currencySymbol'] as String,
    );
  }
}
