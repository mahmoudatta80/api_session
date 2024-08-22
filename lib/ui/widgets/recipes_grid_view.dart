import 'package:api_session/data/helpers/api_service.dart';
import 'package:api_session/data/models/recipe_model.dart';
import 'package:api_session/ui/screens/details_screen.dart';
import 'package:api_session/ui/widgets/handle_favourite.dart';
import 'package:flutter/material.dart';

class RecipesGridView extends StatefulWidget {
  const RecipesGridView({super.key});

  @override
  State<RecipesGridView> createState() => _RecipesGridViewState();
}

class _RecipesGridViewState extends State<RecipesGridView> {
  final ApiService _apiService = ApiService();

  Future<List<RecipeModel>> getAllRecipes() async {
    List<RecipeModel> recipes = [];
    final result = await _apiService.getAllRecipes();
    for (var item in result['results']) {
      recipes.add(RecipeModel.fromJson(item));
    }
    return recipes;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<RecipeModel>>(
      future: getAllRecipes(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data!.isNotEmpty) {
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                mainAxisExtent: MediaQuery.sizeOf(context).height * 0.25,
              ),
              itemBuilder: (context, index) {
                RecipeModel recipeModel = snapshot.data![index];
                return InkWell(
                  onTap: () {
                    Navigator.of(context)
                        .push(
                      MaterialPageRoute(
                        builder: (context) => DetailsScreen(
                          recipeModel: recipeModel,
                        ),
                      ),
                    )
                        .then((value) {
                      setState(() {});
                    });
                  },
                  child: Column(
                    children: [
                      Stack(
                        alignment: Alignment.topRight,
                        children: [
                          Image.network(
                            recipeModel.image,
                            fit: BoxFit.fill,
                            height: MediaQuery.sizeOf(context).height * 0.20,
                            width: double.infinity,
                          ),
                          HandleFavourite(
                            recipeModel: recipeModel,
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Text(
                        recipeModel.title,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                );
              },
              itemCount: snapshot.data!.length,
            );
          } else {
            return const Center(
              child: Text(
                'Recipes is empty',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            );
          }
        } else if (snapshot.hasError) {
          return Center(
            child: Text(
              snapshot.error.toString(),
              style: const TextStyle(
                color: Colors.black,
              ),
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.black,
            ),
          );
        }
      },
    );
  }
}
