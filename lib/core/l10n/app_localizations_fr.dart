// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get appTitle => 'Travel Money';

  @override
  String get buttonHome => 'Page d\'accueil';

  @override
  String get emptyList => 'Aucun voyage enregistré.';

  @override
  String get inputDestination => 'Entrez votre destination';

  @override
  String get hintDestination => 'Ex: Italy';

  @override
  String get inputDestinationWarning => 'Veuillez indiquer une destination';

  @override
  String get budgetFieldTitle => 'Budget';

  @override
  String get hintBudgetFieldTitle => 'Ex: \$1000.99';

  @override
  String get inputBudgetWarning => 'Veuillez indiquer une valeur';

  @override
  String get leadingGastoList => 'Expenses';

  @override
  String get labelTextTitleGasto => 'Expense Title';

  @override
  String get hintTextTitleGasto => 'Ex: Pizza';

  @override
  String get warningTextTitleGasto => 'Please Add the Expense Title';

  @override
  String get labelTextPrecoGasto => 'Price';

  @override
  String get hintTextPrecoGasto => 'Ex: \$10.99';

  @override
  String get textCategory => 'Expense Category:';

  @override
  String get textPaymentMethod => 'Payment Method:';

  @override
  String get warningTextPrecoGasto => 'Please Add the Expense Amount';

  @override
  String get buttonSave => 'Enregistrer';

  @override
  String get buttonDelete => 'Delete';

  @override
  String get addTrip => 'Ajouter un voyage';

  @override
  String get welcome => '';

  @override
  String hello(String userName) {
    return 'Bonjour $userName';
  }

  @override
  String numberOfDataPoints(double value) {
    final intl.NumberFormat valueNumberFormat =
        intl.NumberFormat.simpleCurrency(
      locale: localeName,
    );
    final String valueString = valueNumberFormat.format(value);

    return '$valueString';
  }

  @override
  String shortDate(DateTime date) {
    final intl.DateFormat dateDateFormat = intl.DateFormat.yMMMd(localeName);
    final String dateString = dateDateFormat.format(date);

    return '$dateString';
  }

  @override
  String shortTime(DateTime date) {
    final intl.DateFormat dateDateFormat = intl.DateFormat.jm(localeName);
    final String dateString = dateDateFormat.format(date);

    return '$dateString';
  }
}
