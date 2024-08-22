import 'package:api_session/data/helpers/db_helper.dart';
import 'package:api_session/data/models/recipe_model.dart';
import 'package:flutter/material.dart';

class HandleFavourite extends StatefulWidget {
  final RecipeModel recipeModel;
  const HandleFavourite({super.key, required this.recipeModel});

  @override
  State<HandleFavourite> createState() => _HandleFavouriteState();
}

class _HandleFavouriteState extends State<HandleFavourite> {
  @override
  Widget build(BuildContext context) {
    return DbHelper().isFavourite[widget.recipeModel.id] == true
        ? IconButton(
            onPressed: () async {
              await DbHelper().deleteFromDatabase(widget.recipeModel.id).then((value) {
                DbHelper().isFavourite[widget.recipeModel.id] = false;
                setState(() {});
              });
            },
            icon: const Icon(
              Icons.favorite_outlined,
              color: Colors.red,
            ),
          )
        : IconButton(
            onPressed: () async{
              await DbHelper().insertIntoDatabase(widget.recipeModel).then((value) {
                DbHelper().isFavourite[widget.recipeModel.id] = true;
                setState(() {});
              });
            },
            icon: const Icon(
              Icons.favorite_outline,
              color: Colors.black,
            ),
          );
  }
}
