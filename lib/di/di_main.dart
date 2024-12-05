import 'package:test_app/di/data/data_sources/remote/di_module_data_sources.dart';
import 'package:test_app/di/data/repositories/di_module_repositories.dart';
import 'package:test_app/di/domain/usecases/di_module_use_cases.dart';
import 'package:test_app/di/domain/validators/di_module_validators.dart';

void initDIModules() {
  initDataSourcesDI();
  initRepositoriesDI();
  initValidatorsDI();
  initUseCasesDI();
}
