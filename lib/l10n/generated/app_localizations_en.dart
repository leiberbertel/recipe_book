// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get title => 'Recipes Books';

  @override
  String get noRecipes => 'No recipes found';

  @override
  String get noRecipesFavorites => 'No favorites recipes';

  @override
  String get descriptionRecipesFavorites => 'Favorite recipes card';

  @override
  String get tapRecipeDetail => 'Click to see the detail of the recipe';

  @override
  String get favoriteRecipesCard => 'Favorite recipes card';

  @override
  String get tabHome => 'Home';

  @override
  String get tabFavorites => 'Favorites';

  @override
  String get by => 'By ';

  @override
  String get recipeSteps => 'Recipe Steps';

  @override
  String get addNewRecipe => 'Add New Recipe';

  @override
  String get recipeName => 'Recipe Name';

  @override
  String get author => 'Author';

  @override
  String get imageUrl => 'Image Url';

  @override
  String get recipe => 'Recipe';

  @override
  String get saveRecipe => 'Save Recipe';

  @override
  String get validatorFieldRecipeName => 'Please enter the name recipe';

  @override
  String get validatorFieldAuthor => 'Please enter the name author';

  @override
  String get validatorFieldImageUrl => 'Please enter the image url';

  @override
  String get validatorFieldRecipe => 'Please enter the recipe';
}
