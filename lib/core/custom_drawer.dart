import 'package:flutter/material.dart';
import 'package:travel_money_app/screens/views/home_page.dart';
import 'package:travel_money_app/screens/views/viagem/viagem_list.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    Key? key,
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
          InkWell(
              onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => HomePage(),
                    ),
                  ),
              child: Center(
                child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(100, 200, 199, 199),
                        borderRadius: BorderRadius.circular(10)),
                    width: 150,
                    child: Text(
                      AppLocalizations.of(context)!.buttonHome,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Color.fromRGBO(104, 58, 183, 1)),
                    )),
              )),
          ViagemList(),
        ],
      ),
    );
  }
}
