import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:track_me/middlewares/provider_logger_middleware.dart';

Future<ProviderContainer> bootstrap() async {
  WidgetsFlutterBinding.ensureInitialized();
  final container = ProviderContainer(
    observers: [
      ProviderLoggerMiddleware(),
    ],
  );
  return container;
}
