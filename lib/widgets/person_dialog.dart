import 'package:flutter/material.dart';

import '../extensions/build_context.dart';
import '../models/person.dart';

class PersonDialog extends StatelessWidget {
  const PersonDialog({super.key, required this.person, required this.onDelete});

  final Person person;
  final void Function(Person) onDelete;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(person.name),
      content: Text(
        'Weight: ${person.weight} kg.\nHeight: ${person.height} cm.\nBMI: ${person.bmi.toStringAsFixed(1)} kg/m².',
      ),
      actions: [
        TextButton(
          onPressed: () {
            onDelete(person);
            context.pop();
          },
          child: Text('Delete'),
        ),
        TextButton(onPressed: () => context.pop(), child: Text('Ok')),
      ],
    );
  }
}
