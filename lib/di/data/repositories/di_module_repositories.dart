import 'package:test_app/core/data/repositories/sessions/sessions_repository.dart';
import 'package:test_app/core/domain/interactors/sessions/interactors_sessions.dart';
import 'package:test_app/main.dart';

void initRepositoriesDI() {
  _initSessionsRepository();
}

void _initSessionsRepository() {
  getIt.registerSingleton(SessionsRepository(remoteDataSource: getIt()));
  getIt.registerFactory<InteractorSessionsCreate>(() => getIt<SessionsRepository>());
  getIt.registerFactory<InteractorSessionsDelete>(() => getIt<SessionsRepository>());
}
