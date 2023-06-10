import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

class ProviderLoggerMiddleware extends ProviderObserver {
  @override
  void didUpdateProvider(
    ProviderBase<Object?> provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    Logger().i(
      '''
      {
      "provider": "${provider.name ?? provider.runtimeType}"
      "previousValue":"$previousValue",
      "newValue": "$newValue"
      }''',
    );
  }
}
