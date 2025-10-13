import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/formatters/currency_input_formatter.dart';
import 'package:provider/provider.dart';
import 'package:travel_money_app/core/custom_form_field.dart';
import 'package:travel_money_app/screens/view_models/viagens_store.dart';
import '../../../../domain/models/viagem.dart';
import '../../../view_models/form_viagem_store.dart';
import 'package:travel_money_app/core/l10n/app_localizations.dart';

class DialogCreateOrEditViagem extends StatefulWidget {
  final Viagem? viagem;

  const DialogCreateOrEditViagem({Key? key, this.viagem}) : super(key: key);

  @override
  State<DialogCreateOrEditViagem> createState() =>
      _DialogCreateOrEditViagemState();
}

class _DialogCreateOrEditViagemState extends State<DialogCreateOrEditViagem> {
  @override
  Widget build(BuildContext context) {
    final locale = Localizations.localeOf(context);
    final viagemStore = Provider.of<ViagensStore>(context, listen: false);
    final formStore =
        FormViagemStore(viagemToEdit: widget.viagem, locale: locale);
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Form(
          autovalidateMode: AutovalidateMode.onUnfocus,
          key: formStore.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            spacing: 20,
            children: <Widget>[
              CustomFormField(
                  controller: formStore.destinoController,
                  keyboardType: TextInputType.text,
                  labelText: AppLocalizations.of(context)!.inputDestination,
                  hintText: AppLocalizations.of(context)!.hintDestination,
                  warningMessage:
                      AppLocalizations.of(context)!.inputDestinationWarning),
              CustomFormField(
                controller: formStore.orcamentoController,
                keyboardType: TextInputType.number,
                inputFormatter: [
                  CurrencyInputFormatter(
                    useSymbolPadding: true,
                    leadingSymbol: formStore.currencySymbol,
                    thousandSeparator: formStore.separator,
                  ),
                ],
                labelText: AppLocalizations.of(context)!.budgetFieldTitle,
                hintText: AppLocalizations.of(context)!.hintBudgetFieldTitle,
                warningMessage:
                    AppLocalizations.of(context)!.inputBudgetWarning,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      const Color.fromRGBO(104, 58, 183, 1), // Roxo claro
                  foregroundColor: Colors.white, // Cor do texto
                  minimumSize:
                      const Size(double.infinity, 50), // Largura total e altura fixa
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
                    Viagem viagemEditada = formStore.viagem;
                    widget.viagem == null
                        ? viagemStore.saveViagens(viagemEditada)
                        : viagemStore.updateViagem(viagemEditada);
                    Navigator.pop(context);
                  }
                },
                child: Text(AppLocalizations.of(context)!.buttonSave),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
