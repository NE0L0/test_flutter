import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:test_app/core/presentation/screens/sign_in/bloc/sign_in_bloc.dart';
import 'package:test_app/main.dart';
import 'package:test_app/shared/general/scope/scope_functions.dart';
import 'package:test_app/shared/presentation/view/screen/base/block_screen.dart';

class SignInScreen extends BlocScreenWidget<SignInBloc, SignInState>
{
  const SignInScreen({super.key});

  @override
  SignInBloc createBloc(BuildContext context) => SignInBloc(
    signIn: getIt(),
    router: GoRouter.of(context)
  );

  @override
  BlocScreenContentState<SignInBloc, SignInState> createState() => SignInScreenContentState();

  @override
  Widget buildScaffold({Widget? child}) => Scaffold(
    appBar: AppBar(
      title: const Text('Sign In'),
      centerTitle: true,
    ),
    body: child,
  );
}

class SignInScreenContentState extends BlocScreenContentState<SignInBloc, SignInState> {

  @override
  Widget buildContent(BuildContext context, SignInState state) {
    if(state is SignInStateLoading) {
      return Stack(
        children: [
          _buildMainContent(context, state),
          Container(
            color: const Color.fromARGB(32, 0, 0, 0),
            width: double.infinity,
            height: double.infinity,
            child: const Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            ),
          ),
        ],
      );
    }
    else {
      return _buildMainContent(context, state);
    }
  }

  Widget _buildMainContent(BuildContext context, SignInState state)
  {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            decoration: InputDecoration(
              hintText: 'Username',
              error: state.username.error?.let((it) => Text(it)),
            ),
            onChanged: _onUsernameChanged,
          ),
          TextField(
            decoration: InputDecoration(
              hintText: 'Password',
              error: state.password.error?.let((it) => Text(it)),
            ),
            obscureText: true,
            obscuringCharacter: '*',
            onChanged: _onPasswordChanged,
          ),
          Container(
            margin: const EdgeInsets.only(top: 16),
            child: OutlinedButton(
              onPressed: _onSignInButtonClicked,
              child: const Text('Sign In'),
            ),
          ),
          maybeBuildErrorWidget(context, state),
        ],
      ),
    );
  }

  void _onUsernameChanged(String newValue) => bloc.add(UsernameChangedEvent(newValue: newValue));
  void _onPasswordChanged(String newValue) => bloc.add(PasswordChangedEvent(newValue: newValue));
  void _onSignInButtonClicked() => bloc.add(SignInButtonClickedEvent());

  Widget maybeBuildErrorWidget(BuildContext context, SignInState state) {
    if(state is SignInStateError) {
      final error = state.error;
      return Container(
        margin: const EdgeInsets.only(top: 16),
        child: Text(
          error.toString(),
          style: const TextStyle(
              color: Colors.red
          ),
        ),
      );
    }
    return const SizedBox(
      width: 0,
      height: 0,
    );
  }
}
