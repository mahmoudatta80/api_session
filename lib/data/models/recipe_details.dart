
import 'package:api_session/data/models/ingredient_model.dart';

class RecipeDetails {
  final String title, image, summary;
  final int readyInMinutes;
  final List<IngredientModel> extendedIngredients;

  RecipeDetails({
    required this.title,
    required this.image,
    required this.summary,
    required this.readyInMinutes,
    required this.extendedIngredients,
  });

  factory RecipeDetails.fromJson(Map<String, dynamic> json) {
    return RecipeDetails(
      title: json['title'],
      image: json['image'],
      summary: json['summary'],
      readyInMinutes: json['readyInMinutes'],
      extendedIngredients: (json['extendedIngredients'] as List<dynamic>)
          .map((item) => IngredientModel.fromJson(item))
          .toList(),
    );
  }
}
