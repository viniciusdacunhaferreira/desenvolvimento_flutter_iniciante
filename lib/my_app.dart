import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'controllers/theme_controller.dart';
import 'routes/router.dart';
import 'routes/routes.dart';
import 'themes/themes.dart';

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final themeController = GetIt.instance<ThemeController>();

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: themeController,
      builder: (context, _) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: themeController.isDarkTheme ? darkTheme : lightTheme,
          onGenerateRoute: generateRoutes,
          initialRoute: Routes.initialRoute,
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
