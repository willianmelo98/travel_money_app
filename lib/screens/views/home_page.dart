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
      onPressedFloatingActionButton: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => const DialogCreateOrEditViagem(),
      ),
      body: const SingleChildScrollView(
        child: Card(
          margin: EdgeInsets.all(15),
          child: ViagemList(),
        ),
      ),
    );
  }
}
