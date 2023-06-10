import 'package:flutter/material.dart';
import 'package:track_me/core/fade_page_router.dart';
import 'package:track_me/ui/screens/home/home_screen.dart';

enum Routes { home }

class _Paths {
  static const String splash = '/';
  static const String home = '/home';

  static const Map<Routes, String> _pathMap = {
    Routes.home: _Paths.home,
  };

  static String of(Routes route) => _pathMap[route] ?? splash;
}

class AppNavigator {
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  static NavigatorState? get state => navigatorKey.currentState;

  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case _Paths.home:
      default:
        return FadeRoute(page: const HomeScreen());
    }
  }

  static Future? push<T>(Routes route, [T? arguments]) =>
      state?.pushNamed(_Paths.of(route), arguments: arguments);

  static Future? replaceWith<T>(Routes route, [T? arguments]) =>
      state?.pushReplacementNamed(_Paths.of(route), arguments: arguments);

  static void pop() => state?.pop();
}
