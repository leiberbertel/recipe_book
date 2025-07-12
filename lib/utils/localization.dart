import 'package:flutter/material.dart';
import 'package:recipe_book/l10n/generated/app_localizations.dart';

/// This function requires generating a code through the internationalization library.
/// The documentation to generate is in the README of the project.
AppLocalizations appLocalizationInitialize(BuildContext? context) {
  AppLocalizations appLocalizations =
      AppLocalizations.of(context as BuildContext) as AppLocalizations;

  return appLocalizations;
}
