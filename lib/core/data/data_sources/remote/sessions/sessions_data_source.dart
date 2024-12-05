import 'package:test_app/core/domain/entities/sessions/sessioon.dart';

class SessionsDataSourceMocked
{
  Future<Session> createSession(String username, String password) => Future.delayed(
    const Duration(seconds: 3),
    () {
      if(username == 'test' && password == 'test') {
        return Session(token: 'token');
      }
      else {
        throw AuthDataInvalidException();
      }
    }
  );

  Future<void> deleteSession() => Future.delayed(
    const Duration(seconds: 3),
    () {}
  );
}


class AuthDataInvalidException implements Exception
{
  @override
  String toString() => 'Auth data invalid';
}
