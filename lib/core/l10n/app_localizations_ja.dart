// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class AppLocalizationsJa extends AppLocalizations {
  AppLocalizationsJa([String locale = 'ja']) : super(locale);

  @override
  String get appTitle => 'Travel Money';

  @override
  String get buttonHome => 'ホームページ';

  @override
  String get emptyList => '旅行が記録されていません。';

  @override
  String get inputDestination => '目的地を入力してください';

  @override
  String get hintDestination => 'Ex: Italy';

  @override
  String get inputDestinationWarning => '目的地を入力してください';

  @override
  String get budgetFieldTitle => '予算';

  @override
  String get hintBudgetFieldTitle => 'Ex: \$1000.99';

  @override
  String get inputBudgetWarning => '金額を入力してください';

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
  String get buttonSave => '保存';

  @override
  String get buttonDelete => 'Delete';

  @override
  String get addTrip => '旅行を追加';

  @override
  String get welcome => '';

  @override
  String hello(String userName) {
    return 'こんにちは $userName';
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
