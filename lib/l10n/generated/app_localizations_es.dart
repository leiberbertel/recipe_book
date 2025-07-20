// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get title => 'Recetario';

  @override
  String get noRecipes => 'No se encuentran recetas';

  @override
  String get noRecipesFavorites => 'No se encuentran recetas favoritas';

  @override
  String get descriptionRecipesFavorites => 'Tarjeta de recetas favoritas';

  @override
  String get tapRecipeDetail => 'Toca para ver el detalle de la receta';

  @override
  String get favoriteRecipesCard => 'Tarjeta de recetas favoritas';

  @override
  String get tabHome => 'Inicio';

  @override
  String get tabFavorites => 'Favoritos';

  @override
  String get by => 'Hecho por ';

  @override
  String get recipeSteps => 'Instrucciones';

  @override
  String get addNewRecipe => 'Agregar nueva receta';

  @override
  String get recipeName => 'Nombre de la receta';

  @override
  String get author => 'Autor';

  @override
  String get imageUrl => 'Enlace de la imagen';

  @override
  String get recipe => 'Descripción de la receta';

  @override
  String get saveRecipe => 'Guardar receta';

  @override
  String get validatorFieldRecipeName =>
      'Por favor, ingresa el nombre de la receta';

  @override
  String get validatorFieldAuthor => 'Por favor, ingresa el nombre del autor';

  @override
  String get validatorFieldImageUrl =>
      'Por favor, ingresa el enlace de la receta';

  @override
  String get validatorFieldRecipe =>
      'Por favor, ingresa la descripción de la receta';
}
