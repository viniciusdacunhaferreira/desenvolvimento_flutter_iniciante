import 'package:flutter/material.dart';

import '../mock/people_gen.dart';
import 'person_dialog.dart';
import 'person_list_tile.dart';

class PeopleListView extends StatelessWidget {
  const PeopleListView({super.key});

  static final people = peopleGen(2000);

  @override
  Widget build(BuildContext context) {
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
