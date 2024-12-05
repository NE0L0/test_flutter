import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:test_app/core/data/data_sources/local/shared_preferences/app_shared_preferences.dart';
import 'package:test_app/core/presentation/screens/main/main_screen.dart';
import 'package:test_app/core/presentation/screens/sign_in/sign_in_screen.dart';

final appRouter = GoRouter(
  initialLocation: '/sign_in',
  routes: [
    GoRoute(
      path: '/sign_in',
      pageBuilder: (context, state) => const NoTransitionPage(child: SignInScreen()),
      redirect: _RouteProtection.redirectOnAuthorized
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => const MainScreen(),
      redirect: _RouteProtection.redirectOnUnauthorized,
    ),
  ]
);

class _RouteProtection
{
  static Future<String?> redirectOnUnauthorized(BuildContext context, dynamic state) async {
    final accessToken = await AppLocalStorage.getAccessToken();
    if(accessToken == null) {
      return '/sign_in';
    }
    else {
      return null;
    }
  }

  static Future<String?> redirectOnAuthorized(BuildContext context, dynamic state) async {
    final accessToken = await AppLocalStorage.getAccessToken();
    if(accessToken != null) {
      return '/home';
    }
    else {
      return null;
    }
  }
}
