import 'package:expense_planner/features/expense_planner/domain/income_expense_type/repositories/income_expense_type_repositroy.dart';
import 'package:expense_planner/features/expense_planner/domain/income_expense_type/usecases/income_expense_type_usecase.dart';
import 'package:expense_planner/features/expense_planner/presentation/income_expense/bloc/income_expense_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:expense_planner/features/expense_planner/data/currency/datasources/currency_type_datasource.dart';
import 'package:expense_planner/features/expense_planner/data/currency/repositories/currency_type_repositroy_impl.dart';
import 'package:expense_planner/features/expense_planner/data/income_expense_data/datasources/income_expense_data_datasource.dart';
import 'package:expense_planner/features/expense_planner/data/income_expense_data/repositories/income_expense_data_repositroy_impl.dart';
import 'package:expense_planner/features/expense_planner/data/income_expense_type/income_type/datasources/income_expense_type_datasource.dart';
import 'package:expense_planner/features/expense_planner/data/income_expense_type/income_type/repositories/income_expense_type_repositroy_impl.dart';
import 'package:expense_planner/features/expense_planner/domain/currency/repositories/expense_type_repositroy.dart';
import 'package:expense_planner/features/expense_planner/domain/currency/usecases/expense_type_usecase.dart';
import 'package:expense_planner/features/expense_planner/domain/income_expense_data/repositories/income_expense_data_repositroy.dart';
import 'package:expense_planner/features/expense_planner/domain/income_expense_data/usecases/income_expense_data_usecase.dart';
import 'package:expense_planner/features/expense_planner/presentation/common_bloc/common_bloc.dart';
import 'package:expense_planner/features/expense_planner/presentation/currency/bloc/currency_type_bloc.dart';
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
  sl.registerLazySingleton(() => CustomeFetchQueryUsecase(incomeExpenseDataRepository: sl()));
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
