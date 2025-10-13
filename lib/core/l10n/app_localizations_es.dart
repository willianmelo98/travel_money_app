// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appTitle => 'Dinero para viajes';

  @override
  String get buttonHome => 'Página de Inicio';

  @override
  String get emptyList =>
      'Aún no has registrado ningún contenido. ¡Regístrate y explora!';

  @override
  String get inputDestination => 'Introduce tu destino';

  @override
  String get hintDestination => 'Ex: Italy';

  @override
  String get inputDestinationWarning => 'Por favor indique un destino';

  @override
  String get budgetFieldTitle => 'presupuesto';

  @override
  String get hintBudgetFieldTitle => 'Ex: \$1000.99';

  @override
  String get inputBudgetWarning => 'Por favor, indique un valor';

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
  String get buttonSave => 'Ahorrar';

  @override
  String get buttonDelete => 'Delete';

  @override
  String get addTrip => 'Añadir viaje';

  @override
  String get welcome => 'Bienvenido !';

  @override
  String hello(String userName) {
    return 'Hola $userName';
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

/// The translations for Spanish Castilian, as used in Argentina (`es_AR`).
class AppLocalizationsEsAr extends AppLocalizationsEs {
  AppLocalizationsEsAr() : super('es_AR');

  @override
  String get appTitle => 'Travel Money';

  @override
  String get buttonHome => 'Página de inicio';

  @override
  String get emptyList => 'No hay viajes registrados.';

  @override
  String get inputDestination => 'Ingresá tu destino';

  @override
  String get inputDestinationWarning => 'Por favor indicá un destino';

  @override
  String get budgetFieldTitle => 'Presupuesto';

  @override
  String get inputBudgetWarning => 'Por favor indicá un valor';

  @override
  String get buttonSave => 'Guardar';

  @override
  String get addTrip => 'Agregar viaje';

  @override
  String get welcome => '';

  @override
  String hello(String userName) {
    return 'Hola $userName';
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

/// The translations for Spanish Castilian, as used in Spain (`es_ES`).
class AppLocalizationsEsEs extends AppLocalizationsEs {
  AppLocalizationsEsEs() : super('es_ES');

  @override
  String get appTitle => 'Travel Money';

  @override
  String get buttonHome => 'Página principal';

  @override
  String get emptyList => 'No hay viajes registrados.';

  @override
  String get inputDestination => 'Introduce tu destino';

  @override
  String get inputDestinationWarning => 'Por favor, indica un destino';

  @override
  String get budgetFieldTitle => 'Presupuesto';

  @override
  String get inputBudgetWarning => 'Por favor, indica un valor';

  @override
  String get buttonSave => 'Guardar';

  @override
  String get addTrip => 'Añadir viaje';

  @override
  String get welcome => '';

  @override
  String hello(String userName) {
    return 'Hola $userName';
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

/// The translations for Spanish Castilian, as used in Mexico (`es_MX`).
class AppLocalizationsEsMx extends AppLocalizationsEs {
  AppLocalizationsEsMx() : super('es_MX');

  @override
  String get appTitle => 'Travel Money';

  @override
  String get buttonHome => 'Página de inicio';

  @override
  String get emptyList => 'No hay viajes registrados.';

  @override
  String get inputDestination => 'Ingresa tu destino';

  @override
  String get inputDestinationWarning => 'Por favor indica un destino';

  @override
  String get budgetFieldTitle => 'Presupuesto';

  @override
  String get inputBudgetWarning => 'Por favor indica un valor';

  @override
  String get buttonSave => 'Guardar';

  @override
  String get addTrip => 'Agregar viaje';

  @override
  String get welcome => '';

  @override
  String hello(String userName) {
    return 'Hola $userName';
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
