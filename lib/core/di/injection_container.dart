import 'package:expense_planner/features/expense_planner/data/datasources/income_expense_type/income_expense_type_datasource.dart';
import 'package:expense_planner/features/expense_planner/data/repositories/income_expense_type/income_expense_type_repositroy_impl.dart';
import 'package:expense_planner/features/expense_planner/domain/repositories/income_expense_type/income_expense_type_repositroy.dart';
import 'package:expense_planner/features/expense_planner/domain/usecases/income_expense_type/income_expense_type_usecase.dart';
import 'package:expense_planner/features/expense_planner/presentation/bloc/common_bloc/common_bloc.dart';
import 'package:expense_planner/features/expense_planner/presentation/bloc/currency/currency_type_bloc.dart';
import 'package:expense_planner/features/expense_planner/presentation/bloc/income_expense/income_expense_bloc.dart';

import 'package:get_it/get_it.dart';
import 'package:expense_planner/features/expense_planner/data/datasources/currency/currency_type_datasource.dart';
import 'package:expense_planner/features/expense_planner/data/repositories/currency/currency_type_repositroy_impl.dart';
import 'package:expense_planner/features/expense_planner/data/datasources/income_expense_data/income_expense_data_datasource.dart';
import 'package:expense_planner/features/expense_planner/data/repositories/income_expense_data/income_expense_data_repositroy_impl.dart';
import 'package:expense_planner/features/expense_planner/domain/repositories/currency/currency_type_repositroy.dart';
import 'package:expense_planner/features/expense_planner/domain/usecases/currency/currency_type_usecase.dart';
import 'package:expense_planner/features/expense_planner/domain/repositories/income_expense_data/income_expense_data_repositroy.dart';
import 'package:expense_planner/features/expense_planner/domain/usecases/income_expense_data/income_expense_data_usecase.dart';

import 'package:shared_preferences/shared_preferences.dart';

GetIt sl = GetIt.instance;

Future<void> init() async {
  //! Bloc
  sl.registerFactory(() => CommonBloc());
  sl.registerFactory(() => CurrencyTypeBloc(sl(), sl(), sl()));
  sl.registerFactory(() => IncomeExpenseBloc(sl(), sl(), sl(), sl(), sl(), sl(), sl(), sl()));

  //! Usecase
  //? Income Expense Type Usecase
  sl.registerLazySingleton(() => FetchIncomeExpenseTypeUsecase(incomeExpenseTypeRepository: sl()));
  sl.registerLazySingleton(() => AddIncomeExpenseTypeUsecase(incomeExpenseTypeRepository: sl()));
  sl.registerLazySingleton(() => UpdateIncomeExpenseTypeUsecase(incomeExpenseTypeRepository: sl()));
  sl.registerLazySingleton(() => DeleteIncomeExpenseTypeUsecase(incomeExpenseTypeRepository: sl()));

  //? Income Expense Data Usecase
  sl.registerLazySingleton(() => FetchIncomeExpenseDataUsecase(incomeExpenseDataRepository: sl()));
  // sl.registerLazySingleton(() => CustomeFetchQueryUsecase(incomeExpenseDataRepository: sl()));
  sl.registerLazySingleton(() => AddIncomeExpenseDataUsecase(incomeExpenseDataRepository: sl()));
  sl.registerLazySingleton(() => UpdateIncomeExpenseDataUsecase(incomeExpenseDataRepository: sl()));
  sl.registerLazySingleton(() => DeleteIncomeExpenseDataUsecase(incomeExpenseDataRepository: sl()));

  //? Currency Usecase
  sl.registerLazySingleton(() => FetchCurrencyTypeUsecase(currencyTypeRepository: sl()));
  sl.registerLazySingleton(() => AddCurrencyTypeUsecase(currencyTypeRepository: sl()));
  sl.registerLazySingleton(() => UpdateCurrencyTypeUsecase(currencyTypeRepository: sl()));

  //! Repository
  //? Income Expense Type Repositroy
  sl.registerLazySingleton<IncomeExpenseTypeRepository>(
      () => IncomeExpenseTypeRepositoryImpl(incomeExpenseTypeDatasource: sl()));

  //? Income Expense Data Repositroy
  sl.registerLazySingleton<IncomeExpenseDataRepository>(
      () => IncomeExpenseDataRepositoryImpl(incomeExpenseDatasource: sl()));

  //? Currency Repositroy
  sl.registerLazySingleton<CurrencyTypeRepository>(
      () => CurrencyTypeRepositoryImpl(currencyTypeDatasource: sl()));

  //! Data sources
  //? Income Expense Type Datasource
  sl.registerLazySingleton<IncomeExpenseTypeDatasource>(() => IncomeTypeDatasourceImpl());
  //? Income Expense Data Datasource
  sl.registerLazySingleton<IncomeExpenseDatasource>(() => IncomeExpenseDatasourceImpl());

  //! Currency sources
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton<CurrencyTypeDatasource>(() => CurrencyTypeDatasourceImpl());
}
