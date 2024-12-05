import 'package:test_app/core/domain/entities/sessions/sessioon.dart';

abstract interface class InteractorSessionsCreate
{
  Future<Session> createSession(String username, String password);
}

abstract interface class InteractorSessionsDelete
{
  Future<void> destroySession();
}
