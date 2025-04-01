import 'package:flutter/material.dart';
import 'package:travel_money_app/core/template_scaffold.dart';

import 'package:travel_money_app/domain/models/viagem.dart';
import 'package:travel_money_app/screens/view_models/gastos_store.dart';

class GastoList extends StatefulWidget {
  final Viagem viagem;
  const GastoList({
    Key? key,
    required this.viagem,
  }) : super(key: key);

  @override
  State<GastoList> createState() => _GastoListState();
}

class _GastoListState extends State<GastoList> {
  @override
  Widget build(BuildContext context) {
    final GastosStore gastoStore =
        GastosStore(viagemSendoExibida: widget.viagem);

    return TemplateScaffold(
      viagemName: widget.viagem.lugar,
      body: ListView.builder(
        padding: const EdgeInsets.all(0),
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Card();
        },
        itemCount: gastoStore.gastosCount,
      ),
    );
  }
}
