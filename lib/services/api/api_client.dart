import 'package:dio/dio.dart';

import '../../models/person.dart';

class ApiClient {
  final Dio client = Dio();

  Future<List<Person>> getPeople() async {
    final request = await client.get('http://localhost:3000/peple');

    if (request.statusCode == 200) {
      final data = request.data;
      final json = data as List<dynamic>;

      final List<Person> people = json
          .map(
            (e) => Person(
              id: e["id"],
              name: e["name"],
              height: e["height"],
              weight: e["weight"],
            ),
          )
          .toList();

      return people;
    }

    throw Exception('Invalid status code');
  }
}
