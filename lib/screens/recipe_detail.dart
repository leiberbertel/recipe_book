import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_book/models/recipe_model.dart';
import 'package:recipe_book/providers/recipe_provider.dart';

class RecipeDetail extends StatefulWidget {
  final Recipe recipes;
  const RecipeDetail({super.key, required this.recipes});

  @override
  State<RecipeDetail> createState() => _RecipeDetailState();
}

class _RecipeDetailState extends State<RecipeDetail> {
  bool isFavorite = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    isFavorite = Provider.of<RecipesProvider>(
      context,
      listen: false,
    ).favoriteRecipe.contains(widget.recipes);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.recipes.name, style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.orange,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            onPressed: () async {
              _getFavoriteRecipes(context, widget.recipes);
              setState(() {
                isFavorite = !isFavorite;
              });
            },
            icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_border),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(18),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                widget.recipes.urlLink,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.grey[200],
                    child: Icon(
                      Icons.broken_image,
                      color: Colors.grey[400],
                      size: 300,
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 8),
            Text(widget.recipes.name),
            SizedBox(height: 8),
            Text("By ${widget.recipes.author}"),
            SizedBox(height: 8),
            const Text('Recipe Steps:'),
            for (var step in widget.recipes.recipeSteps) Text("- $step"),
          ],
        ),
      ),
    );
  }
}

void _getFavoriteRecipes(BuildContext context, Recipe recipe) async {
  await Provider.of<RecipesProvider>(
    context,
    listen: false,
  ).toggleFavoriteStatus(recipe);
}
