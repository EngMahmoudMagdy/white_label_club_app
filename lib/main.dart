import 'package:clean_architecture/core/util/app_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'core/injection_container.dart' as di;
import 'core/util/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await di.init();
  runApp(EasyLocalization(
      path: 'assets/lang',
      supportedLocales: const [Locale('en'), Locale('ar')],
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'AL Ahly Club',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: appTheme,
      routerConfig: goRouter,
    );
  }
}
