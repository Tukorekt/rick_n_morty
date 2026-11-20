import 'package:material_ui/material_ui.dart';
import 'package:rick_n_morty/app/routing/router.dart';
import 'package:rick_n_morty/app/themes/app_theme.dart';
import 'package:rick_n_morty/presentation/ui_contants.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: accentColor,
      brightness: Brightness.light,
      surface: surfaceColor,
    );

    return MaterialApp.router(
      routerConfig: _appRouter.config(),
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: colorScheme,
        scaffoldBackgroundColor: pageBackgroundColor,
        appBarTheme: const AppBarTheme(
          backgroundColor: accentColor,
          surfaceTintColor: Colors.transparent,
          elevation: 0,
          scrolledUnderElevation: 0,
        ),
        textTheme: const TextTheme(
          titleMedium: TextStyle(
            color: primaryTextColor,
            fontWeight: FontWeight.w700,
          ),
          bodyMedium: TextStyle(color: primaryTextColor),
          bodySmall: TextStyle(color: secondaryTextColor),
        ),
        extensions: [
          const AppTheme(
            appBarColor: accentColor,
            appBarTitleTextStyle: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w700,
              letterSpacing: .2,
            ),
            appBarIconsColor: Colors.white,
          ),
        ],
      ),
    );
  }
}
