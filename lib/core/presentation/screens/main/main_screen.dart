//ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:test_app/core/data/data_sources/local/shared_preferences/app_shared_preferences.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Awesome App'),
      ),
      body: Center(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Yay, you have successfully logged in!'),
            OutlinedButton(
              onPressed: () async {
                await AppLocalStorage.setAccessToken(null);
                GoRouter.of(context).go('/sign_in');
              },
              child: const Text('Logout'),
            )
          ],
        ),
      ),
    );
  }
}
