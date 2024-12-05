import 'package:test_app/core/domain/usecases/authorization/use_case_sign_in.dart';
import 'package:test_app/core/domain/usecases/authorization/use_case_sign_out.dart';
import 'package:test_app/core/domain/validators/password/validator_password.dart';
import 'package:test_app/core/domain/validators/username/validator_username.dart';
import 'package:test_app/main.dart';

void initUseCasesDI() {
  _initSessionUseCases();
}

void _initSessionUseCases() {
  getIt.registerFactory(() => UseCaseSignIn(
    interactorSessionCreate: getIt(),
    usernameValidator: getIt<UsernameValidator>(),
    passwordValidator: getIt<PasswordValidator>(),
  ));

  getIt.registerFactory(() => UseCaseSignOut(
      interactorSessionsDelete: getIt()
  ));
}
