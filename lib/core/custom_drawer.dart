import 'package:flutter/material.dart';
import 'package:travel_money_app/screens/views/home_page.dart';
import 'package:travel_money_app/screens/views/viagem/viagem_list.dart';
import 'package:travel_money_app/core/l10n/app_localizations.dart';

import '../screens/view_models/ad_mob_store.dart';

class CustomDrawer extends StatelessWidget {
  final AdMobStore adMobStore = AdMobStore();

  CustomDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        spacing: 20,
        mainAxisSize: MainAxisSize.max,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Color.fromRGBO(104, 58, 183, 1),
            ),
            child: SizedBox(
              width: double.infinity,
            ),
          ),
          ElevatedButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const HomePage(),
              ),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor:
                  const Color.fromRGBO(104, 58, 183, 1), // Roxo claro
              foregroundColor: Colors.white, // Cor do texto
              minimumSize: const Size(100, 50), // Largura total e altura fixa
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8), // Arredondamento suave
              ),
              elevation: 0, // Sem sombra
            ),
            child: Text(
              AppLocalizations.of(context)!.buttonHome,
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: ListenableBuilder(
                listenable: adMobStore,
                builder: (context, child) {
                  return ViagemList(adMobBanner: adMobStore.ad);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
