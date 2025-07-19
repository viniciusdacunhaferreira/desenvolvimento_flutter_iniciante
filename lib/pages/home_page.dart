import 'package:flutter/material.dart';

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
  final people = <Person>[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: PeopleListView(people: people, onDelete: _onDelete),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          final result = await context.pushNamed<PersonDto>(
            Routes.addPersonPage,
          );
          if (result != null) {
            setState(() {
              final id = people.isEmpty ? 1 : people.last.id + 1;
              people.add(
                Person(
                  id: id,
                  name: result.name,
                  height: result.height,
                  weight: result.weight,
                ),
              );
            });
          }
        },
      ),
    );
  }

  void _onDelete(Person person) {
    setState(() {
      people.remove(person);
    });
  }
}
