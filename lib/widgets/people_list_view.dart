import 'package:desenvolvimento_flutter_iniciante/mock/people_gen.dart';
import 'package:desenvolvimento_flutter_iniciante/widgets/person_list_tile.dart';
import 'package:flutter/material.dart';

class PeopleListView extends StatelessWidget {
  const PeopleListView({super.key});

  static final people = peopleGen(2000);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.all(8),
      itemCount: people.length,
      itemBuilder: (context, index) {
        return PersonListTile(person: people[index], onTap: () => print('Tap'));
      },
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(height: 8);
      },
    );
  }
}
