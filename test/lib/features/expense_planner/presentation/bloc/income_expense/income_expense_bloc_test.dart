import 'package:bloc_test/bloc_test.dart';
import 'package:expense_planner/features/expense_planner/domain/entities/income_expense_data/income_expense_data_entity.dart';
import 'package:expense_planner/features/expense_planner/domain/entities/income_expense_type/income_expense_type_entity.dart';
import 'package:expense_planner/features/expense_planner/presentation/bloc/income_expense/income_expense_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:expense_planner/features/expense_planner/domain/usecases/income_expense_data/income_expense_data_usecase.dart';
import 'package:expense_planner/features/expense_planner/domain/usecases/income_expense_type/income_expense_type_usecase.dart';

import 'income_expense_bloc_test.mocks.dart';

@GenerateMocks([
  AddIncomeExpenseTypeUsecase,
  UpdateIncomeExpenseTypeUsecase,
  DeleteIncomeExpenseTypeUsecase,
  FetchIncomeExpenseTypeUsecase,
  AddIncomeExpenseDataUsecase,
  UpdateIncomeExpenseDataUsecase,
  DeleteIncomeExpenseDataUsecase,
  FetchIncomeExpenseDataUsecase,
])
void main() {
  late IncomeExpenseTypeEntity typeEntity;
  late IncomeExpenseDataEntity dataEntity;
  late AddIncomeExpenseTypeUsecase addIncomeExpenseTypeUsecase;
  late UpdateIncomeExpenseTypeUsecase updateIncomeExpenseTypeUsecase;
  late DeleteIncomeExpenseTypeUsecase deleteIncomeExpenseTypeUsecase;
  late FetchIncomeExpenseTypeUsecase fetchIncomeExpenseTypeUsecase;
  late AddIncomeExpenseDataUsecase addIncomeExpenseDataUsecase;
  late UpdateIncomeExpenseDataUsecase updateIncomeExpenseDataUsecase;
  late DeleteIncomeExpenseDataUsecase deleteIncomeExpenseDataUsecase;
  late FetchIncomeExpenseDataUsecase fetchIncomeExpenseDataUsecase;

  setUp(() {
    typeEntity = const IncomeExpenseTypeEntity(
      id: '456123',
      typeName: 'Salary',
      isIncomeType: 1,
    );
    dataEntity = const IncomeExpenseDataEntity(
        id: '1',
        description: 'description',
        addDate: '2022-01-01',
        amount: '5000',
        isIncome: 1,
        incomeExpenseTypeId: '456123');

    addIncomeExpenseTypeUsecase = MockAddIncomeExpenseTypeUsecase();
    updateIncomeExpenseTypeUsecase = MockUpdateIncomeExpenseTypeUsecase();
    deleteIncomeExpenseTypeUsecase = MockDeleteIncomeExpenseTypeUsecase();
    fetchIncomeExpenseTypeUsecase = MockFetchIncomeExpenseTypeUsecase();

    addIncomeExpenseDataUsecase = MockAddIncomeExpenseDataUsecase();
    updateIncomeExpenseDataUsecase = MockUpdateIncomeExpenseDataUsecase();
    deleteIncomeExpenseDataUsecase = MockDeleteIncomeExpenseDataUsecase();
    fetchIncomeExpenseDataUsecase = MockFetchIncomeExpenseDataUsecase();
  });

//! Income Expense type Bloc Test

  blocTest<IncomeExpenseBloc, IncomeExpenseState>(
    'Income Expense Bloc Initial State ',
    build: () => IncomeExpenseBloc(
        addIncomeExpenseTypeUsecase,
        updateIncomeExpenseTypeUsecase,
        deleteIncomeExpenseTypeUsecase,
        fetchIncomeExpenseTypeUsecase,
        addIncomeExpenseDataUsecase,
        updateIncomeExpenseDataUsecase,
        deleteIncomeExpenseDataUsecase,
        fetchIncomeExpenseDataUsecase),
    verify: (bloc) => expect(
      bloc.state,
      const IncomeExpenseDataLoaded(
        typeList: [],
        dataList: [],
      ),
    ),
  );

  blocTest<IncomeExpenseBloc, IncomeExpenseState>(
    'Add Income Expense Type Event',
    build: () {
      when(addIncomeExpenseTypeUsecase.execute(typeEntity))
          .thenAnswer((realInvocation) async => true);
      return IncomeExpenseBloc(
        addIncomeExpenseTypeUsecase,
        updateIncomeExpenseTypeUsecase,
        deleteIncomeExpenseTypeUsecase,
        fetchIncomeExpenseTypeUsecase,
        addIncomeExpenseDataUsecase,
        updateIncomeExpenseDataUsecase,
        deleteIncomeExpenseDataUsecase,
        fetchIncomeExpenseDataUsecase,
      );
    },
    act: (bloc) => bloc.add(AddIncomeExpenseType(incomeExpenseTypeEntity: typeEntity)),
    expect: () => <IncomeExpenseState>[
      IncomeExpenseDataLoaded(
        typeList: [typeEntity],
        dataList: const [],
      )
    ],
  );
  blocTest<IncomeExpenseBloc, IncomeExpenseState>(
    'Update Income Expense Type Event',
    build: () {
      when(updateIncomeExpenseTypeUsecase.execute(typeEntity))
          .thenAnswer((realInvocation) async => true);
      return IncomeExpenseBloc(
        addIncomeExpenseTypeUsecase,
        updateIncomeExpenseTypeUsecase,
        deleteIncomeExpenseTypeUsecase,
        fetchIncomeExpenseTypeUsecase,
        addIncomeExpenseDataUsecase,
        updateIncomeExpenseDataUsecase,
        deleteIncomeExpenseDataUsecase,
        fetchIncomeExpenseDataUsecase,
      );
    },
    act: (bloc) => bloc.add(UpdateIncomeExpenseType(incomeExpenseTypeEntity: typeEntity)),
    expect: () => <IncomeExpenseState>[
      IncomeExpenseDataLoaded(
        typeList: [typeEntity],
        dataList: const [],
      )
    ],
  );

  blocTest<IncomeExpenseBloc, IncomeExpenseState>(
    'Delete Income Expense Type Event',
    build: () {
      when(deleteIncomeExpenseTypeUsecase.execute(typeEntity))
          .thenAnswer((realInvocation) async => true);
      return IncomeExpenseBloc(
        addIncomeExpenseTypeUsecase,
        updateIncomeExpenseTypeUsecase,
        deleteIncomeExpenseTypeUsecase,
        fetchIncomeExpenseTypeUsecase,
        addIncomeExpenseDataUsecase,
        updateIncomeExpenseDataUsecase,
        deleteIncomeExpenseDataUsecase,
        fetchIncomeExpenseDataUsecase,
      );
    },
    act: (bloc) => bloc.add(DeleteIncomeExpenseType(incomeExpenseTypeEntity: typeEntity)),
    expect: () => <IncomeExpenseState>[
      const IncomeExpenseDataLoaded(
        typeList: [],
        dataList: [],
      )
    ],
  );

  blocTest<IncomeExpenseBloc, IncomeExpenseState>(
    'Fetch Income Expense Type Event',
    build: () {
      when(fetchIncomeExpenseTypeUsecase.execute())
          .thenAnswer((realInvocation) async => [typeEntity]);
      return IncomeExpenseBloc(
        addIncomeExpenseTypeUsecase,
        updateIncomeExpenseTypeUsecase,
        deleteIncomeExpenseTypeUsecase,
        fetchIncomeExpenseTypeUsecase,
        addIncomeExpenseDataUsecase,
        updateIncomeExpenseDataUsecase,
        deleteIncomeExpenseDataUsecase,
        fetchIncomeExpenseDataUsecase,
      );
    },
    act: (bloc) => bloc.add(FetchIncomeExpenseType()),
    expect: () => <IncomeExpenseState>[
      IncomeExpenseDataLoaded(
        typeList: [typeEntity],
        dataList: const [],
      )
    ],
  );

  //! Income Expense data Bloc Test

  blocTest<IncomeExpenseBloc, IncomeExpenseState>(
    'Add Income Expense Data Event',
    build: () {
      when(addIncomeExpenseDataUsecase.execute(dataEntity))
          .thenAnswer((realInvocation) async => true);
      return IncomeExpenseBloc(
        addIncomeExpenseTypeUsecase,
        updateIncomeExpenseTypeUsecase,
        deleteIncomeExpenseTypeUsecase,
        fetchIncomeExpenseTypeUsecase,
        addIncomeExpenseDataUsecase,
        updateIncomeExpenseDataUsecase,
        deleteIncomeExpenseDataUsecase,
        fetchIncomeExpenseDataUsecase,
      );
    },
    act: (bloc) => bloc.add(AddIncomeExpenseData(incomeExpenseDataEntity: dataEntity)),
    expect: () => <IncomeExpenseState>[
      IncomeExpenseDataLoaded(
        typeList: const [],
        dataList: [dataEntity],
      )
    ],
  );

  blocTest<IncomeExpenseBloc, IncomeExpenseState>(
    'Update Income Expense Data Event',
    build: () {
      when(updateIncomeExpenseDataUsecase.execute(dataEntity))
          .thenAnswer((realInvocation) async => true);
      return IncomeExpenseBloc(
        addIncomeExpenseTypeUsecase,
        updateIncomeExpenseTypeUsecase,
        deleteIncomeExpenseTypeUsecase,
        fetchIncomeExpenseTypeUsecase,
        addIncomeExpenseDataUsecase,
        updateIncomeExpenseDataUsecase,
        deleteIncomeExpenseDataUsecase,
        fetchIncomeExpenseDataUsecase,
      );
    },
    act: (bloc) => bloc.add(UpdateIncomeExpenseData(incomeExpenseDataEntity: dataEntity)),
    expect: () => <IncomeExpenseState>[
      IncomeExpenseDataLoaded(
        typeList: const [],
        dataList: [dataEntity],
      )
    ],
  );

  blocTest<IncomeExpenseBloc, IncomeExpenseState>(
    'Delete Income Expense Data Event',
    build: () {
      when(deleteIncomeExpenseDataUsecase.execute(dataEntity))
          .thenAnswer((realInvocation) async => true);
      return IncomeExpenseBloc(
        addIncomeExpenseTypeUsecase,
        updateIncomeExpenseTypeUsecase,
        deleteIncomeExpenseTypeUsecase,
        fetchIncomeExpenseTypeUsecase,
        addIncomeExpenseDataUsecase,
        updateIncomeExpenseDataUsecase,
        deleteIncomeExpenseDataUsecase,
        fetchIncomeExpenseDataUsecase,
      );
    },
    act: (bloc) => bloc.add(DeleteIncomeExpenseData(incomeExpenseDataEntity: dataEntity)),
    expect: () => <IncomeExpenseState>[
      const IncomeExpenseDataLoaded(
        typeList: [],
        dataList: [],
      )
    ],
  );

  blocTest<IncomeExpenseBloc, IncomeExpenseState>(
    'Fetch Income Expense Data Event',
    build: () {
      when(fetchIncomeExpenseDataUsecase.execute())
          .thenAnswer((realInvocation) async => [dataEntity]);
      return IncomeExpenseBloc(
        addIncomeExpenseTypeUsecase,
        updateIncomeExpenseTypeUsecase,
        deleteIncomeExpenseTypeUsecase,
        fetchIncomeExpenseTypeUsecase,
        addIncomeExpenseDataUsecase,
        updateIncomeExpenseDataUsecase,
        deleteIncomeExpenseDataUsecase,
        fetchIncomeExpenseDataUsecase,
      );
    },
    act: (bloc) => bloc.add(FetchIncomeExpenseData()),
    expect: () => <IncomeExpenseState>[
      IncomeExpenseDataLoaded(
        typeList: const [],
        dataList: [dataEntity],
      )
    ],
  );
}
