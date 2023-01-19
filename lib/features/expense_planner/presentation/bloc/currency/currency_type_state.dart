// ignore_for_file: public_member_api_docs, sort_constructors_first, overridden_fields
part of 'currency_type_bloc.dart';

abstract class CurrencyTypeState extends Equatable {
  final List<CurrencyTypeEntity> currencyList;
  const CurrencyTypeState({
    required this.currencyList,
  });
}

class CurrencyLoadedState extends CurrencyTypeState {
  @override
  final List<CurrencyTypeEntity> currencyList;
  const CurrencyLoadedState({
    required this.currencyList,
  }) : super(currencyList: currencyList);

  CurrencyLoadedState copyWith({
    List<CurrencyTypeEntity>? currencyList,
  }) {
    return CurrencyLoadedState(
      currencyList: currencyList ?? this.currencyList,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'currencyList': currencyList.map((x) => x.toMap()).toList(),
    };
  }

  factory CurrencyLoadedState.fromMap(Map<String, dynamic> map) {
    return CurrencyLoadedState(
      currencyList: List<CurrencyTypeEntity>.from(
        (map['currencyList'] as List<int>).map<CurrencyTypeEntity>(
          (x) => CurrencyTypeEntity.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  @override
  List<Object?> get props => [currencyList];
}

class ErrorState extends CurrencyTypeState {
  final String message;

  const ErrorState(this.message, {required super.currencyList});

  @override
  List<Object?> get props => [message];
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
