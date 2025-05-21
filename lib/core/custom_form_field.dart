import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// ignore: must_be_immutable
class CustomFormField extends StatelessWidget {
  TextEditingController controller;
  TextInputType keyboardType;
  String labelText;
  String? hintText;
  String warningMessage;
  List<TextInputFormatter>? inputFormatter;
  CustomFormField(
      {Key? key,
      required this.controller,
      required this.keyboardType,
      required this.labelText,
      this.hintText,
      required this.warningMessage,
      this.inputFormatter})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      inputFormatters: inputFormatter,
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.always,
        labelText: labelText,
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.red, width: 1.5),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.red, width: 1.5),
        ),
      ),
      validator: (String? value) {
        if (value == null || value.isEmpty) {
          return warningMessage;
        }
        return null;
      },
    );
  }
}
