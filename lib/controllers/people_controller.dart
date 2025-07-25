import 'package:flutter/material.dart';

import '../models/person.dart';
import '../models/person_dto.dart';
import '../services/api/api_client.dart';
import '../states/people_operation_state.dart';

class PeopleController extends ChangeNotifier {
  List<Person> _people = [];

  List<Person> get people => _people;

  final message = ValueNotifier<PeopleOperationState>(
    IdlePeopleOperationState(),
  );

  final ApiClient apiClient = ApiClient();

  void getPeople() async {
    try {
      List<Person> result = await apiClient.getPeople();
      _people = result;
      notifyListeners();
    } on Exception catch (e) {
      print(e);
    }
  }

  void addPerson(PersonDto personDto) {
    try {
      final id = _people.isEmpty ? 1 : int.tryParse(_people.last.id) ?? 0 + 1;
      _people.add(
        Person(
          id: id.toString(),
          name: personDto.name,
          height: personDto.height,
          weight: personDto.weight,
        ),
      );
      message.value = SuccessPeopleOperationState(
        "Person #$id added successfully.",
      );
      notifyListeners();
    } on Exception catch (e) {
      message.value = ErrorPeopleOperationState(e);
      notifyListeners();
    }
  }

  void removePerson(Person person) {
    try {
      _people.remove(person);
      message.value = SuccessPeopleOperationState(
        "Person #${person.id} removed successfully.",
      );
      notifyListeners();
    } on Exception catch (e) {
      message.value = ErrorPeopleOperationState(e);
      notifyListeners();
    }
  }
}
