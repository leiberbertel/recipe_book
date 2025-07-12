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
}
