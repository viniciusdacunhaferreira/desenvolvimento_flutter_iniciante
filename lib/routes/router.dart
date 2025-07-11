import 'package:flutter/material.dart';

import '../pages/add_person_page.dart';
import '../pages/home_page.dart';
import 'routes.dart';

Map<String, WidgetBuilder> routes = {
  Routes.initialRoute: (BuildContext context) => HomePage(),
  Routes.addPersonPage: (BuildContext context) => AddPersonPage(),
};
