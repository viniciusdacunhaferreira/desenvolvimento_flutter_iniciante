class Person {
  Person({
    required this.id,
    required this.name,
    required this.height,
    required this.weight,
  });

  String id;
  String name;
  int height;
  double weight;

  double get bmi => weight / (height / 100 * height / 100);
}
