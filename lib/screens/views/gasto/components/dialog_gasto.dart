import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:travel_money_app/core/custom_form_field.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:travel_money_app/domain/models/gasto.dart';
import 'package:travel_money_app/screens/view_models/form_gasto_store.dart';

// ignore: must_be_immutable
class DialogCreateOrEditGastos extends StatefulWidget {
  final Gasto? gasto;
  final int idViagem;
  Function(Gasto gasto) saveGasto;
  Function(Gasto gasto) updateGasto;
  Function(Gasto gasto)? deleteGasto;
  DialogCreateOrEditGastos({
    Key? key,
    this.gasto,
    required this.idViagem,
    required this.saveGasto,
    required this.updateGasto,
    this.deleteGasto,
  }) : super(key: key);

  @override
  State<DialogCreateOrEditGastos> createState() =>
      _DialogCreateOrEditGastosState();
}

class _DialogCreateOrEditGastosState extends State<DialogCreateOrEditGastos> {
  @override
  Widget build(BuildContext context) {
    final locale = Localizations.localeOf(context);
    final formStore = FormGastoStore(
        gastoToEdit: widget.gasto, idViagem: widget.idViagem, locale: locale);

    return Dialog(
      insetPadding:
          const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      child: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(25.0),
          child: Form(
            key: formStore.formKey,
            autovalidateMode: AutovalidateMode.onUnfocus,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              spacing: 20,
              children: <Widget>[
                CustomFormField(
                  controller: formStore.titleGastoController,
                  keyboardType: TextInputType.text,
                  labelText: AppLocalizations.of(context)!.labelTextTitleGasto,
                  hintText: AppLocalizations.of(context)!.hintTextTitleGasto,
                  warningMessage:
                      AppLocalizations.of(context)!.warningTextTitleGasto,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 8,
                  children: [
                    Text(AppLocalizations.of(context)!.textCategory),
                    ListenableBuilder(
                      listenable: formStore,
                      builder: (BuildContext context, Widget? child) {
                        return ToggleButtons(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(8)),
                          selectedBorderColor: Colors.blue[700],
                          fillColor: Colors.blue[200],
                          isSelected: formStore.categoriaSelected,
                          onPressed: (int index) {
                            formStore.updateCategoriaSelected(index);
                          },
                          children: const <Widget>[
                            Image(
                              image: AssetImage('assets/restaurante-40.png'),
                              width: 30,
                            ),
                            Image(
                              image: AssetImage('assets/carro-40.png'),
                              width: 30,
                            ),
                            Image(
                              image: AssetImage('assets/mercado-40.png'),
                              width: 30,
                            ),
                            Image(
                              image: AssetImage('assets/outros-40.png'),
                              width: 30,
                            ),
                            Image(
                              image: AssetImage('assets/camping-40.png'),
                              width: 30,
                            ),
                            Image(
                              image: AssetImage('assets/cafe-40.png'),
                              width: 30,
                            ),
                          ],
                        );
                      },
                    ),
                  ],
                ),
                CustomFormField(
                  controller: formStore.precoController,
                  inputFormatter: [
                    CurrencyInputFormatter(
                      useSymbolPadding: true,
                      leadingSymbol: formStore.currencySymbol,
                      thousandSeparator: formStore.separator,
                    ),
                  ],
                  keyboardType: TextInputType.number,
                  labelText: AppLocalizations.of(context)!.labelTextPrecoGasto,
                  hintText: AppLocalizations.of(context)!.hintTextPrecoGasto,
                  warningMessage:
                      AppLocalizations.of(context)!.warningTextPrecoGasto,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 8,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.textPaymentMethod,
                    ),
                    ListenableBuilder(
                      listenable: formStore,
                      builder: (BuildContext context, Widget? child) {
                        return ToggleButtons(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(8)),
                          selectedBorderColor: Colors.blue[700],
                          fillColor: Colors.blue[200],
                          isSelected: formStore.paymentMethodSelected,
                          onPressed: (int index) {
                            formStore.updatePaymentMethodSelected(index);
                          },
                          children: const <Widget>[
                            Image(
                              image: AssetImage('assets/card-40.png'),
                              width: 30,
                            ),
                            Image(
                              image: AssetImage('assets/money-40.png'),
                              width: 30,
                            ),
                          ],
                        );
                      },
                    ),
                  ],
                ),
                Column(
                  spacing: 5,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        disabledBackgroundColor:
                            const Color.fromARGB(255, 164, 147, 201),
                        backgroundColor:
                            const Color.fromRGBO(104, 58, 183, 1), // Roxo claro
                        foregroundColor: Colors.white, // Cor do texto
                        minimumSize: const Size(
                            double.infinity, 50), // Largura total e altura fixa
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(8), // Arredondamento suave
                        ),
                        elevation: 0, // Sem sombra
                      ),
                      onPressed: () async {
                        // Validate will return true if the form is valid, or false if
                        // the form is invalid.
                        if (formStore.formKey.currentState!.validate()) {
                          Gasto gastoEditada = formStore.gasto;
                          widget.gasto == null
                              ? widget.saveGasto(gastoEditada)
                              : widget.updateGasto(gastoEditada);
                          Navigator.pop(context);
                        }
                      },
                      child: Text(AppLocalizations.of(context)!.buttonSave),
                    ),
                    widget.gasto != null && widget.deleteGasto != null
                        ? ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              disabledBackgroundColor:
                                  const Color.fromARGB(255, 201, 147, 147),
                              backgroundColor: const Color.fromARGB(
                                  255, 183, 58, 58), // Roxo claro
                              foregroundColor: Colors.white, // Cor do texto
                              minimumSize: const Size(double.infinity,
                                  50), // Largura total e altura fixa
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    8), // Arredondamento suave
                              ),
                              elevation: 0, // Sem sombra
                            ),
                            onPressed: () async {
                              widget.deleteGasto!(formStore.gasto);
                              Navigator.pop(context);
                            },
                            child: Text(
                                AppLocalizations.of(context)!.buttonDelete),
                          )
                        : const SizedBox(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
