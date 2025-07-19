import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../controllers/people_controller.dart';
import '../models/person.dart';

class PersonListTile extends StatelessWidget {
  PersonListTile({super.key, required this.person, required this.onTap});

  final Person person;
  final VoidCallback onTap;

  final peopleController = GetIt.instance<PeopleController>();

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).cardColor,
      elevation: 2,
      borderRadius: BorderRadius.circular(12),
      child: GestureDetector(
        onLongPressStart: (details) {
          _showMenu(context, details.globalPosition);
        },
        onSecondaryTapDown: (details) {
          _showMenu(context, details.globalPosition);
        },
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
                SizedBox(
                  width: 50,
                  child: Center(child: Text('${person.id}#')),
                ),
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
      ),
    );
  }

  Future<dynamic> _showMenu(BuildContext context, Offset globalPosition) {
    return showMenu(
      context: context,
      position: RelativeRect.fromLTRB(
        globalPosition.dx,
        globalPosition.dy,
        globalPosition.dx,
        globalPosition.dy,
      ),
      items: [
        PopupMenuItem(
          child: Text('Delete'),
          onTap: () => peopleController.removePerson(person),
        ),
      ],
    );
  }
}
