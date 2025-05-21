import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/formatters/money_input_enums.dart';
import 'package:intl/intl.dart';
import 'package:travel_money_app/domain/models/gasto.dart';

class FormGastoStore with ChangeNotifier {
  Gasto? gastoToEdit;
  int idViagem;
  Locale locale;
  FormGastoStore(
      {this.gastoToEdit, required this.idViagem, required this.locale}) {
    final simpleCurrency =
        NumberFormat.simpleCurrency(locale: locale.toString());
    configureLocale(locale);
    if (gastoToEdit != null) {
      titleGastoController.text = gastoToEdit!.titleGasto;
      precoController.text = simpleCurrency.format(gastoToEdit!.preco);
      updateCategoriaSelected(gastoToEdit!.categoria);
      updatePaymentMethodSelected(gastoToEdit!.meioDePagamento);
    }
  }

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController precoController = TextEditingController();
  final TextEditingController titleGastoController = TextEditingController();

  String currencySymbol = '';
  ThousandSeparator separator = ThousandSeparator.None;

  List<bool> categoriaSelected = <bool>[
    true,
    false,
    false,
    false,
    false,
    false
  ];

  List<bool> paymentMethodSelected = <bool>[
    true,
    false,
  ];

  Gasto get gasto => Gasto(
        idGasto: gastoToEdit?.idGasto,
        preco: updateValueFromText(precoController.value.text),
        dataGasto: DateTime.now(),
        categoria: categoriaSelected.indexOf(true),
        titleGasto: titleGastoController.value.text,
        idViagem: idViagem,
        meioDePagamento: paymentMethodSelected.indexOf(true),
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

  updateCategoriaSelected(int index) {
    for (int buttonIndex = 0;
        buttonIndex < categoriaSelected.length;
        buttonIndex++) {
      if (buttonIndex == index) {
        categoriaSelected[buttonIndex] = true;
      } else {
        categoriaSelected[buttonIndex] = false;
      }
    }
    notifyListeners();
  }

  updatePaymentMethodSelected(int index) {
    for (int buttonIndex = 0;
        buttonIndex < paymentMethodSelected.length;
        buttonIndex++) {
      if (buttonIndex == index) {
        paymentMethodSelected[buttonIndex] = true;
      } else {
        paymentMethodSelected[buttonIndex] = false;
      }
    }
    notifyListeners();
  }
}
