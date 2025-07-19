import 'package:flutter/material.dart';

import '../models/person.dart';
import 'person_dialog.dart';
import 'person_list_tile.dart';

class PeopleListView extends StatelessWidget {
  const PeopleListView({super.key, required this.people});

  final List<Person> people;

  @override
  Widget build(BuildContext context) {
    if (people.isEmpty) {
      return Center(
        child: Text(
          'No people, for now',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      );
    }
    return ListView.separated(
      padding: EdgeInsets.all(8),
      itemCount: people.length,
      itemBuilder: (context, index) {
        final person = people[index];

        return PersonListTile(
          person: person,
          onTap: () {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) {
                return PersonDialog(person: person);
              },
            );
          },
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(height: 8);
      },
    );
  }
}
