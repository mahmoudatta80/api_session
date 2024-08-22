import 'package:api_session/data/models/recipe_details.dart';
import 'package:api_session/ui/widgets/custom_horizontal_divider.dart';
import 'package:api_session/ui/widgets/custom_vertical_divider.dart';
import 'package:api_session/ui/widgets/ingredient_list_view.dart';
import 'package:flutter/material.dart';

class DetailsBody extends StatelessWidget {
  final RecipeDetails recipeDetails;
  const DetailsBody({super.key, required this.recipeDetails});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(14.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            recipeDetails.title,
            style: const TextStyle(
              color: Colors.teal,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          const CustomHorizontalDivider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text(
                'Easy',
              ),
              const CustomVerticalDivider(),
              Column(
                children: [
                  const Icon(
                    Icons.timer_outlined,
                    color: Colors.teal,
                    size: 24,
                  ),
                  Text(
                    '${recipeDetails.readyInMinutes} mins',
                  ),
                ],
              ),
              const CustomVerticalDivider(),
              const Column(
                children: [
                  Text(
                    '15',
                    style: TextStyle(
                      color: Colors.teal,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    'Ingredient',
                  ),
                ],
              ),
            ],
          ),
          const CustomHorizontalDivider(),
          Text(
            recipeDetails.summary,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 16,
            ),
          ),
          const CustomHorizontalDivider(),
          const Row(
            children: [
              Text(
                '4 Serving',
              ),
              Spacer(),
              Icon(
                Icons.add_box_outlined,
                color: Colors.teal,
              ),
              Icon(
                Icons.indeterminate_check_box_outlined,
                color: Colors.teal,
              ),
            ],
          ),
          const CustomHorizontalDivider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Ingredients',
                style: TextStyle(
                  color: Colors.teal,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.teal,
                  ),
                  borderRadius: BorderRadius.circular(5),
                ),
                padding: const EdgeInsetsDirectional.symmetric(horizontal: 10, vertical: 5),
                child: const Text(
                  'add to grocery list',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
          const CustomHorizontalDivider(),
          IngredientListView(
            extendedIngredients: recipeDetails.extendedIngredients,
          ),
        ],
      ),
    );
  }
}
