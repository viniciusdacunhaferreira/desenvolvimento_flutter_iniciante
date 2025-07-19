import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../controllers/people_controller.dart';
import '../extensions/build_context.dart';
import '../models/person_dto.dart';
import '../routes/routes.dart';
import '../widgets/people_list_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final peopleController = GetIt.instance<PeopleController>();

  @override
  void initState() {
    peopleController.addListener(_onUpdate);
    super.initState();
  }

  @override
  void dispose() {
    peopleController.removeListener(_onUpdate);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: PeopleListView(people: peopleController.people),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          final result = await context.pushNamed<PersonDto>(
            Routes.addPersonPage,
          );
          if (result != null) {
            peopleController.addPerson(result);
          }
        },
      ),
    );
  }

  void _onUpdate() {
    setState(() {});
  }
}
