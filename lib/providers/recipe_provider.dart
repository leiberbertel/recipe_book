import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:recipe_book/models/recipe_model.dart';
import 'package:recipe_book/utils/constant.dart';

class RecipesProvider extends ChangeNotifier {
  bool isLoading = false;
  List<Recipe> recipes = [];
  List<Recipe> favoriteRecipe = [];

  Future<void> fetchRecipes() async {
    isLoading = true;
    final url = Paths.baseUrl.replace(path: Paths.consultRecipes);
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        recipes = List<Recipe>.from(
          data['recipes'].map((recipe) => Recipe.fromJSON(recipe)),
        );
      } else {
        print('Error ${response.statusCode}');
        recipes = [];
      }
    } catch (e) {
      print('Error in request');
      recipes = [];
    } finally {
      isLoading = false;
    }
    notifyListeners();
  }

  Future<void> toggleFavoriteStatus(Recipe recipe) async {
    final isFavorite = favoriteRecipe.contains(recipe);
    final url = Paths.baseUrl.replace(path: Paths.consultFavorites);

    try {
      final response = isFavorite
          ? await http.delete(url, body: json.encode({"id": recipe.id}))
          : await http.post(url, body: json.encode(recipe.toJson()));

      if (response.statusCode == 200) {
        if (isFavorite) {
          favoriteRecipe.remove(recipe);
        } else {
          favoriteRecipe.add(recipe);
        }
      } else {
        throw Exception('Failed to update favorite recipe');
      }
    } catch (e) {
      print('Error updating favorite status $e');
    }
    notifyListeners();
  }
}
