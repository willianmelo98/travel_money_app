import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/formatters/money_input_enums.dart';
import 'package:intl/intl.dart';

import '../../domain/models/viagem.dart';

class FormViagemStore with ChangeNotifier {
  Locale locale;
  Viagem? viagemToEdit;
  late NumberFormat format;

  FormViagemStore({this.viagemToEdit, required this.locale}) {
    format = NumberFormat.simpleCurrency(locale: locale.toString());
    configureLocale(locale);
    if (viagemToEdit != null) {
      destinoController.text = viagemToEdit!.lugar;
      orcamentoController.text = format.format(viagemToEdit!.orcamento);
    }
  }

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController destinoController = TextEditingController();
  final TextEditingController orcamentoController = TextEditingController();
  String currencySymbol = '';
  ThousandSeparator separator = ThousandSeparator.None;

  Viagem get viagem => Viagem(
        idViagem: viagemToEdit?.idViagem,
        lugar: destinoController.value.text,
        orcamento: updateValueFromText(orcamentoController.value.text),
        dataViagem: DateTime.now(),
      );

  updateValueFromText(String input) {
    // Define o separador decimal com base no locale
    final numberFormat = NumberFormat.decimalPattern(locale.toString());
    final decimalSeparator = numberFormat.symbols.DECIMAL_SEP;

    // Remove o símbolo de moeda e espaços
    String cleaned = input.replaceAll(currencySymbol, '').trim();

    // Remove separador de milhar
    final thousandSeparator = numberFormat.symbols.GROUP_SEP;
    cleaned = cleaned.replaceAll(thousandSeparator, '');

    // Substitui o separador decimal pela vírgula que Dart espera (ponto)
    if (decimalSeparator != '.') {
      cleaned = cleaned.replaceAll(decimalSeparator, '.');
    }

    // Agora pode parsear corretamente
    return double.tryParse(cleaned);
  }

  configureLocale(Locale locale) {
    final numberFormat = NumberFormat.decimalPattern(locale.toString());

    currencySymbol =
        NumberFormat.simpleCurrency(locale: locale.toString()).currencySymbol;

    final thousandSeparatorPeriod = numberFormat.symbols.GROUP_SEP;

    if (thousandSeparatorPeriod == '.') {
      separator = ThousandSeparator.Period;
    } else if (thousandSeparatorPeriod == ',') {
      separator = ThousandSeparator.Comma;
    } else if (thousandSeparatorPeriod.contains(' ')) {
      separator = ThousandSeparator.Space;
    } else {
      separator = ThousandSeparator.None;
    }
  }
}
