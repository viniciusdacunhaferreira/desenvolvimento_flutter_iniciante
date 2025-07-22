import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../controllers/people_controller.dart';
import '../controllers/theme_controller.dart';
import '../extensions/build_context.dart';
import '../routes/routes.dart';
import '../widgets/people_list_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final peopleController = GetIt.instance<PeopleController>();
  final themeController = GetIt.instance<ThemeController>();

  @override
  void initState() {
    peopleController.message.addListener(_onMessage);
    super.initState();
  }

  @override
  void dispose() {
    peopleController.message.addListener(_onMessage);
    super.dispose();
  }

  void _onMessage() {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(peopleController.message.value)));
  }

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
