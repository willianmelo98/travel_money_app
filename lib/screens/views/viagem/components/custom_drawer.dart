import 'package:flutter/material.dart';
import 'package:travel_money_app/screens/view_models/viagens_store.dart';
import 'package:travel_money_app/screens/views/viagem/viagem_list.dart';

class CustomDrawer extends StatelessWidget {
  final ViagensStore viagensStore;
  const CustomDrawer({
    Key? key,
    required this.viagensStore,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Color.fromRGBO(104, 58, 183, 1),
            ),
            child: SizedBox(),
          ),
          ViagemList(
            viagensStore: viagensStore,
          ),
        ],
      ),
    );
  }
}
