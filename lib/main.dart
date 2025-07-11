import 'package:flutter/material.dart';

import 'routes/router.dart';
import 'routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      routes: routes,
      initialRoute: Routes.initialRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}
