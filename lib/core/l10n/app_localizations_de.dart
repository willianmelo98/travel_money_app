// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get appTitle => 'Travel Money';

  @override
  String get buttonHome => 'Startseite';

  @override
  String get emptyList => 'Keine Reisen aufgezeichnet.';

  @override
  String get inputDestination => 'Geben Sie Ihr Reiseziel ein';

  @override
  String get hintDestination => 'Ex: Italy';

  @override
  String get inputDestinationWarning => 'Bitte geben Sie ein Reiseziel an';

  @override
  String get budgetFieldTitle => 'Budget';

  @override
  String get hintBudgetFieldTitle => 'Ex: \$1000.99';

  @override
  String get inputBudgetWarning => 'Bitte geben Sie einen Betrag an';

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
  String get buttonSave => 'Speichern';

  @override
  String get buttonDelete => 'Delete';

  @override
  String get addTrip => 'Reise hinzufügen';

  @override
  String get welcome => '';

  @override
  String hello(String userName) {
    return 'Hallo $userName';
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
