import 'package:flutter/material.dart';

import '../models/person.dart';
import '../models/person_dto.dart';
import '../services/api/api_client.dart';
import '../states/people_operation_state.dart';

class PeopleController extends ChangeNotifier {
  PeopleController(this.apiClient);

  List<Person> _people = [];

  List<Person> get people => _people;

  final message = ValueNotifier<PeopleOperationState>(
    IdlePeopleOperationState(),
  );

  final ApiClient apiClient;

  bool isLoading = false;

  Future<void> getPeople() async {
    isLoading = true;
    notifyListeners();
    try {
      List<Person> result = await apiClient.getPeople();
      _people = result;
      notifyListeners();
    } on Exception catch (e) {
      message.value = ErrorPeopleOperationState(e);
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> addPerson(PersonDto personDto) async {
    try {
      Person result = await apiClient.postPerson(personDto);
      _people.add(result);
      message.value = SuccessPeopleOperationState(
        "Person #${result.id} added successfully.",
      );
    } on Exception catch (e) {
      message.value = ErrorPeopleOperationState(e);
    } finally {
      notifyListeners();
    }
  }

  Future<void> removePerson(Person person) async {
    try {
      await apiClient.deletePerson(person);
      _people.remove(person);
      message.value = SuccessPeopleOperationState(
        "Person #${person.id} removed successfully.",
      );
    } on Exception catch (e) {
      message.value = ErrorPeopleOperationState(e);
    } finally {
      notifyListeners();
    }
  }

  Future<void> editPerson(Person person) async {
    try {
      Person result = await apiClient.putPerson(person);

      final index = _people.indexWhere((e) => e.id == person.id);

      _people[index] = result;

      message.value = SuccessPeopleOperationState(
        "Person #${result.id} updated successfully.",
      );
    } on Exception catch (e) {
      message.value = ErrorPeopleOperationState(e);
    } finally {
      notifyListeners();
    }
  }
}
