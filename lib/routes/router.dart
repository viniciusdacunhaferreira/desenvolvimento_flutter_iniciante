import 'package:flutter/material.dart';

import '../models/person_dto.dart';
import '../pages/home_page.dart';
import '../pages/person_editor_page.dart';
import 'routes.dart';

Route<Object?> generateRoutes(RouteSettings settings) {
  switch (settings.name) {
    case Routes.initialRoute:
      return MaterialPageRoute<void>(builder: (_) => HomePage());
    case Routes.personEditorPage:
      return MaterialPageRoute<PersonDto>(
        builder: (BuildContext context) => PersonEditorPage(),
        settings: settings,
      );
    default:
      return MaterialPageRoute<void>(builder: (_) => HomePage());
  }
}
