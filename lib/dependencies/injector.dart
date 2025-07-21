import 'package:get_it/get_it.dart';

import '../controllers/people_controller.dart';
import '../controllers/theme_controller.dart';

void injector() {
  final i = GetIt.instance;

  i.registerSingleton<PeopleController>(PeopleController());
  i.registerSingleton<ThemeController>(ThemeController());
}
