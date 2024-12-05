part of 'sign_in_bloc.dart';

class SignInState {
  final ValueError<String, String> username;
  final ValueError<String, String> password;

  SignInState({
    this.username = const ValueError<String, String>(value: ''),
    this.password = const ValueError<String, String>(value: ''),
  });

  SignInState.of(SignInState state): username = state.username, password = state.password;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SignInState &&
          runtimeType == other.runtimeType &&
          username == other.username &&
          password == other.password);

  @override
  int get hashCode => username.hashCode ^ password.hashCode;

  @override
  String toString() => 'SignInStateIdle{ username: $username, password: $password}';

  SignInState copyWith({ValueError<String, String>? username, ValueError<String, String>? password}) => SignInState(
    username: username ?? this.username,
    password: password ?? this.password,
  );
}

class SignInStateLoading extends SignInState {

  SignInStateLoading(SignInState state): super(username: state.username, password: state.password);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SignInStateLoading && runtimeType == other.runtimeType);

  @override
  int get hashCode => super.hashCode;

  @override
  String toString() {
    return 'SignInStateLoading{ username: $username, password: $password}';
  }
}

class SignInStateError extends SignInState {
  SignInStateError(SignInState state, {required this.error}): super(username: state.username, password: state.password);

  Object error;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SignInStateError &&
          runtimeType == other.runtimeType &&
          error == other.error);

  @override
  int get hashCode => super.hashCode ^ error.hashCode;

  @override
  String toString() {
    return 'SignInStateError{ error: $error, username: $username, password: $password}';
  }
}

class SignInStateSuccessful extends SignInState {
  SignInStateSuccessful(SignInState state): super(username: state.username, password: state.password);
}
