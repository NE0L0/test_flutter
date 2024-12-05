import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:test_app/core/domain/usecases/authorization/use_case_sign_in.dart';
import 'package:test_app/core/presentation/screens/sign_in/sign_in_screen.dart';
import 'package:test_app/di/di_main.dart';
import 'package:test_app/navigation/navigation_main.dart';

void main() {
  initDIModules();
  runApp(const MyApp());
}

final getIt = GetIt.instance;

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      routerConfig: appRouter,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.cyan),
        useMaterial3: true,
      ),
    );
  }
}
