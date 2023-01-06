import 'package:expense_planner/features/expense_planner/domain/currency/entities/currency_type_entity.dart';
import 'package:expense_planner/features/expense_planner/domain/currency/repositories/expense_type_repositroy.dart';

class FetchCurrencyTypeUsecase {
  final CurrencyTypeRepository currencyTypeRepository;
  FetchCurrencyTypeUsecase({
    required this.currencyTypeRepository,
  });
  Future<List<CurrencyTypeEntity>> execute() async {
    return currencyTypeRepository.fetchCurrencyType();
  }
}

class AddCurrencyTypeUsecase {
  final CurrencyTypeRepository currencyTypeRepository;
  AddCurrencyTypeUsecase({
    required this.currencyTypeRepository,
  });
  Future<bool> execute(CurrencyTypeEntity currencyTypeEntity) async {
    return currencyTypeRepository.saveCurrencyType(currencyTypeEntity);
  }
}

class UpdateCurrencyTypeUsecase {
  final CurrencyTypeRepository currencyTypeRepository;
  UpdateCurrencyTypeUsecase({
    required this.currencyTypeRepository,
  });
  Future<bool> execute(CurrencyTypeEntity currencyTypeEntity) async {
    return currencyTypeRepository.updateCurrencyType(currencyTypeEntity);
  }
}
