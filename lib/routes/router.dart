import 'package:flutter/material.dart';

import '../pages/home_page.dart';
import '../pages/new_page.dart';
import 'routes.dart';

Map<String, WidgetBuilder> routes = {
  Routes.initialRoute: (BuildContext context) => HomePage(),
  Routes.newPage: (BuildContext context) => NewPage(),
};
