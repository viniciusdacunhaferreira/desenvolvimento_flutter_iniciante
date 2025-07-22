import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../controllers/people_controller.dart';
import '../controllers/theme_controller.dart';

Future<void> injector() async {
  final i = GetIt.instance;

  i.registerSingleton<PeopleController>(PeopleController());
  i.registerSingleton<ThemeController>(
    ThemeController(await SharedPreferences.getInstance()),
  );
}
