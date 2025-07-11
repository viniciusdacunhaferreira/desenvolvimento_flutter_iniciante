import 'package:desenvolvimento_flutter_iniciante/models/person.dart';
import 'package:flutter/material.dart';

class PersonDialog extends StatelessWidget {
  const PersonDialog({super.key, required this.person});

  final Person person;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(person.name),
      content: Text(
        'Weight: ${person.weight} kg.\nHeight: ${person.height} cm.\nBMI: ${person.bmi.toStringAsFixed(1)} kg/m².',
      ),
      actions: [
        TextButton(onPressed: () => Navigator.pop(context), child: Text('Ok')),
      ],
    );
  }
}
