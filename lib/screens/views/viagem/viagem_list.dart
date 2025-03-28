import 'package:flutter/material.dart';
import 'package:travel_money_app/domain/models/viagem.dart';
import 'package:travel_money_app/screens/view_models/viagens_store.dart';

import 'components/dialog_viagem.dart';

class ViagemList extends StatelessWidget {
  final ViagensStore viagensStore;
  const ViagemList({
    Key? key,
    required this.viagensStore,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viagens = viagensStore.viagens;

    return ListView.builder(
      padding: const EdgeInsets.all(0),
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        Viagem viagem = viagens[index];
        return ListTile(
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              InkWell(
                onTap: () => showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => DialogCreateOrEditViagem(
                      viagem: viagem, updateViagem: viagensStore.updateViagem),
                ),
                child: const Icon(Icons.edit),
              ),
              InkWell(
                onTap: () => viagensStore.deleteViagem(viagem.idViagem!),
                child: const Icon(Icons.delete),
              ),
            ],
          ),
          title: Text(viagem.lugar),
        );
      },
      itemCount: viagens.length,
    );
  }
}
