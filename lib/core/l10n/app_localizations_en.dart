// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Travel Money';

  @override
  String get buttonHome => 'Home Page';

  @override
  String get emptyList => 'No trips recorded.';

  @override
  String get inputDestination => 'Enter your destination';

  @override
  String get hintDestination => 'Ex: Italy';

  @override
  String get inputDestinationWarning => 'Please indicate a destination';

  @override
  String get budgetFieldTitle => 'Budget';

  @override
  String get hintBudgetFieldTitle => 'Ex: \$1000.99';

  @override
  String get inputBudgetWarning => 'Please Indicate a Value';

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
  String get buttonSave => 'Save';

  @override
  String get buttonDelete => 'Delete';

  @override
  String get addTrip => 'Add trip';

  @override
  String get welcome => '';

  @override
  String hello(String userName) {
    return 'Hello $userName';
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
