import 'package:flutter/material.dart';

import '../models/person.dart';
import '../models/person_dto.dart';

class PeopleController extends ChangeNotifier {
  final _people = <Person>[];

  List<Person> get people => _people;

  final message = ValueNotifier<String>("");

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
    message.value = "Person #$id added successfully.";
    notifyListeners();
  }

  void removePerson(Person person) {
    _people.remove(person);
    message.value = "Person #${person.id} removed successfully.";
    notifyListeners();
  }
}
