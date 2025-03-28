import 'package:flutter/material.dart';

import '../../domain/models/viagem.dart';

class FormViagemStore with ChangeNotifier {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController destinoController = TextEditingController();
  final TextEditingController orcamentoController = TextEditingController();
  Viagem? viagemToEdit;
  FormViagemStore({
    this.viagemToEdit,
  }) {
    if (viagemToEdit != null) {
      destinoController.text = viagemToEdit!.lugar;
      orcamentoController.text = viagemToEdit!.orcamento.toString();
    }
  }

  Viagem get viagem => Viagem(
      idViagem: viagemToEdit?.idViagem,
      lugar: destinoController.value.text,
      orcamento: int.tryParse(orcamentoController.value.text)!,
      dataViagem: DateTime.now());
}
