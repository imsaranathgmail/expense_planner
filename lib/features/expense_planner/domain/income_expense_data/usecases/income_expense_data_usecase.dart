import 'package:expense_planner/features/expense_planner/domain/income_expense_data/entities/income_expense_data_entity.dart';
import 'package:expense_planner/features/expense_planner/domain/income_expense_data/repositories/income_expense_data_repositroy.dart';

class FetchIncomeExpenseDataUsecase {
  final IncomeExpenseDataRepository incomeExpenseDataRepository;
  FetchIncomeExpenseDataUsecase({
    required this.incomeExpenseDataRepository,
  });
  Future<List<IncomeExpenseDataEntity>> execute() async {
    return incomeExpenseDataRepository.fetchIncomeExpenseData();
  }
}

class CustomeFetchQueryUsecase {
  final IncomeExpenseDataRepository incomeExpenseDataRepository;

  CustomeFetchQueryUsecase({
    required this.incomeExpenseDataRepository,
  });
  Future<List<Map<String, dynamic>>> execute(String sql) async {
    return incomeExpenseDataRepository.customeFetchQueryData(sql);
  }
}

class AddIncomeExpenseDataUsecase {
  final IncomeExpenseDataRepository incomeExpenseDataRepository;
  AddIncomeExpenseDataUsecase({
    required this.incomeExpenseDataRepository,
  });
  Future<bool> execute(IncomeExpenseDataEntity incomeExpenseDataEntity) async {
    return incomeExpenseDataRepository.saveIncomeExpenseData(incomeExpenseDataEntity);
  }
}

class UpdateIncomeExpenseDataUsecase {
  final IncomeExpenseDataRepository incomeExpenseDataRepository;
  UpdateIncomeExpenseDataUsecase({
    required this.incomeExpenseDataRepository,
  });
  Future<bool> execute(IncomeExpenseDataEntity incomeExpenseDataEntity) async {
    return incomeExpenseDataRepository.updateIncomeExpenseData(incomeExpenseDataEntity);
  }
}

class DeleteIncomeExpenseDataUsecase {
  final IncomeExpenseDataRepository incomeExpenseDataRepository;
  DeleteIncomeExpenseDataUsecase({
    required this.incomeExpenseDataRepository,
  });
  Future<bool> execute(IncomeExpenseDataEntity incomeExpenseDataEntity) async {
    return incomeExpenseDataRepository.deleteIncomeExpenseData(incomeExpenseDataEntity);
  }
}
