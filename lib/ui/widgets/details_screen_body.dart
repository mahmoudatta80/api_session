import 'package:api_session/data/helpers/api_service.dart';
import 'package:api_session/data/models/recipe_details.dart';
import 'package:api_session/ui/widgets/details_body.dart';
import 'package:flutter/material.dart';

class DetailsScreenBody extends StatefulWidget {
  final int id;

  const DetailsScreenBody({super.key, required this.id});

  @override
  State<DetailsScreenBody> createState() => _DetailsScreenBodyState();
}

class _DetailsScreenBodyState extends State<DetailsScreenBody> {
  final ApiService _apiService = ApiService();

  Future<RecipeDetails> getRecipeDetails() async {
    final result = await _apiService.getRecipeDetails(widget.id);
    RecipeDetails recipeDetails = RecipeDetails.fromJson(result);
    return recipeDetails;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: FutureBuilder<RecipeDetails>(
        future: getRecipeDetails(),
        builder: (context, snapshot) {
          if(snapshot.hasData) {
            RecipeDetails recipeDetails = snapshot.data!;
            return Column(
              children: [
                Image.network(
                  recipeDetails.image,
                  height: MediaQuery.sizeOf(context).height * 0.3,
                  width: double.infinity,
                  fit: BoxFit.fill,
                ),
                DetailsBody(recipeDetails: recipeDetails),
              ],
            );
          } else if(snapshot.hasError) {
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
      ),
    );
  }
}
