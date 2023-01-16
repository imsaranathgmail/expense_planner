// Mocks generated by Mockito 5.3.2 from annotations
// in expense_planner/test/lib/features/expense_planner/presentation/bloc/income_expense/income_expense_bloc_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;

import 'package:expense_planner/features/expense_planner/domain/entities/income_expense_data/income_expense_data_entity.dart'
    as _i8;
import 'package:expense_planner/features/expense_planner/domain/entities/income_expense_type/income_expense_type_entity.dart'
    as _i6;
import 'package:expense_planner/features/expense_planner/domain/repositories/income_expense_data/income_expense_data_repositroy.dart'
    as _i3;
import 'package:expense_planner/features/expense_planner/domain/repositories/income_expense_type/income_expense_type_repositroy.dart'
    as _i2;
import 'package:expense_planner/features/expense_planner/domain/usecases/income_expense_data/income_expense_data_usecase.dart'
    as _i7;
import 'package:expense_planner/features/expense_planner/domain/usecases/income_expense_type/income_expense_type_usecase.dart'
    as _i4;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeIncomeExpenseTypeRepository_0 extends _i1.SmartFake
    implements _i2.IncomeExpenseTypeRepository {
  _FakeIncomeExpenseTypeRepository_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeIncomeExpenseDataRepository_1 extends _i1.SmartFake
    implements _i3.IncomeExpenseDataRepository {
  _FakeIncomeExpenseDataRepository_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [AddIncomeExpenseTypeUsecase].
///
/// See the documentation for Mockito's code generation for more information.
class MockAddIncomeExpenseTypeUsecase extends _i1.Mock
    implements _i4.AddIncomeExpenseTypeUsecase {
  MockAddIncomeExpenseTypeUsecase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.IncomeExpenseTypeRepository get incomeExpenseTypeRepository =>
      (super.noSuchMethod(
        Invocation.getter(#incomeExpenseTypeRepository),
        returnValue: _FakeIncomeExpenseTypeRepository_0(
          this,
          Invocation.getter(#incomeExpenseTypeRepository),
        ),
      ) as _i2.IncomeExpenseTypeRepository);
  @override
  _i5.Future<bool> execute(
          _i6.IncomeExpenseTypeEntity? incomeExpenseTypeEntity) =>
      (super.noSuchMethod(
        Invocation.method(
          #execute,
          [incomeExpenseTypeEntity],
        ),
        returnValue: _i5.Future<bool>.value(false),
      ) as _i5.Future<bool>);
}

/// A class which mocks [UpdateIncomeExpenseTypeUsecase].
///
/// See the documentation for Mockito's code generation for more information.
class MockUpdateIncomeExpenseTypeUsecase extends _i1.Mock
    implements _i4.UpdateIncomeExpenseTypeUsecase {
  MockUpdateIncomeExpenseTypeUsecase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.IncomeExpenseTypeRepository get incomeExpenseTypeRepository =>
      (super.noSuchMethod(
        Invocation.getter(#incomeExpenseTypeRepository),
        returnValue: _FakeIncomeExpenseTypeRepository_0(
          this,
          Invocation.getter(#incomeExpenseTypeRepository),
        ),
      ) as _i2.IncomeExpenseTypeRepository);
  @override
  _i5.Future<bool> execute(
          _i6.IncomeExpenseTypeEntity? incomeExpenseTypeEntity) =>
      (super.noSuchMethod(
        Invocation.method(
          #execute,
          [incomeExpenseTypeEntity],
        ),
        returnValue: _i5.Future<bool>.value(false),
      ) as _i5.Future<bool>);
}

/// A class which mocks [DeleteIncomeExpenseTypeUsecase].
///
/// See the documentation for Mockito's code generation for more information.
class MockDeleteIncomeExpenseTypeUsecase extends _i1.Mock
    implements _i4.DeleteIncomeExpenseTypeUsecase {
  MockDeleteIncomeExpenseTypeUsecase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.IncomeExpenseTypeRepository get incomeExpenseTypeRepository =>
      (super.noSuchMethod(
        Invocation.getter(#incomeExpenseTypeRepository),
        returnValue: _FakeIncomeExpenseTypeRepository_0(
          this,
          Invocation.getter(#incomeExpenseTypeRepository),
        ),
      ) as _i2.IncomeExpenseTypeRepository);
  @override
  _i5.Future<bool> execute(
          _i6.IncomeExpenseTypeEntity? incomeExpenseTypeEntity) =>
      (super.noSuchMethod(
        Invocation.method(
          #execute,
          [incomeExpenseTypeEntity],
        ),
        returnValue: _i5.Future<bool>.value(false),
      ) as _i5.Future<bool>);
}

/// A class which mocks [FetchIncomeExpenseTypeUsecase].
///
/// See the documentation for Mockito's code generation for more information.
class MockFetchIncomeExpenseTypeUsecase extends _i1.Mock
    implements _i4.FetchIncomeExpenseTypeUsecase {
  MockFetchIncomeExpenseTypeUsecase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.IncomeExpenseTypeRepository get incomeExpenseTypeRepository =>
      (super.noSuchMethod(
        Invocation.getter(#incomeExpenseTypeRepository),
        returnValue: _FakeIncomeExpenseTypeRepository_0(
          this,
          Invocation.getter(#incomeExpenseTypeRepository),
        ),
      ) as _i2.IncomeExpenseTypeRepository);
  @override
  _i5.Future<List<_i6.IncomeExpenseTypeEntity>> execute() =>
      (super.noSuchMethod(
        Invocation.method(
          #execute,
          [],
        ),
        returnValue: _i5.Future<List<_i6.IncomeExpenseTypeEntity>>.value(
            <_i6.IncomeExpenseTypeEntity>[]),
      ) as _i5.Future<List<_i6.IncomeExpenseTypeEntity>>);
}

/// A class which mocks [AddIncomeExpenseDataUsecase].
///
/// See the documentation for Mockito's code generation for more information.
class MockAddIncomeExpenseDataUsecase extends _i1.Mock
    implements _i7.AddIncomeExpenseDataUsecase {
  MockAddIncomeExpenseDataUsecase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.IncomeExpenseDataRepository get incomeExpenseDataRepository =>
      (super.noSuchMethod(
        Invocation.getter(#incomeExpenseDataRepository),
        returnValue: _FakeIncomeExpenseDataRepository_1(
          this,
          Invocation.getter(#incomeExpenseDataRepository),
        ),
      ) as _i3.IncomeExpenseDataRepository);
  @override
  _i5.Future<bool> execute(
          _i8.IncomeExpenseDataEntity? incomeExpenseDataEntity) =>
      (super.noSuchMethod(
        Invocation.method(
          #execute,
          [incomeExpenseDataEntity],
        ),
        returnValue: _i5.Future<bool>.value(false),
      ) as _i5.Future<bool>);
}

/// A class which mocks [UpdateIncomeExpenseDataUsecase].
///
/// See the documentation for Mockito's code generation for more information.
class MockUpdateIncomeExpenseDataUsecase extends _i1.Mock
    implements _i7.UpdateIncomeExpenseDataUsecase {
  MockUpdateIncomeExpenseDataUsecase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.IncomeExpenseDataRepository get incomeExpenseDataRepository =>
      (super.noSuchMethod(
        Invocation.getter(#incomeExpenseDataRepository),
        returnValue: _FakeIncomeExpenseDataRepository_1(
          this,
          Invocation.getter(#incomeExpenseDataRepository),
        ),
      ) as _i3.IncomeExpenseDataRepository);
  @override
  _i5.Future<bool> execute(
          _i8.IncomeExpenseDataEntity? incomeExpenseDataEntity) =>
      (super.noSuchMethod(
        Invocation.method(
          #execute,
          [incomeExpenseDataEntity],
        ),
        returnValue: _i5.Future<bool>.value(false),
      ) as _i5.Future<bool>);
}

/// A class which mocks [DeleteIncomeExpenseDataUsecase].
///
/// See the documentation for Mockito's code generation for more information.
class MockDeleteIncomeExpenseDataUsecase extends _i1.Mock
    implements _i7.DeleteIncomeExpenseDataUsecase {
  MockDeleteIncomeExpenseDataUsecase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.IncomeExpenseDataRepository get incomeExpenseDataRepository =>
      (super.noSuchMethod(
        Invocation.getter(#incomeExpenseDataRepository),
        returnValue: _FakeIncomeExpenseDataRepository_1(
          this,
          Invocation.getter(#incomeExpenseDataRepository),
        ),
      ) as _i3.IncomeExpenseDataRepository);
  @override
  _i5.Future<bool> execute(
          _i8.IncomeExpenseDataEntity? incomeExpenseDataEntity) =>
      (super.noSuchMethod(
        Invocation.method(
          #execute,
          [incomeExpenseDataEntity],
        ),
        returnValue: _i5.Future<bool>.value(false),
      ) as _i5.Future<bool>);
}

/// A class which mocks [FetchIncomeExpenseDataUsecase].
///
/// See the documentation for Mockito's code generation for more information.
class MockFetchIncomeExpenseDataUsecase extends _i1.Mock
    implements _i7.FetchIncomeExpenseDataUsecase {
  MockFetchIncomeExpenseDataUsecase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.IncomeExpenseDataRepository get incomeExpenseDataRepository =>
      (super.noSuchMethod(
        Invocation.getter(#incomeExpenseDataRepository),
        returnValue: _FakeIncomeExpenseDataRepository_1(
          this,
          Invocation.getter(#incomeExpenseDataRepository),
        ),
      ) as _i3.IncomeExpenseDataRepository);
  @override
  _i5.Future<List<_i8.IncomeExpenseDataEntity>> execute() =>
      (super.noSuchMethod(
        Invocation.method(
          #execute,
          [],
        ),
        returnValue: _i5.Future<List<_i8.IncomeExpenseDataEntity>>.value(
            <_i8.IncomeExpenseDataEntity>[]),
      ) as _i5.Future<List<_i8.IncomeExpenseDataEntity>>);
}
