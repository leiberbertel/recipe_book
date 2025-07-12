import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_book/models/recipe_model.dart';
import 'package:recipe_book/providers/recipe_provider.dart';
import 'package:recipe_book/screens/recipe_detail.dart';
import 'package:recipe_book/utils/localization.dart';

class FavoritesRecipes extends StatelessWidget {
  const FavoritesRecipes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Consumer<RecipesProvider>(
        builder: (context, recipesProvider, child) {
          final favoritesRecipes = recipesProvider.favoriteRecipe;
          return favoritesRecipes.isEmpty
              ? Center(
                  child: Text(
                    appLocalizationInitialize(context).noRecipesFavorites,
                  ),
                )
              : ListView.builder(
                  itemCount: favoritesRecipes.length,
                  itemBuilder: (context, index) {
                    final recipe = favoritesRecipes[index];
                    return FavoriteRecipeCard(recipe: recipe);
                  },
                );
        },
      ),
    );
  }
}

class FavoriteRecipeCard extends StatelessWidget {
  final Recipe recipe;
  const FavoriteRecipeCard({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => RecipeDetail(recipes: recipe),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 125,
          child: Semantics(
            label: 'Tarjeta de recetas favoritas',
            hint: 'Toca para ver el detalle de la receta ${recipe.name}',
            child: Card(
              child: Row(
                children: <Widget>[
                  SizedBox(
                    height: 125,
                    width: 100,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        recipe.urlLink,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            color: Colors.grey[200],
                            child: Icon(
                              Icons.broken_image,
                              color: Colors.grey[400],
                              size: 50,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  SizedBox(width: 26),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.favorite, color: Colors.orange),
                          SizedBox(width: 8),
                          Text(
                            recipe.name,
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'QuickSand',
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 4),
                      Container(height: 2, width: 75, color: Colors.orange),
                      Text(
                        'By ${recipe.author}',
                        style: TextStyle(fontSize: 16, fontFamily: 'QuickSand'),
                      ),
                      SizedBox(height: 4),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
