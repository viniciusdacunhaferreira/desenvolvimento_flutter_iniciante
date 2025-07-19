import 'package:get_it/get_it.dart';

import '../controllers/people_controller.dart';

void injector() {
  GetIt.instance.registerSingleton<PeopleController>(PeopleController());
}
