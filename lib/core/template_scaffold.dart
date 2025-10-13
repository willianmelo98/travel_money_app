import 'package:flutter/material.dart';
import 'package:travel_money_app/core/l10n/app_localizations.dart';

import 'package:travel_money_app/core/custom_drawer.dart';

class TemplateScaffold extends StatelessWidget {
  final Widget body;
  final String? viagemName;
  final Function()? onPressedFloatingActionButton;
  const TemplateScaffold({
    Key? key,
    required this.body,
    this.viagemName,
    this.onPressedFloatingActionButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: const Color.fromRGBO(104, 58, 183, 1),
        title: Text(
          viagemName ?? AppLocalizations.of(context)!.appTitle,
          style: const TextStyle(color: Colors.white),
        ),
      ),
      body: body,
      floatingActionButton: onPressedFloatingActionButton == null
          ? null
          : FloatingActionButton(
              onPressed: onPressedFloatingActionButton,
              child: const Icon(Icons.add),
            ),
    );
  }
}
