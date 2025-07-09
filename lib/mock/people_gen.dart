import 'dart:math';

import 'package:faker/faker.dart' as fk;

import '../models/person.dart';

List<Person> peopleGen(int amount) {
  final faker = fk.Faker();

  final result = List.generate(
    amount,
    (index) => Person(
      id: index,
      name: faker.person.name(),
      height: Random().nextInt(100) + 100,
      weight: (Random().nextInt(1700) + 300) / 10,
    ),
  );

  return result;
}
