import 'package:api_session/ui/widgets/favourites_grid_view.dart';
import 'package:flutter/material.dart';

class FavouritesScreen extends StatelessWidget {
  const FavouritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 14),
      child: Column(
        children: [
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                Icons.filter_list,
                color: Colors.teal,
                size: 32,
              ),
              Text(
                'Favourite Recipes',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Colors.teal,
                ),
              ),
              Icon(
                Icons.search,
                color: Colors.teal,
                size: 32,
              ),
            ],
          ),
          SizedBox(height: 20),
          Expanded(
            child: FavouritesGridView(),
          ),
        ],
      ),
    );
  }
}
