import 'package:test_app/core/data/data_sources/remote/sessions/sessions_data_source.dart';
import 'package:test_app/core/domain/entities/sessions/sessioon.dart';
import 'package:test_app/core/domain/interactors/sessions/interactors_sessions.dart';

class SessionsRepository implements InteractorSessionsCreate, InteractorSessionsDelete
{
  final SessionsDataSourceMocked remoteDataSource;

  const SessionsRepository({required this.remoteDataSource});

  @override
  Future<Session> createSession(String username, String password) async {
    final session = await remoteDataSource.createSession(username, password);
    return session;
  }

  @override
  Future<void> destroySession() async {
    await remoteDataSource.deleteSession();
  }
}
