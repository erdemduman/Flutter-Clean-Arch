import 'package:core/core.dart';
import 'package:flutter/material.dart';

import '../di/di_init.dart';
import 'my_app.dart';

class AppExecuter {
  final BuildConfig buildConfig;

  const AppExecuter({required this.buildConfig});

  void execute() async {
    InitDependencyInjection.init(buildConfig);

    WidgetsFlutterBinding.ensureInitialized();
    await EasyLocalization.ensureInitialized();

    runApp(EasyLocalization(
      supportedLocales: const [
        Locale('en'),
      ],
      path: 'packages/core/assets/translations',
      fallbackLocale: const Locale('en'),
      child: const MyApp(),
    ));
  }
}
