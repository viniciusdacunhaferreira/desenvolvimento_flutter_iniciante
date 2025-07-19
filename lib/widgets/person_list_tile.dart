// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

import '../models/person.dart';

class PersonListTile extends StatefulWidget {
  const PersonListTile({super.key, required this.person});

  final Person person;

  @override
  State<PersonListTile> createState() => _PersonListTileState();
}

class _PersonListTileState extends State<PersonListTile> {
  @override
  void initState() {
    print('Inserting ${widget.person.id}: ${widget.person.name}');
    super.initState();
  }

  @override
  void dispose() {
    print('Removing ${widget.person.id}: ${widget.person.name}');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bmi =
        widget.person.weight /
        (widget.person.height / 100 * widget.person.height / 100);
    return ListTile(
      leading: Text('${widget.person.id}#'),
      title: Text(widget.person.name),
      subtitle: Text(
        'Peso: ${widget.person.weight} kg. Altura: ${widget.person.height} cm.',
      ),
      trailing: Text(bmi.toStringAsFixed(2)),
    );
  }
}
