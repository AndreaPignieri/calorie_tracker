import 'package:calorie_tracker/core/database/database_providers.dart';
import 'package:calorie_tracker/core/database/objectbox_setup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final store = await ObjectBoxSetup.init();

  runApp(
    ProviderScope(
      overrides: [
        objectBoxStoreProvider.overrideWithValue(store)
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }

  const MyApp({super.key});
}