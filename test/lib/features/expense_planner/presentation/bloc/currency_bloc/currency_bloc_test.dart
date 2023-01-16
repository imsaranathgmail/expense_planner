import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:expense_planner/features/expense_planner/domain/entities/currency/currency_type_entity.dart';
import 'package:expense_planner/features/expense_planner/domain/usecases/currency/currency_type_usecase.dart';
import 'package:expense_planner/features/expense_planner/presentation/bloc/currency/currency_type_bloc.dart';

import 'currency_bloc_test.mocks.dart';

// class MockAddCurrencyTypeUsecase extends Mock implements AddCurrencyTypeUsecase {}

// class MockUpdateCurrencyTypeUsecase extends Mock implements UpdateCurrencyTypeUsecase {}

// class MockFetchCurrencyTypeUsecase extends Mock implements FetchCurrencyTypeUsecase {}

@GenerateMocks([
  AddCurrencyTypeUsecase,
  UpdateCurrencyTypeUsecase,
  FetchCurrencyTypeUsecase,
])
void main() {
  late CurrencyTypeEntity currencyTypeEntity;
  late AddCurrencyTypeUsecase mockAddCurrencyTypeUsecase;
  late UpdateCurrencyTypeUsecase mockUpdateCurrencyTypeUsecase;
  late FetchCurrencyTypeUsecase mockFetchCurrencyTypeUsecase;

  setUp(() {
    currencyTypeEntity =
        const CurrencyTypeEntity(id: '1', currencyName: 'LKR', currencySymbol: 'Rs');
    mockAddCurrencyTypeUsecase = MockAddCurrencyTypeUsecase();
    mockUpdateCurrencyTypeUsecase = MockUpdateCurrencyTypeUsecase();
    mockFetchCurrencyTypeUsecase = MockFetchCurrencyTypeUsecase();
  });

  blocTest<CurrencyTypeBloc, CurrencyTypeState>(
    'Initial CurrencyTypeState should be CurrencyTypeState(currencyList: [])',
    build: () => CurrencyTypeBloc(
      mockAddCurrencyTypeUsecase,
      mockUpdateCurrencyTypeUsecase,
      mockFetchCurrencyTypeUsecase,
    ),
    verify: (typeState) => expect(
      typeState.state,
      const CurrencyLoadedState(
        currencyList: [],
      ),
    ),
  );

  blocTest<CurrencyTypeBloc, CurrencyTypeState>(
    'AddCurrency event',
    build: () {
      when(mockAddCurrencyTypeUsecase.execute(currencyTypeEntity)).thenAnswer((_) async => true);
      return CurrencyTypeBloc(
        mockAddCurrencyTypeUsecase,
        mockUpdateCurrencyTypeUsecase,
        mockFetchCurrencyTypeUsecase,
      );
    },
    act: (bloc) => bloc.add(AddCurrency(currencyTypeEntity: currencyTypeEntity)),
    expect: () => [
      CurrencyLoadedState(currencyList: [currencyTypeEntity]),
    ],
  );

  blocTest<CurrencyTypeBloc, CurrencyTypeState>(
    'UpdateCurrency event',
    build: () {
      when(mockUpdateCurrencyTypeUsecase.execute(currencyTypeEntity)).thenAnswer((_) async => true);
      return CurrencyTypeBloc(
        mockAddCurrencyTypeUsecase,
        mockUpdateCurrencyTypeUsecase,
        mockFetchCurrencyTypeUsecase,
      );
    },
    act: (bloc) => bloc.add(UpdateCurrency(currencyTypeEntity: currencyTypeEntity)),
    expect: () => [
      CurrencyLoadedState(currencyList: [currencyTypeEntity])
    ],
  );

  blocTest<CurrencyTypeBloc, CurrencyTypeState>(
    'FetchCurrency event',
    build: () {
      when(mockFetchCurrencyTypeUsecase.execute()).thenAnswer((_) async => [currencyTypeEntity]);
      return CurrencyTypeBloc(
        mockAddCurrencyTypeUsecase,
        mockUpdateCurrencyTypeUsecase,
        mockFetchCurrencyTypeUsecase,
      );
    },
    act: (bloc) => bloc.add(FetchCurrency()),
    expect: () => [
      CurrencyLoadedState(currencyList: [currencyTypeEntity])
    ],
  );
}
