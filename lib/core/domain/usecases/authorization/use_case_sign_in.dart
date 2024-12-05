import 'package:test_app/core/domain/entities/sessions/sessioon.dart';
import 'package:test_app/core/domain/interactors/sessions/interactors_sessions.dart';
import 'package:test_app/core/domain/validators/base/Validator.dart';
import 'package:test_app/shared/general/errors/error_bundle.dart';

class UseCaseSignIn
{
  final InteractorSessionsCreate interactorSessionCreate;
  final Validator<String> usernameValidator;
  final Validator<String> passwordValidator;

  const UseCaseSignIn({
    required this.interactorSessionCreate,
    required this.usernameValidator,
    required this.passwordValidator,
  });

  Future<Session> call({required String username, required String password}) async {
    final List<Object> errors = [];

    try {
      usernameValidator.assertValid(username);
    } catch(error) {
      errors.add(error);
    }

    try {
      passwordValidator.assertValid(password);
    } catch (error) {
      errors.add(error);
    }

    if(errors.isNotEmpty){
      throw ErrorBundle(errors);
    }
    else {
      return await interactorSessionCreate.createSession(username, password);
    }
  }
}
