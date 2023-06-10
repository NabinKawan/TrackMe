import 'dart:math';

import 'package:flutter/material.dart';
import 'package:track_me/configs/constants.dart';
import 'package:track_me/configs/theme.dart';
import 'package:track_me/routes.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: AppNavigator.navigatorKey,
      onGenerateRoute: AppNavigator.onGenerateRoute,
      builder: (context, child) {
        if (child == null) return const SizedBox.shrink();
        final data = MediaQuery.of(context);
        final smallestSize = min(data.size.width, data.size.height);
        final textScaleFactor =
            min(smallestSize / AppConstants.designScreenSize.width, 1.0);
        return MediaQuery(
          data: data.copyWith(textScaleFactor: textScaleFactor),
          child: child,
        );
      },
      theme: AppTheme().themeData,
      debugShowCheckedModeBanner: false,
    );
  }
}
