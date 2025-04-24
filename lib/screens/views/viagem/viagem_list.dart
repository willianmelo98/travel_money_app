import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_money_app/domain/models/viagem.dart';
import 'package:travel_money_app/screens/view_models/viagens_store.dart';
import 'package:travel_money_app/screens/views/gasto/gasto_list.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'components/dialog_viagem.dart';

class ViagemList extends StatelessWidget {
  const ViagemList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ViagensStore>(builder: (context, viagensStore, snhot) {
      if (viagensStore.viagensCount == 0) {
        return Center(child: Text(AppLocalizations.of(context)!.emptyList));
      }

      return ListView.builder(
        padding: const EdgeInsets.all(0),
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          Viagem viagem = viagensStore.viagens[index];
          return ListTile(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => GastoList(viagem: viagem),
              ),
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                InkWell(
                  onTap: () => showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => DialogCreateOrEditViagem(
                      viagem: viagem,
                    ),
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
        itemCount: viagensStore.viagensCount,
      );
    });
  }
}
