import 'package:api_session/data/models/ingredient_model.dart';
import 'package:flutter/material.dart';

class IngredientListView extends StatelessWidget {
  final List<IngredientModel> extendedIngredients;
  const IngredientListView({super.key, required this.extendedIngredients});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Row(
          children: [
            const CircleAvatar(
              radius: 5,
              backgroundColor: Colors.teal,
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Text(
                extendedIngredients[index].name,
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
          ],
        );
      },
      separatorBuilder: (context, index) => const SizedBox(height: 20),
      itemCount: extendedIngredients.length,
    );
  }
}
