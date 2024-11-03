import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:test_task/di/injector.dart';
import 'package:test_task/features/test_app.dart';

import 'data/local/shared_prefs/shared_prefs_provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  injectDependencies(env: Environment.dev);
  getIt.get<SharedPreferenceProvider>().init();
  runApp(const MyApp());
}
