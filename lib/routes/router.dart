import 'package:flutter/material.dart';

import '../models/person_dto.dart';
import '../pages/add_person_page.dart';
import '../pages/home_page.dart';
import 'routes.dart';

Route<Object?> generateRoutes(RouteSettings settings) {
  switch (settings.name) {
    case Routes.initialRoute:
      return MaterialPageRoute<void>(builder: (_) => HomePage());
    case Routes.addPersonPage:
      return MaterialPageRoute<PersonDto>(builder: (_) => AddPersonPage());
    default:
      return MaterialPageRoute<void>(builder: (_) => HomePage());
  }
}
