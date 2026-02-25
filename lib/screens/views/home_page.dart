import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_money_app/core/template_scaffold.dart';
import 'package:travel_money_app/screens/view_models/ad_mob_store.dart';
import 'package:travel_money_app/screens/views/viagem/components/dialog_viagem.dart';
import 'package:travel_money_app/screens/views/viagem/viagem_list.dart';

import '../view_models/viagens_store.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  final adMob = AdMobStore();

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
      body: SingleChildScrollView(
        child: Card(
          margin: EdgeInsets.all(15),
          child: ListenableBuilder(
              listenable: adMob,
              builder: (context, child) {
                return ViagemList(
                  adMobBanner: adMob.ad,
                );
              }),
        ),
      ),
    );
  }
}
