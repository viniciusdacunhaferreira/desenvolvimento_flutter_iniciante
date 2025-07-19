import 'package:flutter/material.dart';

import '../models/person.dart';
import 'person_list_tile.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PersonListTile(
          person: Person(id: 1, name: 'João da Silva', height: 172, weight: 80),
        ),
      ],
    );
  }
}
