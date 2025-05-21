import 'package:flutter/material.dart';
import 'package:travel_money_app/core/template_scaffold.dart';

import 'package:travel_money_app/domain/models/viagem.dart';
import 'package:travel_money_app/screens/view_models/gastos_store.dart';
import 'package:travel_money_app/screens/views/gasto/components/dialog_gasto.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../domain/models/gasto.dart';

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
  late final GastoStore gastoStore;
  @override
  void initState() {
    super.initState();
    gastoStore = GastoStore(idViagem: widget.viagem.idViagem!);
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    return TemplateScaffold(
      viagemName: widget.viagem.lugar,
      body: ListenableBuilder(
          listenable: gastoStore,
          builder: (context, child) {
            return Column(
              children: [
                ListTile(
                  leading: const Image(
                    image: AssetImage('assets/expenses.png'),
                    width: 30,
                  ),
                  title: Text(
                    '${loc.leadingGastoList}: ${loc.numberOfDataPoints(gastoStore.getValorGastoTotal)}',
                    textAlign: TextAlign.justify,
                    style: const TextStyle(fontSize: 14),
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Image(
                        image: AssetImage('assets/coin.png'),
                        width: 25,
                      ),
                      Text(
                        ' ${loc.budgetFieldTitle}: ',
                        style: const TextStyle(fontSize: 14),
                      ),
                      Text(
                        loc.numberOfDataPoints(
                          widget.viagem.orcamento.toDouble(),
                        ),
                        style: const TextStyle(fontSize: 14),
                      )
                    ],
                  ),
                ),
                const Divider(
                  height: 3,
                ),
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.all(0),
                    itemBuilder: (context, index) {
                      final gasto = gastoStore.gastos[index];
                      return ListTile(
                        onTap: () => showDialog<String>(
                          context: context,
                          builder: (BuildContext context) =>
                              DialogCreateOrEditGastos(
                            gasto: gasto,
                            idViagem: widget.viagem.idViagem!,
                            saveGasto: (Gasto gasto) =>
                                gastoStore.saveGasto(gasto),
                            updateGasto: (Gasto gasto) =>
                                gastoStore.updateGasto(gasto),
                            deleteGasto: (Gasto gasto) =>
                                gastoStore.deleteGasto(gasto.idGasto!),
                          ),
                        ),
                        leading: Image.asset(
                          gastoStore.idCategoryToIconUlr[gasto.categoria]!,
                          width: 40,
                        ),
                        title: Text(gasto.titleGasto),
                        subtitle: Text(
                          '${loc.shortDate(gasto.dataGasto)} ${loc.shortTime(gasto.dataGasto)}',
                        ),
                        trailing: Text(
                          loc.numberOfDataPoints(gasto.preco.toDouble()),
                          style: const TextStyle(fontSize: 16),
                        ),
                      );
                    },
                    itemCount: gastoStore.gastosCount,
                  ),
                ),
              ],
            );
          }),
      onPressedFloatingActionButton: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => DialogCreateOrEditGastos(
          idViagem: widget.viagem.idViagem!,
          saveGasto: (gasto) => gastoStore.saveGasto(gasto),
          updateGasto: (gasto) => gastoStore.updateGasto(gasto),
        ),
      ),
    );
  }
}
