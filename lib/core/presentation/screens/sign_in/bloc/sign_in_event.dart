part of 'sign_in_bloc.dart';

sealed class SignInEvent {}

class PasswordChangedEvent extends SignInEvent
{
  String newValue;

  PasswordChangedEvent({
    required this.newValue,
  });
}

class UsernameChangedEvent extends SignInEvent
{
  String newValue;

  UsernameChangedEvent({
    required this.newValue,
  });
}

class SignInButtonClickedEvent extends SignInEvent {}
