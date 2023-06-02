import 'package:cross_over_test_quizlr/constants/app_route.dart';
import 'package:cross_over_test_quizlr/views/home/home_view.dart';
import 'package:flutter/material.dart';

/// This function is triggered every time when calling Navigator.pushNamed.
/// It returns a Route depending on the routeName passed in the settings.
Route<dynamic> generateRoute(RouteSettings settings) {
  // Debug print to know the router was accessed
  debugPrint('Router Accessed');

  /// Switching on the routeName from settings
  switch (settings.name) {
    case AppRoute.homeViewRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: const HomeView(),
      );
    // For all other route names
    default:
      // Return a PageRoute with a Scaffold showing an error message
      return MaterialPageRoute(
        builder: (_) => Scaffold(
          body: Center(
            child: Text('No route defined for ${settings.name}'),
          ),
        ),
      );
  }
}

/// This is a helper function that returns a MaterialPageRoute
/// It takes a routeName and a viewToShow (the widget to be displayed)
PageRoute _getPageRoute({String? routeName, Widget? viewToShow}) {
  return MaterialPageRoute(
      settings: RouteSettings(
        name:
            routeName, // Assigning routeName to the settings of the MaterialPageRoute
      ),
      builder: (_) => viewToShow!); // The builder returns the widget to display
}
