import 'package:flutter/material.dart';
import '../../../../domain/models/viagem.dart';
import '../../../view_models/form_viagem_store.dart';

class DialogCreateOrEditViagem extends StatefulWidget {
  final Function(Viagem viagem)? saveViagem;
  final Function(Viagem viagem)? updateViagem;
  final Viagem? viagem;

  const DialogCreateOrEditViagem(
      {Key? key, this.saveViagem, this.updateViagem, this.viagem})
      : super(key: key);

  @override
  State<DialogCreateOrEditViagem> createState() =>
      _DialogCreateOrEditViagemState();
}

class _DialogCreateOrEditViagemState extends State<DialogCreateOrEditViagem> {
  @override
  Widget build(BuildContext context) {
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
                decoration:
                    const InputDecoration(hintText: 'Enter your destination'),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: formStore.orcamentoController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(hintText: 'Budget'),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some value';
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
                      Viagem viagem = formStore.viagem;

                      widget.saveViagem != null
                          ? widget.saveViagem!(viagem)
                          : widget.updateViagem!(viagem);
                      Navigator.pop(context);
                    } else {
                      setState(() {});
                    }
                  },
                  child: const Text('Submit'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
