import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:travel_money_app/core/template_scaffold.dart';
import 'package:travel_money_app/screens/views/viagem/components/dialog_viagem.dart';
import 'package:travel_money_app/screens/views/viagem/viagem_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TemplateScaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 13),
              child: Text(
                AppLocalizations.of(context)!.welcome,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
            ),
            const Card(
              margin: EdgeInsets.all(15),
              child: ViagemList(),
            ),
            ElevatedButton(
              onPressed: () => showDialog<String>(
                context: context,
                builder: (BuildContext context) =>
                    const DialogCreateOrEditViagem(),
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
  }
}
