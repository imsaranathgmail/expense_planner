import 'package:expense_planner/features/expense_planner/domain/entities/income_expense_type/income_expense_type_entity.dart';
import 'package:expense_planner/features/expense_planner/domain/repositories/income_expense_type/income_expense_type_repositroy.dart';

class FetchIncomeExpenseTypeUsecase {
  final IncomeExpenseTypeRepository incomeExpenseTypeRepository;
  FetchIncomeExpenseTypeUsecase({
    required this.incomeExpenseTypeRepository,
  });
  Future<List<IncomeExpenseTypeEntity>> execute() async {
    return incomeExpenseTypeRepository.fetchIncomeExpenseType();
  }
}

class AddIncomeExpenseTypeUsecase {
  final IncomeExpenseTypeRepository incomeExpenseTypeRepository;
  AddIncomeExpenseTypeUsecase({
    required this.incomeExpenseTypeRepository,
  });
  Future<bool> execute(IncomeExpenseTypeEntity incomeExpenseTypeEntity) async {
    return incomeExpenseTypeRepository.saveIncomeExpenseType(incomeExpenseTypeEntity);
  }
}

class UpdateIncomeExpenseTypeUsecase {
  final IncomeExpenseTypeRepository incomeExpenseTypeRepository;
  UpdateIncomeExpenseTypeUsecase({
    required this.incomeExpenseTypeRepository,
  });
  Future<bool> execute(IncomeExpenseTypeEntity incomeExpenseTypeEntity) async {
    return incomeExpenseTypeRepository.updateIncomeExpenseType(incomeExpenseTypeEntity);
  }
}

class DeleteIncomeExpenseTypeUsecase {
  final IncomeExpenseTypeRepository incomeExpenseTypeRepository;
  DeleteIncomeExpenseTypeUsecase({
    required this.incomeExpenseTypeRepository,
  });
  Future<bool> execute(IncomeExpenseTypeEntity incomeExpenseTypeEntity) async {
    return incomeExpenseTypeRepository.deleteIncomeExpenseType(incomeExpenseTypeEntity);
  }
}
