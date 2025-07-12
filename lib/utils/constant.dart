import 'package:recipe_book/utils/environment.dart';

class Paths {
  static final baseUrl = Uri.parse(Environment.baseUrl);
  static final String consultRecipes = "/recipes";
  static final String consultFavorites = "/favorites";
}
