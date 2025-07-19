import 'package:flutter/material.dart';

import '../controllers/people_controller.dart';
import '../extensions/build_context.dart';
import '../models/person.dart';
import '../models/person_dto.dart';
import '../routes/routes.dart';
import '../widgets/people_list_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PeopleController peopleController = PeopleController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: PeopleListView(
        people: peopleController.people,
        onDelete: _onDelete,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          final result = await context.pushNamed<PersonDto>(
            Routes.addPersonPage,
          );
          if (result != null) {
            setState(() {
              peopleController.addPerson(result);
            });
          }
        },
      ),
    );
  }

  void _onDelete(Person person) {
    setState(() {
      peopleController.removePerson(person);
    });
  }
}
