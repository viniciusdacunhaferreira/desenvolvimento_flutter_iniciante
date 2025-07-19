import 'package:flutter/material.dart';

import '../models/person.dart';

class PersonListTile extends StatelessWidget {
  const PersonListTile({super.key, required this.person});

  final Person person;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text('${person.id}#'),
      title: Text(person.name),
      subtitle: Text('Peso: ${person.weight} kg. Altura: ${person.height} cm.'),
    );
  }
}
