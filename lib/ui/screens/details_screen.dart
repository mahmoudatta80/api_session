import 'package:api_session/data/models/recipe_model.dart';
import 'package:api_session/ui/widgets/details_screen_body.dart';
import 'package:api_session/ui/widgets/handle_favourite.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  final RecipeModel recipeModel;

  const DetailsScreen({super.key, required this.recipeModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.teal,
          ),
        ),
        actions: [
          HandleFavourite(
            recipeModel: recipeModel,
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.play_arrow_outlined,
              color: Colors.black,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.shopping_cart_outlined,
              color: Colors.black,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.share,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: DetailsScreenBody(
        id: recipeModel.id,
      ),
    );
  }
}
