import 'package:dio/dio.dart';

import '../../models/person.dart';

class ApiClient {
  final Dio client = Dio();

  Future<List<Person>> getPeople() async {
    final request = await client.get('http://localhost:3000/person/');

    if (request.statusCode == 200) {
      final data = request.data;
      final json = data as List<dynamic>;
      final List<Person> people = json
          .map(
            (e) => Person(
              id: e["id"] as String,
              name: e["name"] as String,
              height: e["height"] as int,
              weight: (e["weight"] as num).toDouble(),
            ),
          )
          .toList();

      return people;
    }

    throw Exception('Invalid status code');
  }
}
