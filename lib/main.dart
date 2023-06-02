import 'package:cross_over_test_quizlr/constants/app_string.dart';
import 'package:cross_over_test_quizlr/constants/app_theme.dart';
import 'package:cross_over_test_quizlr/router.dart';
import 'package:cross_over_test_quizlr/service_locator.dart';
import 'package:cross_over_test_quizlr/services/navigation_service.dart';
import 'package:cross_over_test_quizlr/views/app_base_view_model.dart';
import 'package:cross_over_test_quizlr/views/start_up/start_up_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

/// Main function, the entry point of the app
void main() async {
  // Ensure binding exist before running the app
  WidgetsFlutterBinding.ensureInitialized();

  // Set up service locator
  await setUpLocator();

  // Set the preferred orientations and then run the app
  await SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]).then(
    (_) {
      // Run the app
      return runApp(
        MultiProvider(
          providers: [
            ChangeNotifierProvider<AppBaseViewModel>(
              create: (_) => AppBaseViewModel(),
            ),
            ChangeNotifierProvider<ThemeProvider>(
              create: (_) => ThemeProvider(),
            ),
          ],
          child: const MyApp(),
        ),
      );
    },
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppString.title,
      themeMode: themeProvider.themeMode,
      theme: AppTheme.lightTheme(),
      darkTheme: AppTheme.darkTheme(),
      home: const StartUpView(),
      navigatorKey: locator<NavigationService>().navigationKey,
      onGenerateRoute: generateRoute,
    );
  }
}
