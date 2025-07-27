import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../controllers/people_controller.dart';
import '../extensions/build_context.dart';
import '../models/person.dart';

class PersonDialog extends StatelessWidget {
  const PersonDialog({super.key, required this.person});

  final Person person;

  @override
  Widget build(BuildContext context) {
    final peopleController = GetIt.instance<PeopleController>();

    return AlertDialog(
      title: Text(person.name),
      content: Text(
        'Weight: ${person.weight} kg.\nHeight: ${person.height} cm.\nBMI: ${person.bmi.toStringAsFixed(1)} kg/m².',
      ),
      actions: [
        TextButton(
          onPressed: () async {
            await peopleController.removePerson(person);
            if (context.mounted) context.pop();
          },
          child: Text('Delete'),
        ),
        TextButton(onPressed: () => context.pop(), child: Text('Ok')),
      ],
    );
  }
}
