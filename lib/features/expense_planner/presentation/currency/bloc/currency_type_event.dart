part of 'currency_type_bloc.dart';

abstract class CurrencyTypeEvent extends Equatable {
  const CurrencyTypeEvent();

  @override
  List<Object> get props => [];
}

class FetchCurrency extends CurrencyTypeEvent {}

class AddCurrency extends CurrencyTypeEvent {
  final CurrencyTypeEntity currencyTypeEntity;
  const AddCurrency({
    required this.currencyTypeEntity,
  });

  @override
  List<Object> get props => [currencyTypeEntity];
}

class UpdateCurrency extends CurrencyTypeEvent {
  final CurrencyTypeEntity currencyTypeEntity;
  const UpdateCurrency({
    required this.currencyTypeEntity,
  });

  @override
  List<Object> get props => [currencyTypeEntity];
}

class DeleteCurrency extends CurrencyTypeEvent {
  final CurrencyTypeEntity currencyTypeEntity;
  const DeleteCurrency({
    required this.currencyTypeEntity,
  });
  @override
  List<Object> get props => [currencyTypeEntity];
}
