import 'package:desenvolvimento_flutter_iniciante/mock/people_gen.dart';
import 'package:desenvolvimento_flutter_iniciante/widgets/person_list_tile.dart';
import 'package:flutter/material.dart';

class PeopleListView extends StatelessWidget {
  const PeopleListView({super.key});

  @override
  Widget build(BuildContext context) {
    // Não vai dar não!
    final people = peopleGen(100000);
    return ListView.builder(
      itemCount: people.length,
      itemBuilder: (context, index) => PersonListTile(person: people[index]),
    );
  }
}
