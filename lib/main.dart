import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:track_me/app.dart';
import 'package:track_me/bootstrap.dart';

Future<void> main() async {
  runApp(
    UncontrolledProviderScope(
      container: await bootstrap(),
      child: const App(),
    ),
  );
}
