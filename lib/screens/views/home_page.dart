import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:travel_money_app/screens/views/viagem/components/custom_drawer.dart';
import 'package:travel_money_app/screens/views/viagem/components/dialog_viagem.dart';
import 'package:travel_money_app/screens/views/viagem/viagem_list.dart';
import '../view_models/viagens_store.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  final ViagensStore _store = ViagensStore();

  @override
  void initState() {
    super.initState();
    _store.getViagens();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
        listenable: _store,
        builder: (context, snapshot) {
          return Scaffold(
            drawer: CustomDrawer(
              viagensStore: _store,
            ),
            appBar: AppBar(
              foregroundColor: Colors.white,
              backgroundColor: const Color.fromRGBO(104, 58, 183, 1),
              title: Text(
                AppLocalizations.of(context)!.appTitle,
                style: const TextStyle(color: Colors.white),
              ),
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Card(
                    margin: const EdgeInsets.all(15),
                    child: ViagemList(
                      viagensStore: _store,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () => showDialog<String>(
                      context: context,
                      builder: (BuildContext context) =>
                          DialogCreateOrEditViagem(
                              saveViagem: _store.saveViagens),
                    ),
                    child: Text(
                      AppLocalizations.of(context)!.addTrip,
                      style: const TextStyle(
                        color: Color.fromRGBO(104, 58, 183, 1),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
