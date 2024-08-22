import 'package:api_session/data/helpers/db_helper.dart';
import 'package:api_session/data/models/recipe_model.dart';
import 'package:api_session/ui/screens/details_screen.dart';
import 'package:flutter/material.dart';

class FavouritesGridView extends StatefulWidget {
  const FavouritesGridView({super.key});

  @override
  State<FavouritesGridView> createState() => _FavouritesGridViewState();
}

class _FavouritesGridViewState extends State<FavouritesGridView> {
  DbHelper dbHelper = DbHelper();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: dbHelper.getDataFromDatabase(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data.length != 0) {
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                mainAxisExtent: MediaQuery.sizeOf(context).height * 0.25,
              ),
              itemBuilder: (context, index) {
                RecipeModel recipeModel = RecipeModel.fromJson(
                  snapshot.data[index],
                );
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
                          IconButton(
                            onPressed: () async {
                              await DbHelper()
                                  .deleteFromDatabase(recipeModel.id)
                                  .then((value) {
                                DbHelper().isFavourite[recipeModel.id] = false;
                                setState(() {});
                              });
                            },
                            icon: const Icon(
                              Icons.favorite_outlined,
                              color: Colors.red,
                            ),
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
              itemCount: snapshot.data.length,
            );
          } else {
            return const Center(
              child: Text(
                'Favourites is empty',
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
