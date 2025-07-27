import 'package:dio/dio.dart';

import '../../models/person.dart';
import '../../models/person_dto.dart';

class ApiClient {
  final Dio client = Dio();

  Future<List<Person>> getPeople() async {
    final Response response = await client.get('http://localhost:3000/person/');

    await Future.delayed(Duration(seconds: 5));

    if (response.statusCode == 200) {
      final data = response.data as List<dynamic>;
      final List<Person> people = data
          .map((e) => Person.fromMap(e as Map<String, dynamic>))
          .toList();

      return people;
    }

    throw Exception('Invalid status code');
  }

  Future<Person> postPerson(PersonDto personDto) async {
    final Response response = await client.post(
      'http://localhost:3000/person/',
      data: personDto.toMap(),
    );

    if (response.statusCode == 201) {
      final data = response.data as Map<String, dynamic>;
      final Person people = Person.fromMap(data);

      return people;
    }

    throw Exception('Invalid status code');
  }
}
