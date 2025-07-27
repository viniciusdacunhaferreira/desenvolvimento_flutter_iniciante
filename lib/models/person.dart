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

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'height': height,
      'weight': weight,
    };
  }

  factory Person.fromMap(Map<String, dynamic> map) {
    return Person(
      id: map['id'] as String,
      name: map['name'] as String,
      height: map['height'] as int,
      weight: (map['weight'] as num).toDouble(),
    );
  }
}
