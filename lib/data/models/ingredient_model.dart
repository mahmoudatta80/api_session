class IngredientModel {
  final int id;
  final String name;

  IngredientModel({
    required this.id,
    required this.name,
  });

  factory IngredientModel.fromJson(Map<String, dynamic> json) {
    return IngredientModel(
      id: json['id'],
      name: json['name'],
    );
  }
}
