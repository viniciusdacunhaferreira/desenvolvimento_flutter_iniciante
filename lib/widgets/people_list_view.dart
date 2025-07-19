import 'package:flutter/material.dart';

import '../mock/people_gen.dart';
import 'person_list_tile.dart';

class PeopleListView extends StatelessWidget {
  PeopleListView({super.key});

  final people = peopleGen(100000);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: people.length,
      itemBuilder: (context, index) => PersonListTile(person: people[index]),
    );
  }
}
