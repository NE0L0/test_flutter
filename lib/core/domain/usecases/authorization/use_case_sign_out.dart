import 'package:test_app/core/domain/interactors/sessions/interactors_sessions.dart';

class UseCaseSignOut
{
  final InteractorSessionsDelete interactorSessionsDelete;

  const UseCaseSignOut({required this.interactorSessionsDelete});

  void call() async {
    await interactorSessionsDelete.destroySession();
  }
}
