import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_arch/app/app_router.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Modular Clean Architecture',
      initialRoute: Routes.main,
      onGenerateRoute: AppRouter.generateRoute,
      theme: ThemeData(primarySwatch: Colors.blue),
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
    );
  }
}
