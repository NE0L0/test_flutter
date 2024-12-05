import 'package:test_app/core/domain/validators/password/validator_password.dart';
import 'package:test_app/core/domain/validators/username/validator_username.dart';
import 'package:test_app/main.dart';

void initValidatorsDI()
{
  getIt.registerSingleton(UsernameValidator());
  getIt.registerSingleton(PasswordValidator());
}
