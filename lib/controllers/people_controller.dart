import 'package:flutter/material.dart';

import '../models/person.dart';
import '../models/person_dto.dart';

class PeopleController extends ChangeNotifier {
  final _people = <Person>[];

  List<Person> get people => _people;

  void addPerson(PersonDto personDto) {
    final id = _people.isEmpty ? 1 : _people.last.id + 1;
    _people.add(
      Person(
        id: id,
        name: personDto.name,
        height: personDto.height,
        weight: personDto.weight,
      ),
    );
    notifyListeners();
  }

  void removePerson(Person person) {
    _people.remove(person);
    notifyListeners();
  }
}
