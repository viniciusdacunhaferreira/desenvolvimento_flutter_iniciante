class PersonDto {
  PersonDto({required this.name, required this.height, required this.weight});

  String name;
  int height;
  double weight;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'name': name, 'height': height, 'weight': weight};
  }
}
