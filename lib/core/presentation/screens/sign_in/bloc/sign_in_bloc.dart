import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:test_app/core/data/data_sources/local/shared_preferences/app_shared_preferences.dart';
import 'package:test_app/core/domain/usecases/authorization/use_case_sign_in.dart';
import 'package:test_app/core/domain/validators/base/invalid_data_exception.dart';
import 'package:test_app/shared/general/errors/error_bundle.dart';
import 'package:test_app/shared/general/lists/list_extensions.dart';
import 'package:test_app/shared/general/scope/scope_functions.dart';
import 'package:test_app/shared/presentation/blocs/state/state_basics.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {

  final UseCaseSignIn _signIn;
  final GoRouter _router;

  SignInBloc({
    required UseCaseSignIn signIn,
    required GoRouter router
  }) : _signIn=signIn, _router=router,
  super(SignInState()) {
    on<UsernameChangedEvent>(_onUsernameChanged);
    on<PasswordChangedEvent>(_onPasswordChanged);
    on<SignInButtonClickedEvent>(_onSignInButtonClicked);
  }

  void _onUsernameChanged(UsernameChangedEvent event, Emitter<SignInState> emit)
  {
    final newUsername = ValueError<String, String>(value: event.newValue);
    final newState = state.copyWith(username: newUsername);
    emit(newState);
  }

  void _onPasswordChanged(PasswordChangedEvent event, Emitter<SignInState> emit)
  {
    final newPassword = ValueError<String, String>(value: event.newValue);
    final newState = state.copyWith(password: newPassword);
    emit(newState);
  }

  void _onSignInButtonClicked(SignInButtonClickedEvent event, Emitter<SignInState> emit) async {
    emit(SignInStateLoading(state));
    try {
      String username = state.username.value;
      String password = state.password.value;

      final session = await _signIn(username: username, password: password);

      await AppLocalStorage.setAccessToken(session.token);

      emit(SignInStateSuccessful(state));

      _router.go('/home');

    } on ErrorBundle catch (bundle) {
      _processErrorsBundle(bundle, emit);
    } catch(error) {
      emit(SignInStateError(state, error: error));
    }
  }

  void _processErrorsBundle(ErrorBundle bundle, Emitter<SignInState> emit)
  {
    final errors = bundle.errors;

    final usernameInvalidException = errors.tryFindFirst((item) {
      return (item is InvalidDataException && item.dataKey == 'username');
    }) as InvalidDataException?;
    final passwordInvalidException = errors.tryFindFirst((item) {
      return (item is InvalidDataException && item.dataKey == 'password');
    }) as InvalidDataException?;

    final newUsername = usernameInvalidException?.let((it) => state.username.copyWith(error: it.message));
    final newPassword = passwordInvalidException?.let((it) => state.password.copyWith(error: it.message));

    final newState = SignInState.of(state).copyWith(username: newUsername, password: newPassword);

    emit(newState);
  }

}
