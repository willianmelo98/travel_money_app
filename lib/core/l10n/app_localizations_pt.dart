// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get appTitle => 'Dinheiro para viagem';

  @override
  String get buttonHome => 'Página Inicial';

  @override
  String get emptyList => 'Nenhuma viagem registrada.';

  @override
  String get inputDestination => 'Insira seu destino';

  @override
  String get hintDestination => 'Ex: Italy';

  @override
  String get inputDestinationWarning => 'Por favor, indique algum destino';

  @override
  String get budgetFieldTitle => 'Orçamento';

  @override
  String get hintBudgetFieldTitle => 'Ex: \$1000.99';

  @override
  String get inputBudgetWarning => 'Por favor, indique um valor';

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
  String get buttonSave => 'Salvar';

  @override
  String get buttonDelete => 'Delete';

  @override
  String get addTrip => 'Adicionar viagem';

  @override
  String get welcome => 'Bem-vindo !';

  @override
  String hello(String userName) {
    return 'Bem Vindo ! $userName';
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

/// The translations for Portuguese, as used in Brazil (`pt_BR`).
class AppLocalizationsPtBr extends AppLocalizationsPt {
  AppLocalizationsPtBr() : super('pt_BR');

  @override
  String get appTitle => 'Travel Money';

  @override
  String get buttonHome => 'Página inicial';

  @override
  String get emptyList => 'Nenhuma viagem registrada.';

  @override
  String get inputDestination => 'Informe seu destino';

  @override
  String get inputDestinationWarning => 'Por favor, indique um destino';

  @override
  String get budgetFieldTitle => 'Orçamento';

  @override
  String get inputBudgetWarning => 'Por favor, indique um valor';

  @override
  String get buttonSave => 'Salvar';

  @override
  String get addTrip => 'Adicionar viagem';

  @override
  String get welcome => '';

  @override
  String hello(String userName) {
    return 'Olá $userName';
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
}

/// The translations for Portuguese, as used in Portugal (`pt_PT`).
class AppLocalizationsPtPt extends AppLocalizationsPt {
  AppLocalizationsPtPt() : super('pt_PT');

  @override
  String get appTitle => 'Travel Money';

  @override
  String get buttonHome => 'Página inicial';

  @override
  String get emptyList => 'Nenhuma viagem registada.';

  @override
  String get inputDestination => 'Indique o seu destino';

  @override
  String get inputDestinationWarning => 'Por favor, indique um destino';

  @override
  String get budgetFieldTitle => 'Orçamento';

  @override
  String get inputBudgetWarning => 'Por favor, indique um valor';

  @override
  String get buttonSave => 'Guardar';

  @override
  String get addTrip => 'Adicionar viagem';

  @override
  String get welcome => '';

  @override
  String hello(String userName) {
    return 'Olá $userName';
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
}
