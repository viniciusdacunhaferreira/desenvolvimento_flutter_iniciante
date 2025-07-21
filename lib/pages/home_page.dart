import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../controllers/people_controller.dart';
import '../controllers/theme_controller.dart';
import '../extensions/build_context.dart';
import '../routes/routes.dart';
import '../widgets/people_list_view.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final peopleController = GetIt.instance<PeopleController>();
  final themeController = GetIt.instance<ThemeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.all(16),
          children: [
            ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(24),
              ),
              onTap: () => themeController.switchTheme(),
              title: Text('Dark theme'),
              leading: Icon(Icons.palette),
              trailing: Switch(
                value: themeController.isDarkTheme,
                onChanged: (_) => themeController.switchTheme(),
              ),
            ),
          ],
        ),
      ),
      body: ListenableBuilder(
        listenable: peopleController,
        builder: (context, _) {
          return PeopleListView(people: peopleController.people);
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => context.pushNamed(Routes.addPersonPage),
      ),
    );
  }
}
