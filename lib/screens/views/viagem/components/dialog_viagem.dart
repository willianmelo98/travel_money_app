import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_money_app/screens/view_models/viagens_store.dart';
import '../../../../domain/models/viagem.dart';
import '../../../view_models/form_viagem_store.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
    final viagemStore = Provider.of<ViagensStore>(context, listen: false);
    final formStore = FormViagemStore(viagemToEdit: widget.viagem);
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: formStore.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextFormField(
                controller: formStore.destinoController,
                decoration: InputDecoration(
                    hintText: AppLocalizations.of(context)!.inputDestination),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return AppLocalizations.of(context)!
                        .inputDestinationWarning;
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: formStore.orcamentoController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: AppLocalizations.of(context)!.budgetFieldTitle),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return AppLocalizations.of(context)!.inputBudgetWarning;
                  }
                  return null;
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  onPressed: () async {
                    // Validate will return true if the form is valid, or false if
                    // the form is invalid.
                    if (formStore.formKey.currentState!.validate()) {
                      Viagem viagemEditada = formStore.viagem;
                      widget.viagem == null
                          ? viagemStore.saveViagens(viagemEditada)
                          : viagemStore.updateViagem(viagemEditada);
                      Navigator.pop(context);
                    } else {
                      setState(() {});
                    }
                  },
                  child: Text(AppLocalizations.of(context)!.buttonSave),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
