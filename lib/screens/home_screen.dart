import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:travel_money_app/core/widgets/custom_drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          AppLocalizations.of(context)!.appTitle,
        ),
      ),
      body: Column(
        children: [
          Center(
            child: Text(
              AppLocalizations.of(context)!.hello('Willian'),
              style: const TextStyle(fontSize: 24.0),
            ),
          ),
          Center(
            child: Text(
              AppLocalizations.of(context)!.numberOfDataPoints(1200.0),
              style: const TextStyle(fontSize: 24.0),
            ),
          ),
        ],
      ),
    );
  }
}
