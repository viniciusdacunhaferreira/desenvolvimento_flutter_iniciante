import 'package:flutter/material.dart';

import '../models/person.dart';

class PersonListTile extends StatelessWidget {
  const PersonListTile({super.key, required this.person, required this.onTap});

  final Person person;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).cardColor,
      elevation: 2,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onHover: (value) {
          FocusScope.of(context).unfocus();
        },
        onTap: () {
          onTap();
          FocusScope.of(context).unfocus();
        },
        borderRadius: BorderRadius.circular(12),
        child: Ink(
          padding: EdgeInsets.all(8),
          child: Row(
            children: [
              SizedBox(width: 50, child: Center(child: Text('${person.id}#'))),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(person.name, overflow: TextOverflow.ellipsis),
                    Text(
                      'Peso: ${person.weight} kg. Altura: ${person.height} cm.',
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 50,
                child: Center(
                  child: Text(
                    textAlign: TextAlign.end,
                    person.bmi.toStringAsFixed(1),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
