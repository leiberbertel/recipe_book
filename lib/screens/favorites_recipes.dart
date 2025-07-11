import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_book/models/recipe_model.dart';
import 'package:recipe_book/providers/recipe_provider.dart';
import 'package:recipe_book/screens/recipe_detail.dart';

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
              ? Center(child: Text('No favorites recipes!'))
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
      child: Card(
        color: Colors.white,
        child: Column(children: [Text(recipe.name), Text(recipe.author)]),
      ),
    );
  }
}
