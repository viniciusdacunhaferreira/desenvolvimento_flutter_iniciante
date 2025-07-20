import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../controllers/people_controller.dart';
import '../extensions/build_context.dart';
import '../routes/routes.dart';
import '../widgets/people_list_view.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final peopleController = GetIt.instance<PeopleController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
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
