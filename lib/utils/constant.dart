import 'package:recipe_book/utils/environments/environment.dart';

class Paths {
  static final baseUrl = Uri.parse(Environment.baseUrl);
  static final String consultRecipes = "/recipes";
  static final String consultFavorites = "/favorites";
}

class ClientConfig {
  static final int timeout = 10;
}
