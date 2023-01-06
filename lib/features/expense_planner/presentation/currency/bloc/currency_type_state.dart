part of 'currency_type_bloc.dart';

class CurrencyTypeState extends Equatable {
  final List<CurrencyTypeEntity> currencyList;
  const CurrencyTypeState({
    this.currencyList = const <CurrencyTypeEntity>[],
  });

  @override
  List<Object> get props => [currencyList];

  CurrencyTypeState copyWith({
    List<CurrencyTypeEntity>? currencyList,
  }) {
    return CurrencyTypeState(
      currencyList: currencyList ?? this.currencyList,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'currencyList': currencyList.map((x) => x.toMap()).toList(),
    };
  }

  factory CurrencyTypeState.fromMap(Map<String, dynamic> map) {
    return CurrencyTypeState(
      currencyList: List<CurrencyTypeEntity>.from(
        (map['currencyList'] as List<int>).map<CurrencyTypeEntity>(
          (x) => CurrencyTypeEntity.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }
}


// class CurrencyTypeInitialState extends CurrencyTypeState {}

// class LoadingState extends CurrencyTypeState {}

// class LoadedState extends CurrencyTypeState {
//   final List<CurrencyTypeEntity> dataList;
//   const LoadedState({
//     required this.dataList,
//   }) : super(currencyTypeDataList: dataList);
//   @override
//   List<Object> get props => [dataList];
// }

// class SuccessState extends CurrencyTypeState {
//   final String message;
//   const SuccessState({
//     required this.message,
//   });

//   @override
//   List<Object> get props => [message];
// }

// class ErrorState extends CurrencyTypeState {
//   final String message;
//   const ErrorState({
//     required this.message,
//   });

//   @override
//   List<Object> get props => [message];
// }
