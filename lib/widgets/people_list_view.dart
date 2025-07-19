import 'package:flutter/material.dart';

import '../models/person.dart';
import 'person_dialog.dart';
import 'person_list_tile.dart';

class PeopleListView extends StatelessWidget {
  const PeopleListView({
    super.key,
    required this.people,
    required this.onDelete,
  });

  final List<Person> people;
  final void Function(Person) onDelete;

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
            print('Tap');
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) {
                return PersonDialog(person: person, onDelete: onDelete);
              },
            );
          },
          onDelete: onDelete,
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(height: 8);
      },
    );
  }
}
