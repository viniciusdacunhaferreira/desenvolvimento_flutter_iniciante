import 'package:flutter/material.dart';

import '../models/person.dart';

class PersonListTile extends StatelessWidget {
  const PersonListTile({super.key, required this.person});

  final Person person;

  @override
  Widget build(BuildContext context) {
    final bmi = person.weight / (person.height / 100 * person.height / 100);
    final result = Container(
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.only(bottom: 4, top: 4),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        boxShadow: [
          BoxShadow(
            blurRadius: 2,
            offset: Offset(0, 1),
            spreadRadius: 0,
            color:
                Theme.of(context).cardTheme.shadowColor ??
                const Color.fromARGB(122, 0, 0, 0),
          ),
        ],
        border: Border.all(color: Colors.transparent),
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SizedBox(width: 50, child: Center(child: Text('${person.id}#'))),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(person.name),
                  Text(
                    'Peso: ${person.weight} kg. Altura: ${person.height} cm.',
                  ),
                ],
              ),
            ],
          ),
          Text(bmi.toStringAsFixed(2)),
        ],
      ),
    );

    return result;
  }
}
