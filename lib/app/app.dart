import 'package:flutter/material.dart';
import 'package:rick_n_morty/app/routing/router.dart';
import 'package:rick_n_morty/app/themes/app_theme.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _appRouter.config(),
      theme: ThemeData(
        extensions: [
          const AppTheme(
            appBarColor: Colors.deepPurple,
            appBarTitleTextStyle: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            appBarIconsColor: Colors.white,
          ),
        ],
      ),
    );
  }
}
